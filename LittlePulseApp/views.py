from django.shortcuts import (render,
                              redirect)
from django.core.files.storage import FileSystemStorage
from datetime import datetime, timedelta
from django.template.defaulttags import register
from itertools import groupby
from operator import itemgetter
from .utils import *
import calendar, json

@register.filter
def format_string(string):
    return string.replace("_", " ").title()

@register.filter
def get_nearest_date(day):
    day_index = list(calendar.day_name).index(day)
    today = datetime.today()
    days_until = (day_index - today.weekday()) % 7 or 7
    return (today + timedelta(days=days_until)).date()

def home(request):
    return render(request, "Common/Home.html")

def login(request):
    invalid = None
    if request.method == "POST":
        username = request.POST["username"]
        password = request.POST["password"]
        qry_1 = f"select * from logdata where username = '{username}' and password = '{password}'"
        user = selectone(qry_1)
        if user:
            request.session["username"] = username
            request.session["utype"] = user[3]
            return redirect("home")
        else:
            invalid = True
    return render(request, "Common/Login.html", {"invalid": invalid})

def add_entity(request, role):
    success = None
    if request.method == "POST":
        name = request.POST["name"]
        photo = request.FILES["photo"]
        username = request.POST["username"]
        password = request.POST["password"]
        contact = request.POST["contact"]
        address = request.POST["address"]
        conception_date = request.POST.get("conception_date", "")
        qry_1 = f"insert into logdata values ('', '{username}', '{password}', '{role}')"
        success = iud(qry_1)
        if success:
            fs = FileSystemStorage()
            fs.save(f"{role}s/{photo.name}", photo)
            _username = request.session.get("username")
            _username = f"'{_username}'" if _username else "null"
            if role == "patient": additional_info = f", {_username}, '{conception_date}'"
            elif role == "doctor": additional_info = f", {_username}"
            else: additional_info = ""
            qry_2 = f"""insert into {role}s values ('', '{name}', '{photo.name}', 
                        '{username}', '{contact}', '{address}'{additional_info})"""
            iud(qry_2)
    return render(request, "Common/AddEntity.html", {"success": success})

def add_article(request):
    success = None
    if request.method == "POST":
        title = request.POST["title"]
        image = request.FILES["image"]
        week = request.POST["week"]
        article = request.POST["article"]
        qry_1 = "insert into articles values ('', %s, %s, %s, %s)"
        try:
            cursor.execute(qry_1, [title,
                                   image.name,
                                   week,
                                   article])
            connection.commit()
            fs = FileSystemStorage()
            fs.save(f"articles/{image.name}", image)
            success = True
        except pymysql.err.IntegrityError:
            success = False
    return render(request, "Admin/AddArticle.html", {"success": success})

def view_articles(request):
    qry_1 = "select * from articles order by id desc"
    articles = selectall(qry_1)
    return render(request, "Patient/ViewArticles.html", {"articles": articles})

def manage_schedule(request):
    username = request.session["username"]
    success = None
    qry_1 = "select * from slots"
    data = [list(slot) for slot in selectall(qry_1)]
    slots = {day: list(slot) for day, slot in groupby(data, itemgetter(1))}
    qry_2 = f"select exists(select 1 from schedules where doctor = '{username}')"
    exists = selectone(qry_2)[0]
    if request.method == "POST":
        schedule = {key: (int(value) if value else 0) for key, value in \
                    request.POST.items() if key != "csrfmiddlewaretoken"}
        if exists:
            qry_3 = f"update schedules set schedule = '{json.dumps(schedule)}' where doctor = '{username}'"
        else:
            qry_3 = f"insert into schedules values ('', '{username}', '{json.dumps(schedule)}')"
        success = iud(qry_3)
    if exists or success:
        qry_4 = f"select schedule from schedules where doctor = '{username}'"
        schedule = json.loads(selectone(qry_4)[0])
        for day in slots:
            for slot in slots[day]:
                slot.append(schedule[f"{slot[0]}"])
    return render(request, "Doctor/ManageSchedule.html", {"slots": slots,
                                                          "success": success})

def view_patients(request, doctor=None):
    if request.session["utype"] == "admin":
        qry_1 = "select * from patients"
    else:
        doctor_ = doctor if doctor else request.session["username"]
        qry_1 = f"select * from patients where doctor = '{doctor_}'"
    patients = selectall(qry_1)
    return render(request, "Common/ViewPatients.html", {"patients": patients})

def view_appointments(request):
    qry_1 = f"""select distinct date from appointments where 
                doctor = '{request.session["username"]}' and date >= curdate()"""
    dates = selectall(qry_1)
    qry_2 = f"""select appointments.*, patients.*, slots.time from appointments
                join patients on appointments.patient = patients.username
                join slots on appointments.slot = slots.id
                where appointments.doctor = '{request.session['username']}'
                and appointments.date >= curdate()
                order by appointments.date asc, appointments.slot"""
    appointments = selectall(qry_2)
    return render(request, "Doctor/ViewAppointments.html", {"dates": dates,
                                                            "appointments": appointments})

