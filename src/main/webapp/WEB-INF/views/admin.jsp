<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Admin - strona główna</title>
    <link rel="stylesheet" href="/resources/css/style.css"/>
</head>
<body>

<jsp:include page="header-form-page.jsp"></jsp:include>

<section class="help">
    <h2>MENU ADMINA</h2>
    <h3>Lista administratorów</h3>
<c:forEach items="${admins}" var="admin">
    <p>${admin.username}</p>
</c:forEach>
</section>
</body>
</html>
