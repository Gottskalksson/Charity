<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>

    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>
    <title>Ups!</title>
</head>
<body>

<div class="slogan container container--90">
    <div class="slogan--item">
        <h1>
            Ups!<br/>
            Wygląda na to, że nie masz uprawnień, aby tu wejść...
        </h1>
        <br/>
    </div>
    <button onclick="window.location.href = '/';">Wróć do strony głównej</button>
</div>

</body>
</html>
