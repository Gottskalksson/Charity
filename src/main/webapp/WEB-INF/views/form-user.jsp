<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Edytuj użytkownika</title>
    <link rel="stylesheet" href="/resources/css/style.css"/>
</head>
<body>
    <jsp:include page="header-form-page.jsp"></jsp:include>

    <form:form modelAttribute="user" action="/admin/edit" method="post">
        <div class="form-group form-group--inline">
            <label>
                E-mail: <form:input path="username"></form:input>
                <form:errors path="username"/>
            </label>
        </div>
        <div class="form-group form-group--inline">
            <label>
                Jeśli chcesz zmienić hasło do konta, <div id="changePassword">kliknij tutaj</div>
            </label>
        </div>
        <div style="visibility: hidden">
            <div class="form-group form-group--inline">
                <label>
                    Podaj stare hasło: <input type="password" name="password">
                </label>
            </div>
            <div class="form-group form-group--inline">
                <label>
                    Nowe hasło: <input type="password" name="newPassword">
                </label>
            </div>
            <div class="form-group form-group--inline">
                <label>
                    Powtórz hasło: <input type="password" name="newPassword2">
                </label>
            </div>

        </div>
        <form:hidden path="id"/>
        <div class="form-group form-group--buttons">
            <button type="submit">Zapisz</button>
        </div>
    </form:form>

</body>
</html>
