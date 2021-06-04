% rebase('layout.tpl', title='Home Page', year=year)

    <h1>{{ title }}</h1>
    <h2>{{ message }}</h2>

<br>
<div>
	<form action='/Prim' method='post'>
    <p>Number of graph vertices</p>
    %try:
		<p><input type="Number"  name="num" value={{vertices}} placeholder="Num" min=1 max=15 required/></p> 
        %except NameError:
        <p><input type="Number"  name="num" value=5 placeholder="Num" min=1 max=15 required/></p> 
        %finally:
        <br>
        <p> <input type="submit"  class="button" value="Ok">
        </p>
    </form>
    %try:
    <form action='/Num' method='post'>
    <p><input type="Number"  name="num" value={{vertices}} placeholder="Num" min=1 max=15 hidden></input></p>
        % include('make_weight.tpl', title='make_table', rows=vertices)
    <p> <input type="submit"  class="button" value="Calculate"></p>
    </form>
        %except NameError:
    %pass
    %finally:

</div>
<h3>Prim's algorithm explained</h3>
<div class="uk-panel">
   <p>Prim's algorithm to find minimum cost spanning tree (as Kruskal's algorithm) uses the greedy approach. Prim's algorithm shares a similarity with the shortest path first algorithms.
Prim's algorithm, in contrast with Kruskal's algorithm, treats the nodes as a single tree and keeps on adding new nodes to the spanning tree from the given graph.
To contrast with Kruskal's algorithm and to understand Prim's algorithm better, we shall use the same example:</p>
<img src="https://www.tutorialspoint.com/data_structures_algorithms/images/mst_graph.jpg" alt="Example prim's algorithm">
<h4>Step 1 - Remove all loops and parallel edges</h4>
<img src="https://www.tutorialspoint.com/data_structures_algorithms/images/mst_with_loops.jpg" alt="step 1.1">
<p>Remove all loops and parallel edges from the given graph. In case of parallel edges, keep the one which has the least cost associated and remove all others.</p>
<img src="https://www.tutorialspoint.com/data_structures_algorithms/images/mst_without_loops.jpg" alt="step 1.2">
<h4>Step 2 - Choose any arbitrary node as root node</h4>
<p>In this case, we choose S node as the root node of Prim's spanning tree. This node is arbitrarily chosen, so any node can be the root node. One may wonder why any video can be a root node. So the answer is, in the spanning tree all the nodes of a graph are included and because it is connected then there must be at least one edge, which will join it to the rest of the tree.</p>
<h4>Step 3 - Check outgoing edges and select the one with less cost</h4>
<p>After choosing the root node S, we see that S,A and S,C are two edges with weight 7 and 8, respectively. We choose the edge S,A as it is lesser than the other.</p>
<img src="https://www.tutorialspoint.com/data_structures_algorithms/images/mst_graph_step_1.jpg" alt="Step 3.1">
<p>Now, the tree S-7-A is treated as one node and we check for all edges going out from it. We select the one which has the lowest cost and include it in the tree.</p>
<img src="https://www.tutorialspoint.com/data_structures_algorithms/images/mst_graph_step_2.jpg" alt="Step 3.2">
<p>After this step, S-7-A-3-C tree is formed. Now we'll again treat it as a node and will check all the edges again. However, we will choose only the least cost edge. In this case, C-3-D is the new edge, which is less than other edges' cost 8, 6, 4, etc.</p>
<img src="https://www.tutorialspoint.com/data_structures_algorithms/images/mst_graph_step_3.jpg" alt="Step 3.3">
<p>After adding node D to the spanning tree, we now have two edges going out of it having the same cost, i.e. D-2-T and D-2-B. Thus, we can add either one. But the next step will again yield edge 2 as the least cost. Hence, we are showing a spanning tree with both edges included.</p>
<img src="https://www.tutorialspoint.com/data_structures_algorithms/images/mst_prims_algorithm.jpg" alt="Step 3.4">
<p>We may find that the output spanning tree of the same graph using two different algorithms is same.</p>
</div>
<div class="uk-animation-toggle" tabindex="0">
         <img class="uk-animation-stroke"  src="https://codefightsuserpics.s3.amazonaws.com/tutorials/graphs/prim_in_action.gif" alt="prim animation" uk-svg="stroke-animation: true">
</div>



