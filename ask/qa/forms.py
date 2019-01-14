from django import forms
from .models import Question, Answer
from django.contrib.auth.models import User


class AskForm(forms.Form):
    title = forms.CharField(max_length=100)
    text = forms.CharField(widget=forms.Textarea)

    def save(self):
        self.cleaned_data['author_id'] = 1
        post = Question(**self.cleaned_data)
        post.save()
        return post


class AnswerForm(forms.Form):
    text = forms.CharField(widget=forms.Textarea)
    question = forms.ChoiceField()

    def save(self):
        self.cleaned_data['author_id'] = 1
        post = Answer(**self.cleaned_data)
        post.save()
        return post
