from django.shortcuts import render

# Create your views here.
from django.http import HttpResponse, Http404, HttpResponseRedirect
from django.core.paginator import Paginator
from .models import Question, Answer
from .forms import AskForm, AnswerForm
from django.core.urlresolvers import reverse
from django.contrib.auth.decorators import login_required
from django.contrib.auth import logout


# def my_sign_up(request):
# 	if request.method == 'POST':
# 		form = My_sign_upForm(request.POST)
# 		if form.is_valid():
# 			user = form.save(request)
# 			if user != None:
# 				resp = HttpResponseRedirect('/')  # Replace to request.next
# 				return resp
#
# 	else:
# 		form = My_sign_upForm()
#
# 	return render(request, 'qa/signup.html', {
# 		'form': form,
# 	})
#
#
# def my_login(request):
# 	if request.method == 'POST':
# 		form = My_loginForm(request.POST)
# 		if form.is_valid():
# 			user = form.save(request)
# 			if user != None:
# 				resp = HttpResponseRedirect('/')  # Replace to request.next
# 				return resp
# 	else:
# 		form = My_loginForm()
#
# 	return render(request, 'qa/login.html', {
# 		'form': form,
# 	})
#
#
# def my_logout(request):
# 	if request.method == 'POST':
# 		logout_(request)
# 		return HttpResponseRedirect(request.GET.get('next', '/'))
#
# 	raise Http404


def main(request):
	posts = Question.objects.new()
	limit = request.GET.get('limit', 10)
	page = request.GET.get('page', 1)
	paginator = Paginator(posts, limit)
	paginator.baseurl = reverse('main') + '?page='
	page = paginator.page(page)
	return render(request, 'qa/main.html', {
	'posts': page.object_list,
	'paginator': paginator, 'page': page,
	})


def popular_list(request):
	pop_list = Question.objects.popular()
	limit = request.GET.get('limit', 10)
	page = request.GET.get('page', 1)
	paginator = Paginator(pop_list, limit)
	paginator.baseurl = reverse('popular_list') + '?page='
	page = paginator.page(page)
	return render(request, 'qa/popular.html', {
	'posts': page.object_list,
	'paginator': paginator, 'page': page,
	})


@login_required(login_url='/login/', redirect_field_name='next')
def question_page(request, **kwargs):
	if request.method == "POST":
		form = AnswerForm(request.POST)
		if form.is_valid():
			form.user = request.user
			form.save()
			url = "/question/{}/".format(kwargs['id'])
			return HttpResponseRedirect(url)
		else:
			return HttpResponse('200')

	else:
		try:
			qid = int(kwargs['id'])
			question = Question.objects.get(id=qid)
		except:
			raise Http404

		answers = Answer.objects.filter(question=question).order_by('-added_at').all()
		answerform = AnswerForm(initial={'question': question.id})

		return render(request, 'qa/question.html', {
			'username': request.user.username,
			'question': question,
			'answers': answers,
			'answerform': answerform,
			'authenticated': request.user.is_authenticated(),
	})


@login_required(login_url='/login/', redirect_field_name='next')
def create_ask(request):
	if request.method == "POST":
		form = AskForm(request.POST)
		if form.is_valid():
			form.user = request.user
			post = form.save()
			url = post.get_url()
			return HttpResponseRedirect(url)
	else:
		form = AskForm()
	return render(request, 'qa/post_add.html', {'form': form})
