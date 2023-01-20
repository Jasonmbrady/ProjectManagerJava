<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Project Manager</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->
</head>
<body>
    <div class="container">
        <h1 class="text-center">Project Manager</h1>
        <p class="text-center">A place for teams to manage projects</p>
        <div class="row">
            <form:form class="col-sm" action="/register" method="POST" modelAttribute="user">
                <h3>Register Here</h3>
                <div>
                    <form:label path="username">Username:</form:label>
                    <form:input path="username" />
                    <form:errors path="username" />
                </div>
                <div>
                    <form:label path="email">Email:</form:label>
                    <form:input path="email" />
                    <form:errors path="email" />
                </div>
                <div>
                    <form:label path="password">Password:</form:label>
                    <form:input path="password" />
                    <form:errors path="password" />
                </div>
                <div>
                    <form:label path="confirmPass">Confirm Password:</form:label>
                    <form:input path="confirmPass" />
                    <form:errors path="confirmPass" />
                </div>
                <button>Submit</button>
            </form:form>
            <form:form class="col-sm" action="/login" method="POST" modelAttribute="loginUser">
                <h3>Log In Here</h3>
                <div>
                    <form:label path="email">Email:</form:label>
                    <form:input path="email" />
                    <form:errors path="email" />
                </div>
                <div>
                    <form:label path="password">Password:</form:label>
                    <form:input path="password" />
                    <form:errors path="password" />
                </div>
                <button>Submit</button>
            </form:form>
        </div>
    </div>

</body>
</html>