% rebase('layout.tpl', title='Home Page', year=year)
% import json
<h1>Solution</h1>
 %with open('data/prim_data.txt', 'r') as file:
            %solutions=json.load(file)
            
            %mas_input_weight=solutions[str(id)]['input_weight']
            %mas_input_adjancency=solutions[str(id)]['input_adjancency']
            %mas_output=solutions[str(id)]['output']
            %sum=solutions[str(id)]['sum']
            %file.close()
           
    <h2>Input weight</h2>
 % include('make_result.tpl', title='make_result', vertices=vertices, mas=mas_input_weight)
    <h2>Input adjancency</h2>
 % include('make_result.tpl', title='make_result', vertices=vertices, mas=mas_input_adjancency)
    <h2>Output</h2>
    %if mas_output!=None:
 % include('make_result.tpl', title='make_result', vertices=vertices, mas=mas_output)
    <h2>Sum of edge weights</h2>
    <p>Result: {{sum}}</p>
    %else:
        <p>Solution for the given graph cannot be found since it is not connected.</p>
        <img class ="image" src="https://i.imgur.com/HqQAzc7.jpg" width=200 alt="sad cat">
 %end