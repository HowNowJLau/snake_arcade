<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Snake Arcade</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.15/dist/tailwind.min.css">
	<style>
		@import url('https://fonts.googleapis.com/css?family=Press+Start+2P');
		h1 {
			font-family: 'Press Start 2P', cursive;
		}
		.form-container {
			height: 420px;
		}
		.form-input, button {
			margin-top: 10px;
			margin-bottom: 10px;
}
		
	</style>
</head>
<body class="bg-gray-100 font-sans">
  <div class="container mx-auto py-8 text-center">
    <h1 class="text-4xl font-bold text-purple-800 mb-4">Snake Arcade</h1>
    <div class="grid grid-cols-2 gap-8">
      <div>
        <h2 class="text-2xl font-bold mb-4">Register</h2>
        <form:form action="/register" method="post" modelAttribute="newUser" class="w-full max-w-sm">
          <div class="mb-4">
            <label class="block text-gray-700 font-bold mb-2" for="userName">
              Screen Name
            </label>
            <form:input path="userName" class="form-input" type="text" id="userName" />
            <form:errors path="userName" class="text-red-500 text-sm mt-1" />
          </div>
          <div class="mb-4">
            <label class="block text-gray-700 font-bold mb-2" for="password">
              Password
            </label>
            <form:input path="password" class="form-input" type="password" id="password" />
            <form:errors path="password" class="text-red-500 text-sm mt-1" />
          </div>
          <div class="mb-4">
            <label class="block text-gray-700 font-bold mb-2" for="passwordConfirm">
              Confirm Password
            </label>
            <form:input path="passwordConfirm" class="form-input" type="password" id="passwordConfirm" />
            <form:errors path="passwordConfirm" class="text-red-500 text-sm mt-1" />
          </div>
          <div class="flex items-center justify-between">
            <button type="submit" class="bg-purple-700 text-white font-bold py-2 px-4 rounded">
              Register User
            </button>
          </div>
        </form:form>
      </div>
      <div>
        <h2 class="text-2xl font-bold mb-4">Login</h2>
        <form:form action="/login" method="post" modelAttribute="newLogin" class="w-full max-w-sm">
          <div class="mb-4">
            <label class="block text-gray-700 font-bold mb-2" for="loginUserName">
              Username
            </label>
            <form:input path="userName" class="form-input" type="text" id="loginUserName" />
            <form:errors path="userName" class="text-red-500 text-sm mt-1" />
          </div>
          <div class="mb-4">
            <label class="block text-gray-700 font-bold mb-2" for="loginPassword">
              Password
            </label>
            <form:input path="password" class="form-input" type="password" id="loginPassword" />
            <form:errors path="password" class="text-red-500 text-sm mt-1" />
          </div>
          <div class="flex items-center justify-between">
            <button type="submit" class="bg-purple-700 text-white font-bold py-2 px-4 rounded">
              Login
            </button>
          </div>
        </form:form>
      </div>
    </div>
  </div>
</body>

</html>