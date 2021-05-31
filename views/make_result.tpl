<table>
    <tr>
    <td></td>
    %for i in range(rows):
    <td>node {{i+1}}</td>
    %end
    </tr>
    %for i in range(rows):
    <tr> <td>node {{i+1}}</td>
    %for j in range(rows):
    <td><input type="Number" name="field{{i}}{{j}}" min="0" max="99" value={{mas[i][j]}} readonly></td>
    %end
    </tr>
    %end
    </table>
<br>
