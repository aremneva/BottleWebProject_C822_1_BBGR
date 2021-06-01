% rebase('layout.tpl', title='Home Page', year=year)
% import json
<h1>Solution</h1>
 %with open('data/dfs_data.txt', 'r') as file:
    %solutions=json.load(file)
    %vertices=solutions[str(id)]['vertices']
    %mas_input=solutions[str(id)]['input']
    %mas_output=solutions[str(id)]['output']
    %file.close()

           
    <b>Initial values:</b>
 % include('make_result.tpl', title='make_result', rows=vertices, mas=mas_input)
    <b>Result (starting from the vertex {{vertices}}):</b>
 % include('make_result.tpl', title='make_result', rows=vertices, mas=mas_output)