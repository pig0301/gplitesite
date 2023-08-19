import requests, re, json, datetime
from bs4 import BeautifulSoup

from libs.wechat import send_text_message


def query_goldbar_storage():
    url = 'http://127.0.0.1:8000/coding/spider/storage/query/'
    response = requests.get(url)
    html = response.content
    
    print(html)