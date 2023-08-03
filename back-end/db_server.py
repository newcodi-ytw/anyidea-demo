from flask import Flask
from flask import request
import mariadb 

cur = 0
def db_server_init():
    global cur
    conn = mariadb.connect(
        user="dbuser",
        password="dbuser191",
        host="localhost",
        database="anyideasdb")
    cur = conn.cursor() 

def get_db_demoData():
    global cur
    #retrieving information
    cur.execute("select count(id) from test_table") 
    for dat in cur: 
        print(dat)
    return dat

app = Flask(__name__)
db_server_init()

# POST endpoint
@app.post('/api/post/<id>')
def create_entry(id):
    data = request.get_json(force=True)
    return data

# GET endpoint
@app.get('/api/get/<id>')
def get_record(id):
    return get_db_demoData()

