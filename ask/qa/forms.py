from django import forms
from .models import Question, Answer
from django.contrib.auth.models import User
from django.core.exceptions import ValidationError
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.forms import AuthenticationForm
from django.views.generic.edit import FormView
from django.contrib.auth.forms import UserCreationForm


# class RegisterFormView(FormView):
#     form_class = UserCreationForm
#
#     # Ссылка, на которую будет перенаправляться пользователь в случае успешной регистрации.
#     # В данном случае указана ссылка на страницу входа для зарегистрированных пользователей.
#     success_url = "../login/"
#
#     # Шаблон, который будет использоваться при отображении представления.
#     template_name = "registration/register.html"
#
#     def form_valid(self, form):
#         # Создаём пользователя, если данные в форму были введены корректно.
#         form.save()
#
#         # Вызываем метод базового класса
#         return super(RegisterFormView, self).form_valid(form)


class AskForm(forms.Form):
    title = forms.CharField(max_length=100, label='Заголовок')
    text = forms.CharField(widget=forms.Textarea, label='Текст')

    def save(self):
        self.cleaned_data['author'] = self.user
        post = Question(**self.cleaned_data)
        post.save()
        return post


class AnswerForm(forms.Form):
    text = forms.CharField(label='Ваш ответ', widget=forms.Textarea, max_length=255, min_length=1)
    question = forms.ModelChoiceField(queryset=Question.objects, empty_label=None, widget=forms.HiddenInput)

    def save(self):
        self.cleaned_data['author'] = self.user
        post = Answer(**self.cleaned_data)
        post.save()
        return post

#
#
#
#


class My_sign_upForm(forms.Form):
    username = forms.CharField(label='Логин', min_length=3, max_length=255)
    email = forms.EmailField(label='email')
    password = forms.CharField(label='Пароль', min_length=6, max_length=255, widget=forms.PasswordInput)

    def clean(self):
        try:
            user = User.objects.get(username=self.cleaned_data['username'])

            if user is not None:
                raise ValidationError('Не правильный логин или пароль')
        except User.DoesNotExist:
            return self.cleaned_data

    def save(self, request):
        logout(request)
        user = User.objects.create_user(self.cleaned_data['username'], self.cleaned_data['email'],
                                        self.cleaned_data['password'])
        user.save()
        user = authenticate(username=self.cleaned_data['username'], password=self.cleaned_data['password'])
        login(request, user)
        return user


class My_loginForm(forms.Form):
    username = forms.CharField(label='Логин', min_length=3, max_length=255)
    password = forms.CharField(label='Пароль', min_length=6, max_length=255, widget=forms.PasswordInput)

    def clean(self):
        try:
            username = self.cleaned_data['username']
            password = self.cleaned_data['password']

            self.user_ = authenticate(username=username, password=password)

            if self.user_ is None:
                raise ValidationError('Не правильный логин или пароль')
        except:
            raise ValidationError('Не правильный логин или пароль')

        return self.cleaned_data

    def save(self, request):
        logout(request)
        login(request, self.user_)
        return self.user_
