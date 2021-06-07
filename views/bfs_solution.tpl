% rebase('layout.tpl', title='Home Page', year=year)
% import json
<h1>Solution</h1>
 %with open('data/bfs_data.txt', 'r') as file:
    %solutions=json.load(file)
    %vertices=solutions[str(id)]['vertices']
    %mas_input=solutions[str(id)]['input']
    %mas_output=solutions[str(id)]['output']
    %file.close()

           
    <b>Initial values:</b>
 % include('make_result.tpl', title='make_result', vertices=vertices, mas=mas_input)
    <b>Result (starting from the vertex {{vertices}}):</b>
    %if mas_output!=None:
 % include('make_result.tpl', title='make_result', vertices=vertices, mas=mas_output)
 %else:
        <p>Solution for the given graph cannot be found since it is not connected.</p>
 %end