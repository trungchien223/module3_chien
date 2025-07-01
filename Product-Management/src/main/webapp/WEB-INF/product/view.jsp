<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.example.productmanagement.entity.Product" %>
<html>
<head>
    <title>Chi tiết sản phẩm</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-5.1.3-dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">
    <h2>Chi tiết sản phẩm</h2>
    <div class="card">
        <div class="card-body">
            <h5 class="card-title">Tên sản phẩm: <%= ((Product)request.getAttribute("product")).getName() %></h5>
            <p class="card-text"><strong>ID:</strong> <%= ((Product)request.getAttribute("product")).getId() %></p>
            <p class="card-text"><strong>Giá:</strong> <%= ((Product)request.getAttribute("product")).getPrice() %></p>
            <p class="card-text"><strong>Mô tả:</strong> <%= ((Product)request.getAttribute("product")).getDescription() %></p>
            <p class="card-text"><strong>Nhà sản xuất:</strong> <%= ((Product)request.getAttribute("product")).getManufacturer() %></p>
            <a href="${pageContext.request.contextPath}/products" class="btn btn-secondary">Quay lại</a>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/bootstrap-5.1.3-dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 