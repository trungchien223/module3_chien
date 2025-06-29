
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product Discount Calculator</title>
</head>
<body>
<h1>Product Discount Calculator</h1>
<form action="discount" method="post">
    <label>Product Description:</label><br>
    <input type="text" name="description" required><br><br>

    <label>List Price:</label><br>
    <input type="number" name="price" step="0.01" required><br><br>

    <label>Discount Percent:</label><br>
    <input type="number" name="discount" step="0.01" required><br><br>

    <input type="submit" value="Calculate Discount">
</form>
</body>
</html>
