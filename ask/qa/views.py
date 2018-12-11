from django.shortcuts import render

# Create your views here.
from django.http import HttpResponse
def test(request, *args, **kwargs):
	return HttpResponse('Ok')


def new_page_paginator(request, *args, **kwargs):
	resp = request.GET.get('page')
	return HttpResponse('OK_page'+resp)


def popular_list(request, *args, **kwargs):
	return HttpResponse('OK_list')

def question_page(request, *args, **kwargs):
	return HttpResponse('OK_question')

def post_details(request, *args, **kwargs):
	return HttpResponse('OK_TEST')