def add_report(request, patient_id=None):
    success = None
    z=request.session["username"]
    if not patient_id:
        qry_1 = f"select id from patients where username = '{z}'"
        patient_id = selectone(qry_1)[0]
    if request.method == "POST":
        data = {key: value for key, value in request.POST.items() if key != "csrfmiddlewaretoken"}
        qry_1 = f"insert into reports values ('', {patient_id}, '{datetime.today()}', '{json.dumps(data)}')"
        success = iud(qry_1)
    return render(request, "Common/AddReport.html", {"success": success})

def view_reports(request, patient_id=None):
    z=request.session["username"]
    if not patient_id:
        qry_1 = f"select id from patients where username = '{z}'"
        patient_id = selectone(qry_1)[0]
    qry_2 = f"select * from reports where patient = {patient_id}"
    reports = selectall(qry_2)
    return render(request, "Common/ViewReports.html", {"reports": reports})

def view_report(request, id):
    qry_1 = f"select * from reports where id = {id}"
    report = json.loads(selectone(qry_1)[3])
    data = [float(value) for value in report.values()]
    result = predict_fetal_health(data)
    out = {0: "normal", 
           1: "suspect", 
           2: "pathological"}
    return render(request, "Common/ViewReport.html", {"report": report,
                                                      "result": out[result]})

def upload_result(request):
    success = None
    if request.method == "POST":
        title = request.POST["title"]
        date = request.POST["date"]
        result = request.FILES["result"]
        description = request.POST["description"]
        fs = FileSystemStorage()
        fs.save(f"results/{result.name}", result)
        z=request.session["username"]
        qry_2 = f"""insert into results values ('', '{z}', '{title}',
                    '{date}', '{result.name}', '{description}')"""
        success = iud(qry_2)
    return render(request, "Patient/UploadResult.html", {"success": success})

def view_results(request, patient=None):
    if not patient: patient = request.session["username"]
    qry_1 = f"select * from results where patient = '{patient}'"
    results = selectall(qry_1)
    return render(request, "Common/ViewResults.html", {"results": results})

def view_entities(request, entity, hospital=None):
    if entity == "hospital":
        qry_1 = f"select * from {entity}s"
    else:
        qry_1 = f"select * from {entity}s where hospital = '{hospital}'"
    entities = selectall(qry_1)
    return render(request, "Common/ViewEntities.html", {"entities": entities})

def book_appointment(request, doctor):
    success = None
    if request.method == "POST":
        slot_id = request.POST["slot_id"]
        date = datetime.strptime(request.POST["date"], "%B %d, %Y").strftime("%Y-%m-%d")
        z=request.session["username"]
        qry_1 = f"""insert into appointments values ('', '{slot_id}', 
                    '{doctor}', '{z}', '{date}')"""
        success = iud(qry_1)
    qry_2 = f"select * from slots"
    data = [list(slot) for slot in selectall(qry_2)]
    slots = {day: list(slot) for day, slot in groupby(data, itemgetter(1))}
    days = list(calendar.day_name)
    today = datetime.today().strftime('%A')
    today_index = days.index(today)
    days = days[today_index + 1:] + days[:today_index + 1]
    slots = {day: slots[day] for day in days}
    qry_3 = f"select schedule from schedules where doctor = '{doctor}'"
    schedule = json.loads(selectone(qry_3)[0]) if selectone(qry_3) else None
    if schedule:
        for day in slots:
            nearest_date = get_nearest_date(day)
            for slot in slots[day]:
                total_appointments = schedule[f"{slot[0]}"]
                qry_4 = f"""select count(*) from appointments where 
                            slot = '{slot[0]}' and doctor = '{doctor}' 
                            and date = '{nearest_date}'"""
                booked_appointments = selectone(qry_4)[0]
                slot.append(bool(total_appointments - booked_appointments))
    return render(request, "Patient/BookAppointment.html", {"success": success, 
                                                            "schedule": bool(schedule),
                                                            "slots": slots})

def due_date(request):
    z=request.session["username"]
    qry_1 = f"select conception_date from patients where username = '{z}'"
    conception_date = datetime.strptime(str(selectone(qry_1)[0]), "%Y-%m-%d")
    due_date = conception_date + timedelta(weeks=40)
    week = (datetime.today() - conception_date).days // 7
    qry_2 = f"select * from articles where week = {week}"
    articles = selectall(qry_2)
    return render(request, "Patient/DueDate.html", {"due_date": due_date,
                                                    "week": week,
                                                    "articles": articles})

def logout(request):
    request.session.flush()
    return redirect("home")