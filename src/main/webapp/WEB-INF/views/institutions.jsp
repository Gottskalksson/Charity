<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Lista fundacji</title>
    <link rel="stylesheet" href="/resources/css/style.css"/>

</head>
<body>
<jsp:include page="header-form-page.jsp"></jsp:include>

<section class="help">
    <h2>Lista fundacji</h2>

    <!-- SLIDE 1 -->
    <div class="help--slides active" data-id="1">
        <p>Spis fundacji w naszej bazie danych:</p>

        <ul class="help--slides-items">

            <c:forEach items="${institutionList}" var="institution" varStatus="count">
                <li>
                <div class="col">
                    <div class="title">Fundacja ${institution.name}</div>
                    <div class="subtitle">Cel i misja: ${institution.description}</div>
                    <a href="/admin/institutions/edit/${institution.id}">Edytuj dane fundacji</a>
                    <a href="/admin/institutions/delete/${institution.id}">Usuń fundację</a>
                </div>

<%--                <c:if test="${count.count % 2 == 0 && !count.last}">--%>
<%--            </li>--%>
<%--            <li>--%>
<%--                </c:if>--%>
                </li>
            </c:forEach>

        </ul>

    </div>

    <a href="/admin/institutions/add"><h1>DODAJ NOWĄ FUNDACJĘ</h1></a>
</section>

<%--<jsp:include page="footer.jsp"></jsp:include>--%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="/resources/js/app.js"></script>

</body>
</html>
