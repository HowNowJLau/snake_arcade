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
			color: #E8DB7D;
		}
		.form-container {
			height: 420px;
		}
		.form-input, button {
			margin-top: 10px;
			margin-bottom: 10px;
		}

		body {
    	background-color: #23052E;
  		}
  		.form-input {
    	height: 35px; /* Set the height of the input boxes */
    	width: 100%; /* Set the width of the input boxes to 100% */
    	padding: 0.5rem; /* Add some padding inside the input boxes */
    	font-size: 1rem; /* Set the font size of the input text */
    	line-height: 1.5; /* Set the line height of the input text */
    	color: #4a5568; /* Set the text color of the input text */
    	background-color: #fff; /* Set the background color of the input boxes */
    	border: 1px solid #cbd5e0; /* Set a border for the input boxes */
    	border-radius: 0.25rem; /* Add some border radius to the input boxes */
    	transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out; /* Add a transition effect to the border color and box shadow */
		}
	</style>
</head>
<body class="font-sans">
    <h1 class="text-4xl mb-5 mt-9 text-center">Snake Arcade</h1>
  	<div class="container mx-auto py-8 text-center">
    <div class="grid grid-cols-1 md:grid-cols-2 gap-8 mx-auto">
      <div class ="mx-auto">
        <h2 class="text-2xl font-bold mb-4 text-white">Register</h2>
        <form:form action="/register" method="post" modelAttribute="newUser" class="w-full max-w-sm">
          <div class="mb-4">
            <label class="block text-white font-bold mb-2" for="userName">
              Screen Name
            </label>
            <form:input path="userName" class="form-input" type="text" id="userName" />
            <br>
            <form:errors path="userName" class="text-pink-400 text-sm mt-1" />
          </div>
          <div class="mb-4">
            <label class="block text-white font-bold mb-2" for="password">
              Password
            </label>
            <form:input path="password" class="form-input" type="password" id="password" />
            <br>
            <form:errors path="password" class="text-pink-400 text-sm mt-1" />
          </div>
          <div class="mb-4">
            <label class="block text-white font-bold mb-2" for="passwordConfirm">
              Confirm Password
            </label>
            <form:input path="passwordConfirm" class="form-input" type="password" id="passwordConfirm" />
            <br>
            <form:errors path="passwordConfirm" class="text-pink-400 text-sm mt-1" />
          </div>
          <div class="flex items-center justify-between">
          <div class="mx-auto">
            <button type="submit" class="bg-purple-700 text-white font-bold py-2 px-4 rounded">
              Register User
            </button>
            </div>
          </div>
        </form:form>
      </div>
	  <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
      <div class ="mx-auto">
        <h2 class="text-2xl font-bold mb-4 text-white">Login</h2>
        <form:form action="/login" method="post" modelAttribute="newLogin" class="w-full max-w-sm">
          <div class="mb-4">
            <label class="block text-white font-bold mb-2" for="loginUserName">
              Screen Name
            </label>
            <form:input path="userName" class="form-input" type="text" id="loginUserName" />
            <br>
            <form:errors path="userName" class="text-pink-400 text-sm mt-1" />
          </div>
          <div class="mb-4">
            <label class="block text-white font-bold mb-2" for="loginPassword">
              Password
            </label>
            <form:input path="password" class="form-input" type="password" id="loginPassword" />
            <br>
            <form:errors path="password" class="text-pink-400 text-sm mt-1" />
          </div>
          <div class="flex items-center justify-between">
          <div class="mx-auto">          
            <button type="submit" class="bg-purple-700 text-white font-bold py-2 px-4 rounded">
              Login
            </button>
            </div>
          </div>
        </form:form>
      </div>
    </div>
  </div>
  </div>
</body>

</html>