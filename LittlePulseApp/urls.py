from django.urls import (path,
                         re_path)
from . import views

appname = "LittlePulse"

urlpatterns = [
    path("", views.home, name="home"),
    path("login", views.login, name="login"),
    path("add_entity/<str:role>/", views.add_entity, name="add_entity"),
    path("add_article", views.add_article, name="add_article"),
    path("view_articles", views.view_articles, name="view_articles"),
    path("manage_schedule", views.manage_schedule, name="manage_schedule"),
    re_path(r"^view_patients/(?P<doctor>[^/]+)?/?$", views.view_patients, name="view_patients"),
    path("view_appointments", views.view_appointments, name="view_appointments"),
    re_path(r"^add_report/(?P<patient_id>\d+)?/?$", views.add_report, name="add_report"),
    re_path(r"^view_reports/(?P<patient_id>\d+)?/?$", views.view_reports, name="view_reports"),
    path("upload_result", views.upload_result, name="upload_result"),
    path("view_report/<int:id>/", views.view_report, name="view_report"),
    re_path(r"^view_results/(?P<patient>[^/]+)?/?$", views.view_results, name="view_results"),
    re_path(r"^view_entities/(?P<entity>[^/]+)(?:/(?P<hospital>[^/]+))?/$", 
            views.view_entities, name="view_entities"),
    path("book_appointment/<str:doctor>/", views.book_appointment, name="book_appointment"),
    path("due_date", views.due_date, name="due_date"),
    path("logout", views.logout, name="logout"),
]