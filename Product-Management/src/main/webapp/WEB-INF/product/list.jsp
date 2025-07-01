<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.productmanagement.entity.Product" %>
<html>
<head>
    <title>Danh sách sản phẩm</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-5.1.3-dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">
    <h2>Danh sách sản phẩm</h2>
    <% if (request.getAttribute("error") != null) { %>
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
        <%= request.getAttribute("error") %>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    <% } %>


    <% if (request.getAttribute("message") != null) { %>
    <div class="position-fixed top-0 end-0 p-3" style="z-index: 11">
        <div id="toastMessage" class="toast align-items-center text-white bg-success border-0"
             role="alert" aria-live="assertive" aria-atomic="true" data-bs-delay="3000">
            <div class="d-flex">
                <div class="toast-body">
                    <%= request.getAttribute("message") %>
                </div>
                <button type="button" class="btn-close btn-close-white me-2 m-auto"
                        data-bs-dismiss="toast" aria-label="Close"></button>
            </div>
        </div>
    </div>
    <% } %>

    <form class="row g-3 mb-3" method="get" action="${pageContext.request.contextPath}/products">
        <input type="hidden" name="action" value="search">
        <div class="col-auto">
            <input type="text" class="form-control" name="name" placeholder="Tìm kiếm theo tên">
        </div>
        <div class="col-auto">
            <button type="submit" class="btn btn-primary mb-3">Tìm kiếm</button>
        </div>
        <div class="col-auto">
            <a href="${pageContext.request.contextPath}/products?action=create" class="btn btn-success mb-3">Thêm sản phẩm</a>
        </div>
    </form>

    <table class="table table-bordered table-hover">
        <thead class="table-dark">
        <tr>
            <th>ID</th>
            <th>Tên sản phẩm</th>
            <th>Giá</th>
            <th>Nhà sản xuất</th>
            <th>Hành động</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Product> products = (List<Product>) request.getAttribute("products");
            if (products != null && !products.isEmpty()) {
                for (Product p : products) {
        %>
        <tr>
            <td><%= p.getId() %></td>
            <td><%= p.getName() %></td>
            <td><%= p.getPrice() %></td>
            <td><%= p.getManufacturer() %></td>
            <td>
                <a href="${pageContext.request.contextPath}/products?action=view&id=<%=p.getId()%>" class="btn btn-info btn-sm">Xem</a>
                <a href="${pageContext.request.contextPath}/products?action=edit&id=<%=p.getId()%>" class="btn btn-warning btn-sm">Sửa</a>
                <a href="${pageContext.request.contextPath}/products?action=delete&id=<%=p.getId()%>" class="btn btn-danger btn-sm">Xoá</a>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr><td colspan="5" class="text-center">Không có sản phẩm nào</td></tr>
        <% } %>
        </tbody>
    </table>
</div>

<script src="${pageContext.request.contextPath}/bootstrap-5.1.3-dist/js/bootstrap.bundle.min.js"></script>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        var toastEl = document.getElementById('toastMessage');
        if (toastEl) {
            var toast = new bootstrap.Toast(toastEl);
            toast.show();
            toastEl.addEventListener('hidden.bs.toast', function () {
                console.log('Toast đã đóng');
            });
        }
    });
</script>

</body>
</html>
