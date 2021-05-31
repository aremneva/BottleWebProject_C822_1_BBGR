% rebase('layout.tpl', title='Home Page', year=year)

<h2>{{ title }}</h2>
<h3>{{ message }}</h3>
<p>Kruskal's algorithm finds a minimum spanning forest of an undirected edge-weighted graph. If the graph is connected, it finds a minimum spanning tree. (A minimum spanning tree of a connected graph is a subset of the edges that forms a tree that includes every vertex, where the sum of the weights of all the edges in the tree is minimized. For a disconnected graph, a minimum spanning forest is composed of a minimum spanning tree for each connected component.) It is a greedy algorithm in graph theory as in each step it adds the next lowest-weight edge that will not form a cycle to the minimum spanning forest.</p>
<h3>Algorithm</h3>
<img class ="image" src="{{get_url('static', filename='img\KruskalDemo.gif')}}">
<p>It falls under a class of algorithms called greedy algorithms that find the local optimum in the hopes of finding a global optimum.</p>
<p>We start from the edges with the lowest weight and keep adding edges until we reach our goal.</p>
<p>The steps for implementing Kruskal's algorithm are as follows:</p>
<p>1. Sort all the edges from low weight to high.</p>
<p>2. Take the edge with the lowest weight and add it to the spanning tree. If adding the edge created a cycle, then reject this edge.</p>
<p>3. Keep adding edges until we reach all vertices.</p>
<p>At the termination of the algorithm, the forest forms a minimum spanning forest of the graph. If the graph is connected, the forest has a single component and forms a minimum spanning tree. </p>
<h3>Proof of correctness</h3>
<p>The proof consists of two parts. First, it is proved that the algorithm produces a spanning tree. Second, it is proved that the constructed spanning tree is of minimal weight. </p>
<h4>Spanning tree</h4>
<p>Let G be a connected, weighted graph and let Y be the subgraph of G produced by the algorithm. Y cannot have a cycle, as by definition an edge is not added if it results in a cycle. Y cannot be disconnected, since the first encountered edge that joins two components of Y would have been added by the algorithm. Thus, Y is a spanning tree of G. </p>
<h4>Minimality</h4>
<p>We show that the following proposition P is true by induction: If F is the set of edges chosen at any stage of the algorithm, then there is some minimum spanning tree that contains F and none of the edges rejected by the algorithm.</p>
<p>-Clearly P is true at the beginning, when F is empty: any minimum spanning tree will do, and there exists one because a weighted connected graph always has a minimum spanning tree.</p>
<p>-Now assume P is true for some non-final edge set F and let T be a minimum spanning tree that contains F.</p>
<p>--If the next chosen edge e is also in T, then P is true for F + e.</p>
<p>--Otherwise, if e is not in T then T + e has a cycle C. This cycle contains edges which do not belong to F, since e does not form a cycle when added to F but does in T. Let f be an edge which is in C but not in F + e. Note that f also belongs to T, and by P has not been considered by the algorithm. f must therefore have a weight at least as large as e. Then T - f + e is a tree, and it has the same or less weight as T. So T - f + e is a minimum spanning tree containing F + e and again P holds.</p>
<h3>Kruskal's vs Prim's Algorithm</h3>
<p>Prim's algorithm is another popular minimum spanning tree algorithm that uses a different logic to find the MST of a graph. Instead of starting from an edge, Prim's algorithm starts from a vertex and keeps adding lowest-weight edges which aren't in the tree, until all vertices have been covered.</p>
<h4>Enter the required values</h4>
<p>number of graph vertices:</p>
<input type ="number">
<p>matrix of weight of branches:</p>
<input type ="number">
<p>Press the button</p>
<input type ="button" value="calculate">
