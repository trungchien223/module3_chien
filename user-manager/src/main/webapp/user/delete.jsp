<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Xác nhận xóa User</title>
</head>
<body>
<h2>Xác nhận xóa User</h2>
<form action="/users?action=delete" method="post">
    <input type="hidden" name="id" value="${user.id}"/>
    <p>Bạn có chắc chắn muốn xóa user sau không?</p>
    <ul>
        <li><strong>ID:</strong> ${user.id}</li>
        <li><strong>Name:</strong> ${user.name}</li>
        <li><strong>Email:</strong> ${user.email}</li>
        <li><strong>Country:</strong> ${user.country}</li>
    </ul>
    <button type="submit">Xác nhận xóa</button>
    <a href="/users">Hủy</a>
</form>
</body>
</html> 