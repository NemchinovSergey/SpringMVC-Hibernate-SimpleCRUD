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
        <h1>Users List</h1>
    </div>

    <c:if test="${!empty usersList}">
        <div id="pagination">
            <c:url value="/users" var="first">
                <c:param name="page" value="1"/>
                <c:param name="pageSize" value="${pageSize}"/>
            </c:url>
            <c:url value="/users" var="prev">
                <c:param name="page" value="${page - 1}"/>
                <c:param name="pageSize" value="${pageSize}"/>
            </c:url>
            <c:if test="${pageCount > 1 and page > 1}">
                <button class="btn btn-info" onclick="location.href='${first}'">First</button>
            </c:if>
            <c:if test="${page > 1}">
                <button class="btn btn-info" onclick="location.href='${prev}'">Prev</button>
            </c:if>
            <c:forEach begin="1" end="${pageCount}" step="1" varStatus="i">
                <c:choose>
                    <c:when test="${page == i.index}">
                        <%--<span>${i.index}</span>--%>
                        <button class="btn btn-primary">${i.index}</button>
                    </c:when>
                    <c:otherwise>
                        <c:url value="/users" var="url">
                            <c:param name="page" value="${i.index}"/>
                            <c:param name="pageSize" value="${pageSize}"/>
                        </c:url>
                        <button class="btn btn-info" onclick="location.href='${url}'">${i.index}</button>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:url value="/users" var="next">
                <c:param name="page" value="${page + 1}"/>
                <c:param name="pageSize" value="${pageSize}"/>
            </c:url>
            <c:url value="/users" var="last">
                <c:param name="page" value="${pageCount}"/>
                <c:param name="pageSize" value="${pageSize}"/>
            </c:url>
            <c:if test="${page + 1 <= pageCount}">
                <button class="btn btn-info" onclick="location.href='${next}'">Next</button>
            </c:if>
            <c:if test="${pageCount > 1 and page < pageCount}">
                <button class="btn btn-info" onclick="location.href='${last}'">Last</button>
            </c:if>

            <%--<spring:bind path="pageSize">
                    <form:select path="pageSize" class="form-control" onchange="location.href='/users'">
                        <form:options items="${pageSizes}"/>
                    </form:select>
            </spring:bind>--%>
        </div>

        <table class="table table-striped">
            <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Age</th>
                <th>Created Date</th>
                <th>Administrator</th>
                <th>Actions</th>
            </tr>
            </thead>

            <c:forEach var="user" items="${usersList}">
                <tr>
                    <td>${user.id}</td>
                    <td>${user.name}</td>
                    <td>${user.age}</td>
                    <td>${user.createdDate}</td>
                    <td>${user.admin}</td>
                    <td>
                        <spring:url value="/users/${user.id}" var="userUrl"/>
                        <spring:url value="/users/${user.id}/update" var="updateUrl"/>
                        <spring:url value="/users/${user.id}/delete" var="deleteUrl"/>

                        <button class="btn btn-info" onclick="location.href='${userUrl}'">View</button>
                        <button class="btn btn-primary" onclick="location.href='${updateUrl}'">Edit</button>
                        <button class="btn btn-danger" onclick="location.href='${deleteUrl}'" onsubmit="this.disabled=true">Delete</button>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:if>

</div>

<jsp:include page="../fragments/footer.jsp"/>
