% rebase('layout.tpl', title='Home Page', year=year)

<h2>{{ title }}</h2>
<h3>{{ message }}</h3>
<p>Kruskal's algorithm finds a minimum spanning forest of an undirected edge-weighted graph. If the graph is connected, it finds a minimum spanning tree. (A minimum spanning tree of a connected graph is a subset of the edges that forms a tree that includes every vertex, where the sum of the weights of all the edges in the tree is minimized. For a disconnected graph, a minimum spanning forest is composed of a minimum spanning tree for each connected component.) It is a greedy algorithm in graph theory as in each step it adds the next lowest-weight edge that will not form a cycle to the minimum spanning forest.</p>
<h3>Algorithm</h3>
<p>-create a forest F (a set of trees), where each vertex in the graph is a separate tree</p>
<p>-create a set S containing all the edges in the graph</p>
<p>-while S is nonempty and F is not yet spanning: </p>
<p>--remove an edge with minimum weight from S</p>
<p>--if the removed edge connects two different trees then add it to the forest F, combining two trees into a single tree</p>
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