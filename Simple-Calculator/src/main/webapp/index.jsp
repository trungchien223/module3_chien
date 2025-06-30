<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Simple Calculator</title>
</head>
<body>
<h1>Simple Calculator</h1>
<form action="calculate" method="post">
    <fieldset>
        <legend>Calculator</legend>
        First operand: <input type="text" name="firstOperand"><br><br>
        Operator:
        <select name="operator">
            <option value="add">Addition</option>
            <option value="sub">Subtraction</option>
            <option value="mul">Multiplication</option>
            <option value="div">Division</option>
        </select><br><br>
        Second operand: <input type="text" name="secondOperand"><br><br>
        <input type="submit" value="Calculate">
    </fieldset>
</form>
</body>
</html>
