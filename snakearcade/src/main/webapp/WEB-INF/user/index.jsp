<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css"/>
<meta charset="ISO-8859-1">
<title>Snake Arcade</title>
</head>
<body>
    <div class="container mt-5">
    	<h1 style="color:rebeccapurple" class="fw-bold">Snake Arcade</h1> <br>
        <div class="row">
            <div class="col">
                <h1>Register</h1>
                <form:form action="/register" method="post" modelAttribute="newUser">
                    <div class="form-group">
                        <label>User Name</label>
                        <form:input path="userName" class="form-control" />
                        <form:errors path="userName" class="text-danger" />
                    </div>
                    <div class="form-group">
                        <label>Password</label>
                        <form:input path="password" class="form-control" type="password"/>
                        <form:errors path="password" class="text-danger" />
                    </div>
                    <div class="form-group">
                        <label>Confirm Password</label>
                        <form:input path="passwordConfirm" class="form-control" type="password"/>
                        <form:errors path="passwordConfirm" class="text-danger" />
                    </div> <br>
                    <input type="submit" value="Register User" class="btn btn-primary" />
                </form:form>
            </div>
            <div class="col">
            <h1>Login</h1>
            <form:form action="/login" method="post" modelAttribute="newLogin">
                    <div class="form-group">
                        <label>Username</label>
                        <form:input path="userName" class="form-control" />
                        <form:errors path="userName" class="text-danger" />
                    </div>
                    <div class="form-group">
                        <label>Password</label>
                        <form:input path="password" class="form-control" type="password"/>
                        <form:errors path="password" class="text-danger" />
                    </div><br>
                    <input type="submit" value="Login" class="btn btn-primary" />
                </form:form>
            </div>
        </div>
    </div>
</body>
</html>