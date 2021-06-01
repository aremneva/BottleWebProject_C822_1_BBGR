from bottle import post, request, template
import re
import pdb
import json
import os
from datetime import datetime



@post('/Kruskal', method='post')
def kruskal_form():
    return template('kruskal', rows=int(request.forms.get('num')),title='Kruskal', message='Kruskal`s algorithm', year=datetime.now().year)

@post('/Num', method='post')
def kruskal_form():
    rows=int(request.forms.get('num'))
    #если ячейка пустая, то 0
    mas = []
    solutions={}
    for i in range(rows):
        mas.append([0] * rows)
    for i in range(rows):
        for j in range(rows):
            try:
                if i!=j:
                    mas[i][j] = int(request.forms.get('field{}{}'.format(j,i)))
                    mas[j][i] = mas[i][j]
                else:
                    mas[i][j] = 0
            except ValueError:
                mas[i][j] = 0
                mas[j][i] = 0
            finally:
                pass
    if os.stat('data/kruskal_data.txt').st_size !=0: 
        with open('data/kruskal_data.txt', 'r') as file:
            solutions=json.load(file)
            id=len(solutions)
            file.close()
    else:
        id=0
    # тут будет алгоритм решения (поменять mas в output на массив с решением)
    with open('data/kruskal_data.txt', 'w') as file:
        solutions[id+1]={'data':datetime.now().strftime("%Y-%m-%d %H:%M:%S"),'input':mas, 'output':mas}
        json.dump(solutions, file)
    file.close()
    return template('kruskal_solution',id=id+1, rows=int(request.forms.get('num')),title='Kruskal', message='Kruskal`s algorithm', year=datetime.now().year)
