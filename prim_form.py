from bottle import post, request, template
import re
import pdb
import json
import os
from datetime import datetime
import connectivity_check


@post('/Prim', method='post')
def prim_form():
    vertices=request.forms.get('num')
    if vertices=="":
        return "Error. You didn't enter a number of graph vertices"
    else:
        return template('prim', vertices=int(request.forms.get('num')),title='Prim', message='Prim`s algorithm', year=datetime.now().year)

@post('/Num', method='post')
def prim_form():
    
    vertices=int(request.forms.get('num'))
    #если ячейка пустая, то 0
    mas_weight = []
    mas_adjancency=[]
    mas_result=[]
    solutions={}
    for i in range(vertices):
        mas_weight.append([0] * vertices)
        mas_adjancency.append([0] * vertices)
        mas_result.append([0] * vertices)
    for i in range(vertices):
        for j in range(vertices):
            try:
                if i!=j:
                    mas_weight[i][j] = int(request.forms.get('field{}{}'.format(j,i)))
                    mas_weight[j][i]= mas_weight[i][j]
                else:
                    mas_weight[i][j] = 0
            except ValueError:
                mas_weight[i][j] = 0
                mas_weight[j][i] = 0
            finally:
                pass

    for i in range(vertices):
        for j in range(vertices):
            try:
                if mas_weight[i][j]>0:
                    mas_adjancency[i][j]=1
                    mas_adjancency[j][i]=1
                else:
                    mas_adjancency[i][j]=0
                    mas_adjancency[j][i]=0
            except ValueError:
                mas_weight[i][j] = 0
                mas_weight[j][i] = 0
            finally:
                pass

    if os.stat('data/prim_data.txt').st_size !=0: 
        with open('data/prim_data.txt', 'r') as file:
            solutions=json.load(file)
            id=len(solutions)
            file.close()
    else:
        id=0
    # тут будет алгоритм решения (поменять mas в output на массив с решением)
    selected =[] 
    for i in range(vertices):
        selected.append(False) #Выбранные вершины
    sum=0  
    ver = 0 #Первая вершина
    selected[0] = True #Отмечаем первую вершину выбранной
    check_result=connectivity_check.dfs_check(mas_adjancency) #Проверка на наличие связей между вершинами
    if (check_result!=vertices):
        mas_result=None
    else:
        while (ver < vertices-1): # Пока не выбранные вершины еще есть
            min = 100 #Изначально минимальное число равно максимальному
            for i in range(vertices):
                if selected[i]:
                    for j in range(vertices):
                        if ((not selected[j]) and mas_weight[i][j]):  #Если вершина еще не была выбрана и связь есть
                            if  mas_weight[i][j]<min: #Если вершина еще не была выбрана и связь есть между выбранной и не 
                                min = mas_weight[i][j]
                                x=i
                                y=j
            sum+=mas_weight[x][y]
            mas_result[x][y]= mas_result[y][x]=mas_weight[x][y]
            selected[y] = True # Отмечаем, что вершина уже была выбрана
            ver += 1

    with open('data/prim_data.txt', 'w') as file:
        solutions[id+1]={'data':datetime.now().strftime("%Y-%m-%d %H:%M:%S"),'input_weight':mas_weight,'input_adjancency':mas_adjancency,  'output':mas_result, 'sum':sum}
        json.dump(solutions, file)
    file.close()
    return template('prim_solution',id=id+1, vertices=int(request.forms.get('num')),title='Prim', message='Prim`s algorithm',year=datetime.now().year)



