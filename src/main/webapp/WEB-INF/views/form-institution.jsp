<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="for" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Dodaj / Edytuj nową fundację</title>
    <link rel="stylesheet" href="/resources/css/style.css"/>
</head>
<body>

    <jsp:include page="header-form-page.jsp"></jsp:include>

    <form:form modelAttribute="institution" action="/admin/institutions/add" method="post">

        <div class="form-group form-group--inline">
            <label>
                Nazwa fundacji:
                <form:input path="name"/>
            </label>
        </div>
        <div class="form-group form-group--inline">
            <label>
                Opis fundacji:
                <form:textarea path="description"/>
            </label>
        </div>

        <form:hidden path="id"/>

        <div class="form-group form-group--buttons">
            <button type="submit" class="btn">Zapisz</button>
        </div>
    </form:form>

</body>
</html>
