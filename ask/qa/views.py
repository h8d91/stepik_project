from django.shortcuts import render

# Create your views here.
from django.http import HttpResponse, Http404, HttpResponseRedirect
from django.core.paginator import Paginator
from .models import Question, Answer
from .forms import AskForm, AnswerForm
from django.core.urlresolvers import reverse


def my_sign_up():
	pass


def my_login():
	pass


def my_logout():
	pass


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


def question_page(request, **kwargs):
	if request.method == "POST":
		form = AnswerForm(request.POST)
		if form.is_valid():
			post = form.save()
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
			'question': question,
			'answers': answers,
			'answerform': answerform,
	})


def create_ask(request):
	if request.method == "POST":
		form = AskForm(request.POST)
		if form.is_valid():
			post = form.save()
			url = post.get_url()
			return HttpResponseRedirect(url)
	else:
		form = AskForm()
	return render(request, 'qa/post_add.html', {'form': form})
