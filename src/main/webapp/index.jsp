<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"
           prefix="fn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Read mails</title>
    <link rel="stylesheet" href="<c:url value="foundation-6.4.2-complete/css/foundation.min.css"/>">
    <link rel="stylesheet" href="<c:url value="foundation-6.4.2-complete/css/app.css"/>">
    <script src="foundation-6.4.2-complete/js/app.js"></script>
</head>
<body>

<div>
    <div class="medium-12 cell">
        <a href="/sendMail" class="button">Send mail</a>
    </div>
</div>

<c:choose>
    <c:when test="${fn:length(messages) eq 0}">
        <h1>No mails received</h1>
    </c:when>
    <c:otherwise>
        <table>
            <thead>
            <tr>
                <th width="200">ID</th>
                <th width="200">Sender</th>
                <th width="50">Subject</th>
                <th width="300">Content</th>
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