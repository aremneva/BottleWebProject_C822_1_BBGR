% rebase('layout.tpl', title='Home Page', year=year)

<div class="jumbotron">
    <h1>Math Modeling</h1>
    <p class="lead">Elements of graph theory. Undirected graphs. Graph traversals. Spanning trees.</p>
    <p></p>
</div>

<div class="row">
    <div class="col-md-4">
        <h2>BFS</h2>
        <p>
           Breadth-first search (BFS) is an algorithm for traversing or searching tree or graph data structures. It starts at the tree root (or some arbitrary node of a graph, sometimes referred to as a 'search key'), and explores all of the neighbor nodes at the present depth prior to moving on to the nodes at the next depth level. 
        </p>
        <p><a class="btn btn-default" href="/BFS">Learn more &raquo;</a></p>
    </div>
    <div class="col-md-4">
        <h2>DFS</h2>
        <p>Depth-first search (DFS) is an algorithm for traversing or searching tree or graph data structures. The algorithm starts at the root node (selecting some arbitrary node as the root node in the case of a graph) and explores as far as possible along each branch before backtracking.</p>
        <p><a class="btn btn-default" href="/DFS">Learn more &raquo;</a></p>
    </div>
    <div class="col-md-4">
        <h2>Kruskal's algorithm</h2>
        <p>Kruskal's algorithm finds a minimum spanning forest of an undirected edge-weighted graph. If the graph is connected, it finds a minimum spanning tree. (A minimum spanning tree of a connected graph is a subset of the edges that forms a tree that includes every vertex, where the sum of the weights of all the edges in the tree is minimized. For a disconnected graph, a minimum spanning forest is composed of a minimum spanning tree for each connected component.) It is a greedy algorithm in graph theory as in each step it adds the next lowest-weight edge that will not form a cycle to the minimum spanning forest.</p>
        <p><a class="btn btn-default" href="/Kruskal">Learn more &raquo;</a></p>
    </div>
    <div class="col-md-4">
        <h2>Prim's algorithm</h2>
        <p>In computer science, Prim's algorithm is a greedy algorithm that finds a minimum spanning tree for a weighted undirected graph. This means it finds a subset of the edges that forms a tree that includes every vertex, where the total weight of all the edges in the tree is minimized. The algorithm operates by building this tree one vertex at a time, from an arbitrary starting vertex, at each step adding the cheapest possible connection from the tree to another vertex.</p>
        <p><a class="btn btn-default" href="/Prim">Learn more &raquo;</a></p>
    </div>
</div>
