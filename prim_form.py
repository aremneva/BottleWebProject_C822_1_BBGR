from bottle import post, request, template
import re
import pdb
import json
import os
from datetime import datetime



@post('/Prim', method='post')
def prim_form():
    return template('prim', rows=int(request.forms.get('num')),title='Prim', message='Prim`s algorithm', year=datetime.now().year)

@post('/Primm', method='post')
def prim_form():
    return "hello"

