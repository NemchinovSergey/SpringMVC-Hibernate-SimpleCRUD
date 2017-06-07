<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="fragments/header.jsp"/>

<div align="center">

    <h3>JavaRush Test Task</h3>
    <br/>
    <form:form class="form-horizontal" method="get" action="/users">
        <div class="form-group">
            <div align="center">
                <button type="submit" class="btn-lg btn-primary">Enter</button>
            </div>
        </div>
    </form:form>

</div>

<jsp:include page="fragments/footer.jsp"/>
