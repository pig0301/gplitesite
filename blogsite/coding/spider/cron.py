import requests, datetime
from bs4 import BeautifulSoup


def query_storage():
    url = 'http://127.0.0.1:8000/coding/spider/storage/query/'
    response = requests.get(url)
    html = response.content
    
    soup = BeautifulSoup(html, 'html.parser')
    table = soup.find('table')
    
    print('-' * 30)
    print(datetime.datetime.now())
    print('-' * 30)
    print(table.text.strip())
    print('-' * 30 + "\n\n")