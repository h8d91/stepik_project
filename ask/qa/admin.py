from django.contrib import admin
from .models import Question, Answer

# Register your models here.
# admin.site.register(Question)
class Answers(admin.ModelAdmin):
    list_display = ('text', 'added_at', 'question', 'author')

admin.site.register(Answer, Answers)


class Questions(admin.ModelAdmin):
    list_display = ('title', 'text', 'added_at', 'rating', 'author', 'likes')


admin.site.register(Question, Questions)
