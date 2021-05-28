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
    
    rows=int(request.forms.get('num'))
    #если ячейка пустая, то 0
    mas = []
    for i in range(rows):
        mas.append([0] * rows)
    for i in range(rows):
        for j in range(rows):
            try:
                if i!=j:
                    mas[i][j] = int(request.forms.get('field{}{}'.format(j,i)))
                    mas[j][i] = int(request.forms.get('field{}{}'.format(j,i)))
                else:
                    mas[i][j] = 0
            except ValueError:
                mas[i][j] = 0
                mas[j][i] = 0
            finally:
                pass
    with open('mas_weight.txt', 'w') as file:
        json.dump(mas, file)
    file.close()
    return json.dumps(mas)

