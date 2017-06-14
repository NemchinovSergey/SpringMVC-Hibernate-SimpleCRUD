<%@ page session="false" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="../fragments/header.jsp"/>

<div class="container">

    <div align="center">
        <c:choose>
            <c:when test="${user['new']}">
                <h1>Add User</h1>
            </c:when>
            <c:otherwise>
                <h1>Update User</h1>
            </c:otherwise>
        </c:choose>
        <br/>
    </div>

    <spring:url value="/users" var="userActionUrl"/>

    <form:form class="form-horizontal" method="post" modelAttribute="user" action="${userActionUrl}">

        <form:hidden path="id"/>

        <spring:bind path="name">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <label class="col-sm-2 control-label">Name</label>
                <div class="col-sm-10">
                    <form:input path="name" type="text" class="form-control" id="name" placeholder="Enter a name"/>
                    <form:errors path="name" class="control-label"/>
                </div>
            </div>
        </spring:bind>

        <spring:bind path="age">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <label class="col-sm-2 control-label">Age</label>
                <div class="col-sm-10">
                    <form:input path="age" type="number" required="true" min="1" max="999" class="form-control" id="age"
                                placeholder="Enter a number"/>
                    <form:errors path="age" class="control-label"/>
                </div>
            </div>
        </spring:bind>

        <spring:bind path="createdDate">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <label class="col-sm-2 control-label">Created Date</label>
                <div class="col-sm-10">
                    <form:input path="createdDate" type="datetime" disabled="true" required="true" class="form-control" id="createdDate" placeholder="Here is the date of user creation"/>
                    <form:errors path="createdDate" class="control-label"/>
                </div>
            </div>
        </spring:bind>

        <spring:bind path="admin">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <label class="col-sm-2 control-label">Administrator</label>
                <div class="col-sm-10">
                    <div class="checkbox">
                        <label><form:checkbox path="admin" id="admin"/></label>
                        <form:errors path="admin" class="control-label"/>
                    </div>
                </div>
            </div>
        </spring:bind>

        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <c:choose>
                    <c:when test="${user['new']}">
                        <button type="submit" class="btn-lg btn-primary pull-right">Add</button>
                    </c:when>
                    <c:otherwise>
                        <button type="submit" class="btn-lg btn-primary pull-right">Save</button>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </form:form>

</div>

<jsp:include page="../fragments/footer.jsp"/>

