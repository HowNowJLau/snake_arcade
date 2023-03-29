<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="/webjars/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
	<script src="/webjars/bootstrap/4.5.2/js/bootstrap.min.js"></script> 
	<meta charset="UTF-8">
	<title>Snake Arcade</title>
	<style>
		@import url('https://fonts.googleapis.com/css?family=Press+Start+2P');
		h1 {
			font-family: 'Press Start 2P', cursive;
			color: #E8DB7D;
			text-align: center;
			margin-top: 100px;
		}
		.form-container {
			height: 420px;
		}
		.form-input, button, a {
			margin-top: 10px;
			margin-bottom: 10px;
			font-family: sans-serif;
		}
  		.form-input{
  		background-color: #23052E;
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
		ul.list-unstyled li {
    	list-style: none;
		}
		nav ul li {
  		margin-bottom: 10px;
		}
		.game-nav {
        display: flex;
        justify-content: space-between;
        align-items: center;
    	}
    	.game-nav ul {
        display: flex;
        list-style-type: none;
        margin: 0;
        padding: 0;
    	}
    	.game-nav li {
        margin-right: 50px;
    	}
    	a{
    	color: #CCCCCC;
    	text-decoration: none;
    	}
    	li::before {
    	transform: scaleX(0);
  		transform-origin: bottom right;
    	}
    	li:hover::before {
  		transform: scaleX(1);
  		transform-origin: bottom left;
		}
		li::before {
  		content: " ";
  		display: block;
  		position: absolute;
  		top: 0; right: 0; bottom: 0; left: 0;
  		inset: 0 0 0 0;
  		background: hsla(100, 90%, 30%, 0.3);
  		z-index: -1;
  		transition: transform .3s ease;
		}
		li {
		margin-top: 50px;
  		position: relative;
		}
		html {
  		block-size: 100%;
  		inline-size: 100%;
		}
		body {
  		min-block-size: 100%;
  		min-inline-size: 100%;
  		margin: 0;
  		box-sizing: border-box;
  		display: grid;
  		font-family: system-ui, sans-serif;
  		background-color: #23052E;
		}
		@media (orientation: landscape) {
  		body {
    	grid-auto-flow: column;
  		}
		}
		.game-icon {
  		height: 100px;
  		width: 100px;
  		display: block;
  		margin: auto;
		}
		.game-nav li {
	    margin-right: 150px;
	    display: flex;
	    flex-direction: column;
	    align-items: center;
	    text-align: center;
		}	
		@media screen and (max-width: 768px) {
	    .game-nav ul {
	    flex-wrap: wrap;
  		}
  		.game-nav li {
    	margin-right: 0;
    	width: 100%;
    	text-align: center;
  		}
		}
	</style>
</head>
<body>
	<div class="container py-5">
	<h1>Reward Creator!</h1>
     <div class ="mx-auto">
        <h2 class="text-2xl font-bold mb-4 text-white">Create Reward</h2>
        <form:form action="/create" method="post" modelAttribute="archived_rewards" class="w-full max-w-sm">
          <div class="mb-4">
            <label class="block text-white font-bold mb-2" for="loginUserName">
              Cost
            </label>
            <form:input path="cost" class="form-input" type="number" id="rewardCost" />
            <br>
            <form:errors path="cost" class="text-pink-400 text-sm mt-1" />
          </div>
          <div class="mb-4">
            <label class="block text-white font-bold mb-2" for="loginPassword">
              Hyperlink
            </label>
            <form:input path="hyperlink" class="form-input" type="text" id="rewardHyperlink" />
            <br>
            <form:errors path="hyperlink" class="text-pink-400 text-sm mt-1" />
          </div>
        <div class="mb-4">
            <label class="block text-white font-bold mb-2" for="loginPassword">
              Name
            </label>
            <form:input path="name" class="form-input" type="text" id="rewardName" />
            <br>
            <form:errors path="name" class="text-pink-400 text-sm mt-1" />
          </div>
          <div class="flex items-center justify-between">
          <div class="mx-auto">          
            <button type="submit" class="bg-purple-700 text-white font-bold py-2 px-4 rounded">
              Create!
            </button>
            </div>
          </div>
        </form:form>
      </div>
	</div>
</body>
</html>



