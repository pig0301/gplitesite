from libs.functions import render_template


def index(request):
    return render_template("stock/index.html", {}, request)