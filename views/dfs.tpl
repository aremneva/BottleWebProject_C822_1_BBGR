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

<h4>Find a Spanning Tree</h4>

<form method="post"><b>Vertices amount:</b><br>
   <input type="number" name="nodesNum" min="2" max="9"/>
   <button>Confirm</button>
  </form>



%try:
%include('table.tpl', rows=rows)

<table>
%from bottle import post, request
%nodesNum = 4

%for i in range(3):
<tr>
%for j in range (3):
<td><input type="number" name="f"+i+j size="2" min="1" max="{{nodesNum}}"></td>
%end
</tr>
%end
</table>