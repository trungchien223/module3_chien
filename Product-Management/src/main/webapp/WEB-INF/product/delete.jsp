<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.example.productmanagement.entity.Product" %>
<html>
<head>
    <title>Xoá sản phẩm</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-5.1.3-dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">
    <h2>Xoá sản phẩm</h2>
    <form method="post" action="${pageContext.request.contextPath}/products">
        <input type="hidden" name="action" value="delete">
        <input type="hidden" name="id" value="<%= ((Product)request.getAttribute("product")).getId() %>">
        <div class="alert alert-warning">
            Bạn có chắc chắn muốn xoá sản phẩm <strong><%= ((Product)request.getAttribute("product")).getName() %></strong> không?
        </div>
        <button type="submit" class="btn btn-danger">Xoá</button>
        <a href="${pageContext.request.contextPath}/products" class="btn btn-secondary">Huỷ</a>
    </form>
</div>
<script src="${pageContext.request.contextPath}/bootstrap-5.1.3-dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 