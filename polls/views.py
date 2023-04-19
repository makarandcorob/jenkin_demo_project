from django.shortcuts import render
import datetime
from django.http import HttpResponse


# Create your views here.

# pass id attribute from urls
def index(request):
    now = datetime.datetime.now()
    msg = f'Today is {now}'
    return HttpResponse(msg, content_type='text/plain')
