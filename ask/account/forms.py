from django import forms


class LoginForm(forms.Form):
    username = forms.CharField(label='Логин', min_length=3, max_length=255)
    password = forms.CharField(label='Пароль', min_length=3, max_length=255, widget=forms.PasswordInput)
