<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>User Management Application</title>
</head>
<body>
<center>
  <h1>User Management</h1>
  <h2>
    <a href="${pageContext.request.contextPath}/users?action=create">Add New User</a>
  </h2>
</center>
<div align="center">
  <form action="${pageContext.request.contextPath}/users" method="get" style="display:inline-block; margin-right: 20px;">
    <input type="hidden" name="action" value="search" />
    <input type="text" name="country" placeholder="Search by country" required />
    <button type="submit">Search</button>
  </form>
  <form action="${pageContext.request.contextPath}/users" method="get" style="display:inline-block;">
    <input type="hidden" name="action" value="sort" />
    <button type="submit">Sort by Name</button>
  </form>
</div>
<div align="center">
  <table border="1" cellpadding="5">
    <caption><h2>List of Users</h2></caption>
    <tr>
      <th>ID</th>
      <th>Name</th>
      <th>Email</th>
      <th>Country</th>
      <th>Actions</th>
    </tr>
    <c:forEach var="user" items="${listUser}">
      <tr>
        <td><c:out value="${user.id}"/></td>
        <td><c:out value="${user.name}"/></td>
        <td><c:out value="${user.email}"/></td>
        <td><c:out value="${user.country}"/></td>
        <td>
          <a href="${pageContext.request.contextPath}/users?action=edit&id=${user.id}">Edit</a>
          <a href="${pageContext.request.contextPath}/users?action=delete&id=${user.id}">Delete</a>
        </td>
      </tr>
    </c:forEach>
  </table>
</div>
</body>
</html>