% rebase('layout.tpl', title='Home Page', year=year)

<h2>{{ title }}</h2>
<h3>{{ message }}</h3>

<p>Given a graph G = (V, E), and select the original vertex s. Breadth First Search systematically traverses all edges of G to "open" all vertices reachable from s, calculating the distance (minimum number of edges) from s to each reachable from s vertices.</p>
<ol>
<li>Place the node from which the search starts in the initially empty queue.</li>
<li>Extract node u from the head of the queue and mark it as expanded.</li>
<ul>
<li>If node u is the target node, then complete the search with the result "success".</li>
<li>Otherwise, all successors of node u that are not yet deployed and are not in the queue are added to the end of the queue.</li>
</ul>
<li>If the queue is empty, then all nodes of the connected graph have been scanned, therefore, the target node is unreachable from the initial one; end the search with the result "failure".</li>
<li>Return to item 2.</li>
</ol>
<p>Note: dividing vertices into expanded and not expanded is necessary for an arbitrary graph (since it may contain cycles). For a tree, this operation is not needed, since each vertex will be selected only once.</p>
<img src=https://upload.wikimedia.org/wikipedia/commons/4/46/Animated_BFS.gif >
<p>Number of vertices in the graph</p>
<input type="number" size="1">
<p></p>
<p>Vertex adjacency matrix</p>

<p>Vertex - start of traversal</p>
<input type="text" size="5">
<p></p>
<p></p>
<p></p>
<p></p>
<input type="button" value="Calculate">