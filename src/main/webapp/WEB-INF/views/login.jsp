<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"
           prefix="fn" %>
<%@ taglib prefix="sping" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><spring:message code="sendmailform.title" /></title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/foundation/6.4.3/css/foundation.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/foundation/6.4.3/js/foundation.min.js"></script>
</head>
<body>
<p><spring:message code="index.errormanagement" /></p>
<a href="/sendMail?lang=en">EN</a>
<a href="/sendMail?lang=fr_FR">FR</a>
<form method="post" action="/login">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <div class="grid-container">
        <div class="grid-x grid-padding-x">
            <div class="medium-12 cell">
                <label><spring:message code="loginform.login" />
                    <input type="text" name="username" placeholder="<spring:message code="loginform.login" />">
                </label>
            </div>
            <div class="medium-12 cell">
                <label><spring:message code="loginform.password" />
                    <input type="text" name="password" placeholder="<spring:message code="loginform.password" />">
                </label>
            </div>
            <div class="medium-12 cell">
                <button type="submit" class="alert button"><spring:message code="loginform.loginbutton" /></button>
            </div>
        </div>
    </div>
</form>
<c:if test="${param.error}"><p><spring:message code="loginform.badcredentials" /></p></c:if>
<c:if test="${param.logout}"><p><spring:message code="loginform.logoutmessage" /></p></c:if>

</body>
</html>