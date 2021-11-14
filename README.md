### djapp
First Django App
### Django Shell
```
manage.py shell

>>> from polls.models import Choice, Question

>>> Question.objects.all()

>>> Choice.objects.all()

>>> from polls.models import Choice, Question
>>> from django.utils import timezone

>>> q = Question.objects.get(id=2)
>>> q
<Question: Woohoo or Yahoo?>

>>> q.pub_date
datetime.datetime(2021, 11, 8, 1, 45, 35, 645466, tzinfo=<UTC>)

>>> q.recently_published()
True

>>> c = Choice.objects.first()
>>> c
<Choice: id: 1, question_id: 2, choice_text: Not much, votes: 0>

>>> c.choice_text = 'Hello I Bobu Frik'
>>> c.save()
>>> c
<Choice: id: 1, question_id: 2, choice_text: Hello I , votes: 0>

>>> c = Choice.objects.first()
>>> c
<Choice: id: 1, question_id: 2, choice_text: Hello I , votes: 0>

>>> q = Question.objects.first()
>>> q
<Question: id: 1, question_text: What's up?, pub_date: 2021-11-08 01:36:58.817372+00:00>
>>> q.choice_set.all()
<QuerySet [<Choice: id: 3, question_id: 1, choice_text: Not much, votes: 0>, <Choice: id: 4, estion_id: 1, choice_text: Not Much, votes: 3>]>

>>> q.choice_set.count()
2

>>> q.choice_set.first()
<Choice: id: 3, question_id: 1, choice_text: Not much, votes: 0>

```
