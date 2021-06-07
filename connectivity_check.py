def bfs_check(mas, start=0, visited=None, recursive=False):
    
    graph={}
    for i in range(len(mas)):
        v=[]
        for j in range(len(mas[i])):
            if mas[i][j]!=0:
                v.append(j)
        graph[i] = set(v)

    if visited is None:
        visited = set()
    visited.add(start)

    for neighbour in graph[start] - visited:
        if neighbour not in visited:
            bfs_check(mas, neighbour, visited, True)
   
    if recursive:
        return visited 
    else:
        return len(visited)