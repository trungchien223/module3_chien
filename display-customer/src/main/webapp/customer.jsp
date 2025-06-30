<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/30/2025
  Time: 11:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>Danh sách khách hàng</title>
  <style>
    table { width: 100%; border-collapse: collapse; text-align: center; }
    th, td { padding: 12px; border: 1px solid #ccc; }
    img { width: 100px; height: 80px; object-fit: cover; }
    h2 { text-align: center; }
  </style>
</head>
<body>
<h2>Danh sách khách hàng</h2>
<table>
  <tr>
    <th>Tên</th>
    <th>Ngày sinh</th>
    <th>Địa chỉ</th>
    <th>Ảnh</th>
  </tr>
  <c:forEach var="customer" items="${customers}">
    <tr>
      <td>${customer.name}</td>
      <td>${customer.birthday}</td>
      <td>${customer.address}</td>
      <td><img src="${customer.image}" alt="Ảnh khách hàng"/></td>
    </tr>
  </c:forEach>
</table>
</body>
</html>

