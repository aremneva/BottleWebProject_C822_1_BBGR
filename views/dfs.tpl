% rebase('layout.tpl', title='Home Page', year=year)

<h2>{{ title }}</h2>
<h3>{{ message }}</h3>

<p>Depth first Search or Depth first traversal is a recursive algorithm for searching all the vertices of a graph or tree data structure. Traversal means visiting all the nodes of a graph.</p>

<h4>The Algorithm </h4>

<p>A standard DFS implementation puts each vertex of the graph into one of two categories:</p>
<ol>
<li>Visited</li>
<li>Not Visited</li>
</ol>
<p>The purpose of the algorithm is to mark each vertex as visited while avoiding cycles.</p>
<p>The DFS algorithm works as follows:</p>
<ol>
<li>Start by putting any one of the graph's vertices on top of a stack.</li>
<li>Take the top item of the stack and add it to the visited list.</li>
<li>Create a list of that vertex's adjacent nodes. Add the ones which aren't in the visited list to the top of the stack.</li>
<li>Keep repeating steps 2 and 3 until the stack is empty.</li>
</ol>
<img src="https://upload.wikimedia.org/wikipedia/commons/7/7f/Depth-First-Search.gif" height=250></img>

<!-- mine -->

<h4>Find a Spanning Tree</h4>
<form action='/DFS' method="post">
<b>Nodes amount:</b><br/>
    %try:
   <input type="number" name="nodesNum" min="2" max="9" value={{vertices}} placeholder="2 to 9" required/>
   %except NameError:
        <input type="number" name="nodesNum" min="2" max="9"  placeholder="2 to 9" required/>
   %finally:
   <input type="submit" value="Confirm" class="btn btn-default"/>
  </form>

    %try:
    <form action='/DFS_input' method='post'>
    <input type="number"  name="nodesNum" value={{vertices}} min=1 max=99 hidden/>
    <b>Adjacency matrix (insert 0 or 1 in the cells):</b>
        % include('make_table.tpl', title='make_table', vertices=vertices)
    <b>Start from:</b><br/>
    <input type="number"  name="start" min="1" max="{{vertices}}" placeholder="1 to {{vertices}}" required/>
    <input type="submit" class="button button" value="Calculate">
    </form>
        %except NameError:
    %pass
    %finally:
    %pass