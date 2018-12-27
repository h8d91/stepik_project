from django.shortcuts import render

# Create your views here.
from django.http import HttpResponse
from django.core.paginator import Paginator
from .models import Question, Answer
from django.core.urlresolvers import reverse


def test(request, *args, **kwargs):
	return HttpResponse('Ok')


def new_page_paginator(request):
	posts = Question.objects.new()
	limit = request.GET.get('limit', 10)
	page = request.GET.get('page', 1)
	paginator = Paginator(posts, limit)
	paginator.baseurl = reverse('new_page_paginator') + '?page='
	page = paginator.page(page) # Page
	return render(request, 'qa/main.html', {
	'posts': page.object_list,
	'paginator': paginator, 'page': page,
	})


def popular_list(request):
	posts = Question.objects.popular()
	limit = request.GET.get('limit', 10)
	page = request.GET.get('page', 1)
	paginator = Paginator(posts, limit)
	paginator.baseurl = '/?page='
	page = paginator.page(page) # Page
	return render(request, 'qa/main.html', {
	'posts': page.object_list,
	'paginator': paginator, 'page': page,
	})

def question_page(request, *args, **kwargs):
	return HttpResponse('OK_question')
