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

<form method="post" action="/sendMail">
    <div class="grid-container">
        <div class="grid-x grid-padding-x">
            <div class="medium-12 cell">
                <spring:message code="sendmailform.name" />
                <label>
                    <input type="text" name="name" placeholder="<spring:message code="sendmailform.name" />">
                </label>
            </div>
            <div class="medium-12 cell">
                <spring:message code="sendmailform.email" />
                <label>
                    <input type="text" name="email" placeholder="<spring:message code="sendmailform.email" />">
                </label>
            </div>
            <div class="medium-12 cell">
                <sping:message code="sendmailform.subject" />
                <label>
                    <input type="text" name="subject" placeholder="<spring:message code="sendmailform.subject" />">
                </label>
            </div>
            <div class="medium-12 cell">
                <spring:message code="sendmailform.content" />
                <label>
                    <input type="text" name="content" placeholder="<spring:message code="sendmailform.content" />">
                </label>
            </div>
            <div class="medium-12 cell">
                <button type="submit" class="alert button"><spring:message code="sendmailform.sendbutton" /></button>
            </div>
        </div>
    </div>
</form>
<c:if test="${errors != null}"><p>${errors}</p></c:if>

</body>
</html>