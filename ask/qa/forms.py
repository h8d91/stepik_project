from django import forms
from .models import Question, Answer
# from django.contrib.auth.models import User


class AskForm(forms.Form):
    title = forms.CharField(max_length=100, label='Заголовок')
    text = forms.CharField(widget=forms.Textarea, label='Текст')

    def save(self):
        self.cleaned_data['author_id'] = 1
        post = Question(**self.cleaned_data)
        post.save()
        return post


class AnswerForm(forms.Form):
    text = forms.CharField(label='Ваш ответ', widget=forms.Textarea, max_length=255, min_length=1)
    question = forms.ModelChoiceField(queryset=Question.objects, empty_label=None, widget=forms.HiddenInput)

    def save(self):
        self.cleaned_data['author_id'] = 1
        post = Answer(**self.cleaned_data)
        post.save()
        return post
