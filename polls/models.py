import datetime

from django.db import models
from django.utils import timezone

class Question(models.Model):
    question_text = models.CharField(max_length=200)
    pub_date = models.DateTimeField('date published')

    def __str__(self):
        text = f'\n  id: {self.id}\n  question_text: {self.question_text}'
        text += f'\n  pub_date: {self.pub_date}\n'
        return text

    def recently_published(self):
        return self.pub_date >= timezone.now() - datetime.timedelta(days=7)


class Choice(models.Model):
    question = models.ForeignKey(Question, on_delete=models.CASCADE)
    choice_text = models.CharField(max_length=200)
    votes = models.IntegerField(default=0)

    def __str__(self):
        text = f'\n  id: {self.id}\n  question_id: {self.question.id}\n  '
        text += f'choice_text: {self.choice_text}\n  votes: {self.votes}\n'
        return text
    