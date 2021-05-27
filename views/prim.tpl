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
		<p><textarea rows="2" cols="50" name="num" placeholder="Number of graph vertices"></textarea></p> 
        <div>
  <div>
    <p>The matrix</p>
    <form id="inputField" role="form">
   
    <table>
    <tbody>
    %for i in range(5):
    <tr>
     %for j in range(5):
     <td><input type="text" name="field"+j size="3"  min="1" max="9"></td>
     %end
      </tr>
    %end
      </tbody>
      </table>
      <br>
    </form>
    <br>

    <p>The adjacency matrix</p>
  </div>	
  <form id="inputField" role="form">
      <table>
    <tbody>
    %for i in range(5):
    <tr>
     %for j in range(5):
     <td><input type="Number" name="fieldAM"+j size="3" min="1" max="9"></td>
     %end
      </tr>
    %end
      </tbody>
      </table>
      <br>
    </form>
    <br>
        <p> <input type="submit"  class="button button" value="Calculate"></p>

</div>

