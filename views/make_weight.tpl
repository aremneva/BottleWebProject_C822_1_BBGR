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
    <td><input type="number" name="field{{i}}{{j}}" min="0" max="99" placeholder="0"></td>
    %else:
    <td><input type="number" name="field{{i}}{{j}}" min="0" max="99" style="background-color: #606060" readonly></td>
    %end
    %end
    </tr>
    %end
    </table>
<br>
