% rebase('layout.tpl', title='Home Page', year=year)
% import json
<h1>Solution</h1>
 %with open('data/dfs_data.txt', 'r') as file:
    %solutions=json.load(file)
    %vertices=solutions[str(id)]['vertices']
    %mas_input=solutions[str(id)]['input']
    %mas_output=solutions[str(id)]['output']
    %file.close()

           
    <h2>Initial values</h2>
 % include('make_result.tpl', title='make_result', rows=vertices, mas=mas_input)
    <h2>Result (from the vertex {{vertices}})</h2>
    %if mas_output!=None:
 % include('make_result.tpl', title='make_result', rows=vertices, mas=mas_output)
 %else:
        <p>Solution for the given graph cannot be found since it is not connected.</p>
        <img class ="image" src="https://i.imgur.com/HqQAzc7.jpg" width=200 alt="sad cat">
 %end