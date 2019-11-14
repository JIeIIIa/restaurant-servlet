<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setBundle basename="messages"/>
<fmt:setLocale value="uk"/>

<html>
<head>
    <meta charset="UTF-8">
</head>
<body>
<h2>Hello World!</h2>
<h3>
    <fmt:message key="user.login" />
</h3>
</body>
</html>
