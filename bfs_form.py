from bottle import post, request, template
import re
import pdb
import json
import os
import collections
from datetime import datetime
import connectivity_check



@post('/BFS', method='post')
def bfs_form():
    return template('bfs', vertices=int(request.forms.get('num')),title='BFS', message='BFS algorithm', year=datetime.now().year)

@post('/conn', method='post')
def bfs_form():
    
    vertices=int(request.forms.get('num'))
    start=int(request.forms.get('start'))
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
    if os.stat('data/bfs_data.txt').st_size !=0: 
        with open('data/bfs_data.txt', 'r') as file:
            solutions=json.load(file)
            id=len(solutions)
            file.close()
    else:
        id=0
    check_result = connectivity_check.bfs_check(mas)
    if (check_result==vertices):
        mass = bfs(mas, start)
        with open('data/bfs_data.txt', 'w') as file:
            solutions[id+1]={'data':datetime.now().strftime("%Y-%m-%d %H:%M:%S"), 'vertices':vertices,'input':mas, 'start':start, 'output':mass}
            json.dump(solutions, file)
        file.close()
        return template('bfs_solution', id=id+1, title='BFS', message='Depth-first search', year=datetime.now().year)
    else:
        with open('data/bfs_data.txt', 'w') as file:
            solutions[id+1]={'data':datetime.now().strftime("%Y-%m-%d %H:%M:%S"), 'vertices':vertices,'input':mas, 'start':start, 'output':None}
            json.dump(solutions, file)
        file.close()
        return template('bfs_solution', id=id+1, title='BFS', message='Depth-first search', year=datetime.now().year)

def bfs(mas, start, mas_new=None, visited=None, recursive=False):
    graph={}

    if mas_new==None:
        mas_new=[]
        for i in range(len(mas)):
            mas_new.append([0] * len(mas))

    for i in range(len(mas)):
        v=[]
        for j in range(len(mas[i])):
            if mas[i][j]!=0:
                v.append(j)
        graph[i] = set(v)

    if visited is None:
        visited = set()
    visited.add(start)

    visited.append(start)
    queue.append(start)
    #start = queue.pop(0)

    for neighbour in graph[start] - visited:
        if neighbour not in visited:
            mas_new[start][neighbour]=mas_new[neighbour][start]=1
            visited.append(neighbor)
            queue.append(neighbor)
            (mas, neighbour, mas_new, visited, True)
   
    if recursive:
        return visited 
    else:
        return mas_new

#def calcc(mas, start, mas_new=None, visited=None, recursive=False):
   # Dequeue a vertex from queue
   # vertex = visited.popleft()
    #print(str(vertex) + " ", end="")

        # If not visited, mark it as visited, and
        # enqueue it
   # for neighbour in graph[vertex]:
     #   if neighbour not in visited:
     #       visited.add(neighbour)
     #       mas_new[start][neighbour]=mas_new[neighbour][start]=1
            #queue.append(neighbour)

    


