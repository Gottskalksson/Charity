<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Document</title>
    <link rel="stylesheet" href="/resources/css/style.css"/>
</head>
<body>

<jsp:include page="header-form-page.jsp"></jsp:include>


<section class="form--steps">
    <div class="form--steps-instructions">
        <div class="form--steps-container">
            <h3>Ważne!</h3>
            <p data-step="1" class="active">
                Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
                wiedzieć komu najlepiej je przekazać.
            </p>
            <p data-step="2">
                Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
                wiedzieć komu najlepiej je przekazać.
            </p>
            <p data-step="3">
                Wybierz jedną, do
                której trafi Twoja przesyłka.
            </p>
            <p data-step="4">Podaj adres oraz termin odbioru rzeczy.</p>
        </div>
    </div>

    <div class="form--steps-container">
        <div class="form--steps-counter">Krok <span>1</span>/4</div>

        <form:form modelAttribute="donation" action="/donations/add" method="post">
            <!-- STEP 1: class .active is switching steps -->
            <div data-step="1" class="active">
                <h3>Zaznacz co chcesz oddać:</h3>

                <c:forEach items="${categoryList}" var="category">
                    <div class="form-group form-group--checkbox">
                        <label>
                                <%--                        <input--%>
                                <%--                                type="checkbox"--%>
                                <%--                                name="categories"--%>
                                <%--                                value="clothes-to-use"--%>
                                <%--                        />--%>
                            <form:checkboxes path="category"
                                             items="${category}" itemLabel="name" itemValue="id"/>
                            <span class="checkbox"></span>
                            <span class="description"
                            >${category.name}</span
                            >
                        </label>
                    </div>
                </c:forEach>

                    <%--                <div class="form-group form-group--checkbox">--%>
                    <%--                    <label>--%>
                    <%--                        <input--%>
                    <%--                                type="checkbox"--%>
                    <%--                                name="categories"--%>
                    <%--                                value="clothes-useless"--%>
                    <%--                        />--%>
                    <%--                        <span class="checkbox"></span>--%>
                    <%--                        <span class="description">ubrania, do wyrzucenia</span>--%>
                    <%--                    </label>--%>
                    <%--                </div>--%>

                    <%--                <div class="form-group form-group--checkbox">--%>
                    <%--                    <label>--%>
                    <%--                        <input type="checkbox" name="categories" value="toys" />--%>
                    <%--                        <span class="checkbox"></span>--%>
                    <%--                        <span class="description">zabawki</span>--%>
                    <%--                    </label>--%>
                    <%--                </div>--%>

                    <%--                <div class="form-group form-group--checkbox">--%>
                    <%--                    <label>--%>
                    <%--                        <input type="checkbox" name="categories" value="books" />--%>
                    <%--                        <span class="checkbox"></span>--%>
                    <%--                        <span class="description">książki</span>--%>
                    <%--                    </label>--%>
                    <%--                </div>--%>

                    <%--                <div class="form-group form-group--checkbox">--%>
                    <%--                    <label>--%>
                    <%--                        <input type="checkbox" name="categories" value="other" />--%>
                    <%--                        <span class="checkbox"></span>--%>
                    <%--                        <span class="description">inne</span>--%>
                    <%--                    </label>--%>
                    <%--                </div>--%>

                <div class="form-group form-group--buttons">
                    <button type="button" class="btn next-step">Dalej</button>
                </div>
            </div>

            <!-- STEP 2 -->
            <div data-step="2">
                <h3>Podaj liczbę 60l worków, w które spakowałeś/aś rzeczy:</h3>

                <div class="form-group form-group--inline">
                    <label>
                        Liczba 60l worków:
                        <form:input path="quantity"></form:input>
                    </label>
                </div>

                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="button" class="btn bagsNextStep next-step">Dalej</button>
                </div>
            </div>


            <!-- STEP 4 -->
            <div data-step="3">
                <h3>Wybierz organizacje, której chcesz pomóc:</h3>
                <c:forEach items="${institutionList}" var="institution">

                    <div class="form-group form-group--checkbox">
                        <label>
                                <%--                        <input type="radio" name="organization" value="old" />--%>
                            <form:radiobutton path="institution" value="${institution.id}"></form:radiobutton>
                            <span class="checkbox radio"></span>
                            <span class="description">
                  <div class="title">${institution.name}</div>
                  <div class="subtitle">
                          ${institution.description}
                  </div>
                </span>
                        </label>
                    </div>
                </c:forEach>

                    <%--                <div class="form-group form-group--checkbox">--%>
                    <%--                    <label>--%>
                    <%--                        <input type="radio" name="organization" value="old" />--%>
                    <%--                        <span class="checkbox radio"></span>--%>
                    <%--                        <span class="description">--%>
                    <%--                  <div class="title">Fundacja “Dla dzieci"</div>--%>
                    <%--                  <div class="subtitle">--%>
                    <%--                    Cel i misja: Pomoc osobom znajdującym się w trudnej sytuacji--%>
                    <%--                    życiowej.--%>
                    <%--                  </div>--%>
                    <%--                </span>--%>
                    <%--                    </label>--%>
                    <%--                </div>--%>

                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="button" class="btn radioNextStep next-step">Dalej</button>
                </div>
            </div>

            <!-- STEP 5 -->
            <div data-step="4">
                <h3>Podaj adres oraz termin odbioru rzecz przez kuriera:</h3>

                <div class="form-section form-section--columns">
                    <div class="form-section--column">
                        <h4>Adres odbioru</h4>
                        <div class="form-group form-group--inline">
                            <label> Ulica <form:input path="street"/> </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label> Miasto <form:input path="city"/> </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label>
                                Kod pocztowy <form:input path="zipCode"/>
                            </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label>
                                Numer telefonu <input id="phoneNumber" type="phone" name="phone"/>
                            </label>
                        </div>
                    </div>

                    <div class="form-section--column">
                        <h4>Termin odbioru</h4>
                        <div class="form-group form-group--inline">
                            <label> Data <form:input path="pickUpDate"/> </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label> Godzina <form:input path="pickUpTime"/> </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label>
                                Uwagi dla kuriera
                                <form:textarea path="pickUpComment"/>
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="button" class="btn detailsNextStep next-step">Dalej</button>
                </div>
            </div>

            <!-- STEP 6 -->
            <div data-step="5">
                <h3>Podsumowanie Twojej darowizny</h3>

                <div class="summary">
                    <div class="form-section">
                        <h4>Oddajesz:</h4>
                        <ul>
                            <li>
                                <span class="icon icon-bag"></span>
                                <span class="summary--text">
                                    <div id="summaryBag">4 worki ubrań w dobrym stanie dla dzieci</div>
                                </span>
                            </li>

                            <li>
                                <span class="icon icon-hand"></span>
                                <span class="summary--text"><div id="summaryInstitution"
                                >Dla fundacji "Mam marzenie" w Warszawie</div></span
                                >
                            </li>
                        </ul>
                    </div>

                    <div class="form-section form-section--columns">
                        <div class="form-section--column">
                            <h4>Adres odbioru:</h4>
                            <ul>
                                <li id="summaryStreet">Prosta 51</li>
                                <li id="summaryCity">Warszawa</li>
                                <li id="summaryZipCode">99-098</li>
                                <li id="summaryPhone">123 456 789</li>
                            </ul>
                        </div>

                        <div class="form-section--column">
                            <h4>Termin odbioru:</h4>
                            <ul>
                                <li id="summaryPickUpDate">13/12/2018</li>
                                <li id="summaryPickUpTime">15:40</li>
                                <li id="summaryCommentary">Brak uwag</li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="submit" class="btn">Potwierdzam</button>
                </div>
            </div>
        </form:form>
    </div>
</section>

<jsp:include page="footer.jsp"></jsp:include>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="/resources/js/app.js"></script>
<script src="/resources/js/summaryApp.js"></script>
</body>
</html>
