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
        # тут будет алгоритм решения
        # сортировка ребер по весу
    edges = sorted(mas, key=lambda item: item[2])
    # добавление 1 ребра (с самым маленьким весом) чтобы получить список результатов и удалить его из входных ребер
    result = [edges.pop(0)]
    # добавление в массив первого набора развернутых точек
    array = [{result[0][0], result[0][1]}]
    
    # для каждого ребра в отсортированном списке (без удаления первого)
    for edge in edges:
        # поиск вхождений начальной точки в расширенных наборах точек и попытка получить индекс набора
        start_connection = next(iter([i for i in range(len(array)) if edge[0] in array[i]]), None)
        # поиск вхождений конечных точек в расширенных наборах точек и попытка получить индекс набора
        end_connection = next(iter([i for i in range(len(array)) if edge[1] in array[i]]), None)
    
        # если ребро делает цикл - пропустите его
        if start_connection is not None and start_connection == end_connection:
            continue
    
        # добавление ребра в список результатов
        result.append(edge)
        # если первая точка ребра найдена в расширенном наборе точек - добавьте вторую точку ребра
        if start_connection is not None:
            array[start_connection].add(edge[1])
        # если вторая точка ребра найдена в расширенном наборе точек - добавьте первую точку ребра
        if end_connection is not None:
            array[end_connection].add(edge[0])
    
        # если ребро не связано ни с какими цепочками - добавьте новый набор развернутых точек. (новая цепочка)
        if start_connection is None and end_connection is None:
            array.append({edge[0], edge[1]})
    
        # если ребро соединяет две цепочки - объедините эти цепочки. (объединение из двух расширенных наборов точек)
        if start_connection is not None and end_connection is not None:
            array.append(array[start_connection].union(array[end_connection]))
            array = [array[i] for i in range(len(array)) if i != start_connection and i != end_connection]

    with open('data/kruskal_data.txt', 'w') as file:
        solutions[id+1]={'data':datetime.now().strftime("%Y-%m-%d %H:%M:%S"),'input':mas, 'output':result}
        json.dump(solutions, file)
    file.close()
    return template('kruskal_solution',id=id+1, rows=int(request.forms.get('num')),title='Kruskal', message='Kruskal`s algorithm', year=datetime.now().year)

