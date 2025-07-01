<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thêm sản phẩm mới</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-5.1.3-dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">
    <h2>Thêm sản phẩm mới</h2>
    <form method="post" action="${pageContext.request.contextPath}/products">
        <input type="hidden" name="action" value="create">
        <div class="mb-3">
            <label for="id" class="form-label">ID</label>
            <input type="number" class="form-control" id="id" name="id" required>
        </div>
        <div class="mb-3">
            <label for="name" class="form-label">Tên sản phẩm</label>
            <input type="text" class="form-control" id="name" name="name" required>
        </div>
        <div class="mb-3">
            <label for="price" class="form-label">Giá</label>
            <input type="number" class="form-control" id="price" name="price" required>
        </div>
        <div class="mb-3">
            <label for="description" class="form-label">Mô tả</label>
            <textarea class="form-control" id="description" name="description" required></textarea>
        </div>
        <div class="mb-3">
            <label for="manufacturer" class="form-label">Nhà sản xuất</label>
            <input type="text" class="form-control" id="manufacturer" name="manufacturer" required>
        </div>
        <% if (request.getAttribute("error") != null) { %>
            <div class="alert alert-danger"><%= request.getAttribute("error") %></div>
        <% } %>
        <button type="submit" class="btn btn-primary">Lưu</button>
        <a href="${pageContext.request.contextPath}/products" class="btn btn-secondary">Quay lại</a>
    </form>
</div>
<script src="${pageContext.request.contextPath}/bootstrap-5.1.3-dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 