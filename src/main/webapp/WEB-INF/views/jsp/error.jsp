<%@ page session="false" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="fragments/header.jsp"/>

<div class="container">

    <h1>Oops! Something went wrong...</h1>

    <spring:url value="/users" var="backUrl"/>
    <button class="btn btn-info" onclick="location.href='/users'">Back to Home</button>

    <p>${exception.message}</p>
    ${exception.message}.
    <c:forEach items="${exception.stackTrace}" var="stackTrace">
        ${stackTrace}
    </c:forEach>

</div>

<jsp:include page="fragments/footer.jsp"/>
