<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<jsp:include page="../fragments/header.jsp"/>

<div class="container">

    <c:if test="${not empty msg}">
        <div class="alert alert-${css} alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            <strong>${msg}</strong>
        </div>
    </c:if>

    <div align="center">
        <h1>User Info</h1>

        <table width="600" border="0">
            <tr>
                <td>
                    <div class="row">
                        <label class="col-sm-2">ID</label>
                        <div class="col-sm-10">${user.id}</div>
                    </div>

                    <div class="row">
                        <label class="col-sm-2">Name</label>
                        <div class="col-sm-10">${user.name}</div>
                    </div>

                    <div class="row">
                        <label class="col-sm-2">Age</label>
                        <div class="col-sm-10">${user.age}</div>
                    </div>

                    <div class="row">
                        <label class="col-sm-2">Created Date</label>
                        <div class="col-sm-10">${user.createdDate}</div>
                    </div>

                    <div class="row">
                        <label class="col-sm-2">Administrator</label>
                        <div class="col-sm-10">${user.admin}</div>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <spring:url value="/users" var="backUrl"/>
                    <spring:url value="/users/${user.id}/update" var="updateUrl"/>
                    <spring:url value="/users/${user.id}/delete" var="deleteUrl"/>

                    <button class="btn btn-info" onclick="location.href='/users'">Back</button>
                    <button class="btn btn-primary" onclick="location.href='${updateUrl}'">Edit</button>
                    <button class="btn btn-danger" onclick="this.disabled=true;post('${deleteUrl}')">Delete</button>
                </td>
            </tr>
        </table>
    </div>

</div>

<jsp:include page="../fragments/footer.jsp"/>
