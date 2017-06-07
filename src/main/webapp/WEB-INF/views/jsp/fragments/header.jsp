<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="vertical-align" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>

<head>
    <title>Nemchinov Sergey's JavaRush Test Task</title>

    <spring:url value="/resources/core/css/hello.css" var="coreCss"/>
    <spring:url value="/resources/core/css/bootstrap.min.css"
                var="bootstrapCss"/>
    <link href="${bootstrapCss}" rel="stylesheet"/>
    <link href="${coreCss}" rel="stylesheet"/>
</head>

<body>

<spring:url value="/users" var="urlHome"/>
<spring:url value="/users/add" var="urlAddUser"/>

<nav class="navbar navbar-inverse ">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="${urlHome}">Home</a>
        </div>
        <div id="navbar">
            <ul class="nav navbar-nav navbar-right vertical-center">
                <li class="active">
                    <spring:url value="/users/search" var="searchUrl"/>
                    <form:form method="get" action="${searchUrl}">
                        <input name="value" type="text" id="name" width="100" placeholder="Search by name"/>
                        <button type="submit" class="btn-sm btn-info">Search</button>
                    </form:form>
                </li>
                <li class="active"><a href="${urlAddUser}">Add User</a></li>
            </ul>
        </div>
    </div>
</nav>