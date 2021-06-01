% rebase('layout.tpl', title='Home Page', year=year)
% import json
<h1>Solution</h1>
 %with open('data/prim_data.txt', 'r') as file:
            %solutions=json.load(file)
            
            %mas_input_weight=solutions[str(id)]['input_weight']
            %mas_input_adjancency=solutions[str(id)]['input_adjancency']
            %mas_output=solutions[str(id)]['output']
            %file.close()
           
    <h2>Input weight</h2>
 % include('make_result.tpl', title='make_result', rows=rows, mas=mas_input_weight)
    <h2>Input adjancency</h2>
 % include('make_result.tpl', title='make_result', rows=rows, mas=mas_input_adjancency)
    <h2>Output</h2>
 % include('make_result.tpl', title='make_result', rows=rows, mas=mas_output)