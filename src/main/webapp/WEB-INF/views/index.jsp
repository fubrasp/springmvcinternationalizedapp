<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"
           prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><spring:message code="index.title" /></title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/foundation/6.4.3/css/foundation.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/foundation/6.4.3/js/foundation.min.js"></script>
</head>
<body>

<div>
    <div class="medium-12 cell">
        <a href="/sendMail" class="button"><spring:message code="index.sendMail" /></a>
    </div>
</div>

<c:choose>
    <c:when test="${fn:length(messages) eq 0}">
        <h1><spring:message code="index.boxEmpty" /></h1>
    </c:when>
    <c:otherwise>
        <table>
            <thead>
            <tr>
                <th width="200">ID</th>
                <th width="200"><spring:message code="index.sender" /></th>
                <th width="50"><spring:message code="index.subject" /></th>
                <th width="300"><spring:message code="index.content" /></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${messages}" var="message">
                <tr>
                    <td><c:out value="${message.id}"/></td>
                    <td><c:out value="${message.sender}"/></td>
                    <td><c:out value="${message.subject}"/></td>
                    <td><c:out value="${message.content}"/></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:otherwise>
</c:choose>
</body>
</html>