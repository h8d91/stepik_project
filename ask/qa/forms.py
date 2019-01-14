from django import forms

class AskForm(forms.Form):
    title = forms.CharField(max_length=100)
    text = forms.CharField(widget=forms.Textarea)

class AnswerForm(forms.Form):
    text = forms.CharField(widget=forms.Textarea)
    question =
