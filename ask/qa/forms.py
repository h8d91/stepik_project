from django import forms
from .models import Question, Answer
from django.contrib.auth.models import User
from django.core.exceptions import ValidationError
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.forms import AuthenticationForm
from django.views.generic.edit import FormView
from django.contrib.auth.forms import UserCreationForm


class RegisterFormView(FormView):
    form_class = UserCreationForm

    # Ссылка, на которую будет перенаправляться пользователь в случае успешной регистрации.
    # В данном случае указана ссылка на страницу входа для зарегистрированных пользователей.
    success_url = "../login/"

    # Шаблон, который будет использоваться при отображении представления.
    template_name = "registration/register.html"

    def form_valid(self, form):
        # Создаём пользователя, если данные в форму были введены корректно.
        form.save()

        # Вызываем метод базового класса
        return super(RegisterFormView, self).form_valid(form)


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


# class UserAuthenticationForm(AuthenticationForm):
#     username = forms.CharField(label= 'Логин', max_length=20, min_length=3, widget=forms.TextInput(attrs={'autofocus': ''}))
#     email = forms.EmailField(label= 'email')
#     password = forms.CharField(label= 'Пароль', min_length=5, max_length=20, strip=False, widget=forms.PasswordInput)
#


# class LoginForm(forms.Form):