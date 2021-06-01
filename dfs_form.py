from bottle import post, request, template
import re
import pdb
import json
import os
from datetime import datetime

@post('/DFS', method='post')
def dfs_form():
    return template('dfs', vertices=int(request.forms.get('nodesNum')),title='DFS', message='Depth-first search', year=datetime.now().year)

@post('/DFS_input', method='post')
def dfs_form():
    vertices=int(request.forms.get('nodesNum'))
    start=int(request.forms.get('start'))-1
    #если ячейка пустая, то 0
    mas = []
    solutions={}
    for i in range(vertices):
        mas.append([0] * vertices)
    for i in range(vertices):
        for j in range(vertices):
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
    if os.stat('data/dfs_data.txt').st_size !=0: 
        with open('data/dfs_data.txt', 'r') as file:
            solutions=json.load(file)
            id=len(solutions)
            file.close()
    else:
        id=0
    graph={}
    mas_new=[]
    for i in range(len(mas)):
        v=[]
        mas_new.append([0] * vertices)
        for j in range(len(mas[i])):
            if mas[i][j]!=0:
                v.append(j)
        graph[i] = set(v)
    mass = dfs(graph, start, mas_new, None)
    with open('data/dfs_data.txt', 'w') as file:
        solutions[id+1]={'data':datetime.now().strftime("%Y-%m-%d %H:%M:%S"), 'vertices':vertices,'input':mas, 'start':start, 'output':mass}
        json.dump(solutions, file)
    file.close()
    return template('dfs_solution', id=id+1, title='DFS', message='Depth-first search', year=datetime.now().year)

def dfs(graph, start, mass, visited=None, recursive=False):
    if visited is None:
        visited = set()
    visited.add(start)

    for next in graph[start] - visited:
        mass[start][next]=mass[next][start]=1
        dfs(graph, next, mass, visited, True)
        if recursive:
            return visited 
        else:
            return mass
