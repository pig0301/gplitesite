'''
Created on 2026年4月28日

@author: GPLite
'''

# stock_monitor/tasks.py

def test_task(name):
    import datetime
    print(f"[{datetime.datetime.now()}] 你好 {name}，Worker 正在工作！")