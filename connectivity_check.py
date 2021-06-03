def dfs_check(mas, start=0, visited=None, recursive=False):
    
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

    for next in graph[start] - visited:
        if next not in visited:
            dfs_check(mas, next, visited, True)
   
    if recursive:
        return visited 
    else:
        return len(visited)