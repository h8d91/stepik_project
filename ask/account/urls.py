from django.conf.urls import url
from .views import dashboard
from django.contrib.auth import views

urlpatterns = [
    url(r'^login/$', views.login, name='login'),
    url(r'^logout/$', views.logout, name='logout'),
    url(r'^password_change/$', views.password_change, name='password_change'),
    url(r'^password_change/done/$', views.password_change_done, name='password_change_done'),
    url(r'^password_reset/$', views.password_reset, name='password_reset'),
    url(r'^password_reset/done/$', views.password_reset_done, name='password_reset_done'),
    url(r'^reset/(?P<uidb64>[0-9A-Za-z_\-]+)/(?P<token>[0-9A-Za-z]{1,13}-[0-9A-Za-z]{1,20})/$',
        views.password_reset_confirm, name='password_reset_confirm'),
    url(r'^reset/done/$', views.password_reset_complete, name='password_reset_complete'),
    url(r'^$', dashboard, name='dashboard'),
]


# from django.contrib.auth.views import login, logout, logout_then_login
#
#
# urlpatterns = [
#     # url(r'^login/$', views.user_login, name='login'),
#     url(r'^login/$', login, name='login'),
#     url(r'^logout/$', logout, name='logout'),
#     url(r'^logout-then-login/$', logout_then_login, name='logout_then_login'),
#     url(r'^$', views.dashboard, name='dashboard'),
# ]
