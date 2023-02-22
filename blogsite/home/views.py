from django.http import HttpResponseRedirect
from django.contrib import auth
from django.contrib import messages

from libs.functions import render_template


def index(request):
    return render_template('index.html', {}, request)

def login(request):
    username = request.POST['user'];
    password = request.POST['password']
    redirect_url = request.GET['r']

    user = auth.authenticate(username=username, password=password)

    if username == "" or password == "":
        messages.warning(request, "Login failed. User name and password can not be blank.")
    elif user is not None:
        auth.login(request, user)
    else:
        messages.error(request, "Login failed. User name or password is wrong!", extra_tags="danger")

    return HttpResponseRedirect(redirect_url)

def logout(request):
    redirect_url = request.GET['r']

    auth.logout(request)
    messages.info(request, "Logout successfully!")

    return HttpResponseRedirect(redirect_url)