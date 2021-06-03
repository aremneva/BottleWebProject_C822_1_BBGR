% rebase('layout.tpl', title='Home Page', year=year)

<style>
   
   .button {
  background-color: #242425;
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  border-radius: 16px;
}
}
</style>
    <h1>{{ title }}</h1>
    <h2>{{ message }}</h2>
<br>
<div class="uk-panel">
   <p>In computer science, Prim's algorithm is a greedy algorithm that finds a minimum spanning tree for a weighted undirected graph. This means it finds a subset of the edges that forms a tree that includes every vertex, where the total weight of all the edges in the tree is minimized. The algorithm operates by building this tree one vertex at a time, from an arbitrary starting vertex, at each step adding the cheapest possible connection from the tree to another vertex.</p></p>
</div>


 <p>The steps for implementing Prim's algorithm are as follows:
 <ol>
 <li>
 Initialize the minimum spanning tree with a vertex chosen at random
 </li>

 <li>
 Find all the edges that connect the tree to new vertices, find the minimum and add it to the tree
 </li>
 <li>
 Keep repeating step 2 until we get a minimum spanning tree
 </li>
</ol>

<div class="uk-animation-toggle" tabindex="0">
        <img class="uk-animation-stroke"  src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/9b/PrimAlgDemo.gif/300px-PrimAlgDemo.gif" alt="" uk-svg="stroke-animation: true">
</div>

<div class="junbotron">

	<h3>  Prim's algorithm </h3>
	<form action='/Prim' method='post'>
    %try:
		<p><input type="Number"  name="num" value={{rows}} placeholder="Number of graph vertices" min=1 max=99></input></p> 
        %except NameError:
        <p><input type="Number"  name="num" placeholder="Number of graph vertices" min=1 max=99></input></p> 
        %finally:
        <br>
        <p> <input type="submit"  class="button button" value="Ok"></p>
    </form>
    %try:
    <form action='/Num' method='post'>
    <p><input type="Number"  name="num" value={{rows}} placeholder="Number of graph vertices" min=1 max=99 hidden></input></p> 
        % include('make_weight.tpl', title='make_table', rows=rows)
    <p> <input type="submit"  class="button button" value="Calculate"></p>
    </form>
        %except NameError:
    %pass
    %finally:

</div>

