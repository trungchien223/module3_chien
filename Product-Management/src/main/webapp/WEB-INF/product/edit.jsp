<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.productmanagement.entity.Product" %>
<html>
<head>
    <title>Cập nhật sản phẩm</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-5.1.3-dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">
    <h2>Cập nhật sản phẩm</h2>
    <% if (request.getAttribute("error") != null) { %>
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
        <%= request.getAttribute("error") %>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    <% } %>

    <form method="post" action="${pageContext.request.contextPath}/products">
        <input type="hidden" name="action" value="edit">
        <div class="mb-3">
            <label for="id" class="form-label">ID</label>
            <input type="number" class="form-control" id="id" name="id" value="<%= ((Product)request.getAttribute("product")).getId() %>" readonly>
        </div>
        <div class="mb-3">
            <label for="name" class="form-label">Tên sản phẩm</label>
            <input type="text" class="form-control" id="name" name="name" value="<%= ((Product)request.getAttribute("product")).getName() %>" required>
        </div>
        <div class="mb-3">
            <label for="price" class="form-label">Giá</label>
            <input type="number" class="form-control" id="price" name="price" value="<%= ((Product)request.getAttribute("product")).getPrice() %>" required>
        </div>
        <div class="mb-3">
            <label for="description" class="form-label">Mô tả</label>
            <textarea class="form-control" id="description" name="description" required><%= ((Product)request.getAttribute("product")).getDescription() %></textarea>
        </div>
        <div class="mb-3">
            <label for="manufacturer" class="form-label">Nhà sản xuất</label>
            <input type="text" class="form-control" id="manufacturer" name="manufacturer" value="<%= ((Product)request.getAttribute("product")).getManufacturer() %>" required>
        </div>
        <% if (request.getAttribute("error") != null) { %>
            <div class="alert alert-danger"><%= request.getAttribute("error") %></div>
        <% } %>
        <button type="submit" class="btn btn-primary">Cập nhật</button>
        <a href="${pageContext.request.contextPath}/products" class="btn btn-secondary">Quay lại</a>
    </form>
</div>
<script src="${pageContext.request.contextPath}/bootstrap-5.1.3-dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 