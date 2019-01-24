"""ask URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.10/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url, include
from . import views


urlpatterns = [
	url(r'^$', views.main, name='main'),
	url(r'^popular/$', views.popular_list, name='popular_list'),
	url(r'^question/(?P<id>\d+)/$', views.question_page, name='question_page'),
	url(r'^ask/$', views.create_ask, name='create_ask'),
	# url(r'^account/', include('django.contrib.auth.urls')),
	# url(r'^signup/$', views.my_sign_up, name='my_sign_up'),
	# url(r'^login/$', views.my_login, name='my_login'),
	# url(r'^logout/$', views.my_logout, name='my_logout'),
]
