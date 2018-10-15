from libs.utils import render_template


def index(request):
    return render_template('index.html', {}, request)