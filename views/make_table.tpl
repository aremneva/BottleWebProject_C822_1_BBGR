<table>
    %for i in range(rows):
    <tr>
    %for j in range(rows):
    <td><input type="Number" name="field"+j size="3"  min="0" max="1"></td>
    %end
    </tr>
    %end
</table>
<br>