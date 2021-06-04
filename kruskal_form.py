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
        # Sorting input edges by weight
    edges = sorted(mas, key=lambda item: item[2])
    # Adding first edge (with smallest weight) to result list and deleting it from input edges.
    result = [edges.pop(0)]
    # Adding to array first set of expanded points.
    array = [{result[0][0], result[0][1]}]
    
    # For each edge in sorted list (without deleted first)
    for edge in edges:
        # Looking for start point occurrences in expanded points sets and trying to get set index.
        start_connection = next(iter([i for i in range(len(array)) if edge[0] in array[i]]), None)
        # Looking for end point occurrences in expanded points sets and trying to get set index.
        end_connection = next(iter([i for i in range(len(array)) if edge[1] in array[i]]), None)
    
        # If edge makes cycle - skip it.
        if start_connection is not None and start_connection == end_connection:
            continue
    
        # Adding edge to result list.
        result.append(edge)
        # If edge first point found in expanded points set - add second edge point.
        if start_connection is not None:
            array[start_connection].add(edge[1])
        # If edge second point found in expanded points set - add first edge point.
        if end_connection is not None:
            array[end_connection].add(edge[0])
    
        # If edge is not connected with any chains - add new set of expanded points. (new chain)
        if start_connection is None and end_connection is None:
            array.append({edge[0], edge[1]})
    
        # If edge connects two chains - merge these chains. (union from two expanded points sets)
        if start_connection is not None and end_connection is not None:
            array.append(array[start_connection].union(array[end_connection]))
            array = [array[i] for i in range(len(array)) if i != start_connection and i != end_connection]

    with open('data/kruskal_data.txt', 'w') as file:
        solutions[id+1]={'data':datetime.now().strftime("%Y-%m-%d %H:%M:%S"),'input':mas, 'output':result}
        json.dump(solutions, file)
    file.close()
    return template('kruskal_solution',id=id+1, rows=int(request.forms.get('num')),title='Kruskal', message='Kruskal`s algorithm', year=datetime.now().year)

