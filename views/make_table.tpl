<table>
    <tr>
    <td></td>
    %for i in range(vertices):
    <td>node {{i+1}}</td>
    %end
    </tr>
    %for i in range(vertices):
    <tr> <td>node {{i+1}}</td>
    %for j in range(vertices):
    %if i<j:
    <td><input type="Number" name="field{{i}}{{j}}" min="0" max="1" placeholder="0"></td>
    %else:
    <td><input type="Number" name="field{{i}}{{j}}" min="0" max="1" style="background-color: #606060" readonly></td>
    %end
    %end
    </tr>
    %end
    </table>
<br>