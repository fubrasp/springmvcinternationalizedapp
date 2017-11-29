<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"
           prefix="fn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Send mails</title>
    <link rel="stylesheet" href="<c:url value="foundation-6.4.2-complete/css/foundation.min.css"/>">
    <link rel="stylesheet" href="<c:url value="foundation-6.4.2-complete/css/app.css"/>">
    <script src="foundation-6.4.2-complete/js/app.js"></script>
</head>
<body>

<form method="post" action="/sendMail">
    <div class="grid-container">
        <div class="grid-x grid-padding-x">
            <div class="medium-12 cell">
                <label>Nom
                    <input type="text" name="name" placeholder="Nom">
                </label>
            </div>
            <div class="medium-12 cell">
                <label>Email
                    <input type="text" name="email" placeholder="Email">
                </label>
            </div>
            <div class="medium-12 cell">
                <label>Subject
                    <input type="text" name="subject" placeholder="Subject">
                </label>
            </div>
            <div class="medium-12 cell">
                <label>Content
                    <input type="text" name="content" placeholder="Content">
                </label>
            </div>
            <div class="medium-12 cell">
                <button type="submit" class="alert button">Send Mail</button>
            </div>
        </div>
    </div>
</form>
</body>
</html>