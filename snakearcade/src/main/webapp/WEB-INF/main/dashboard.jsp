<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="/webjars/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
	<script src="/webjars/bootstrap/4.5.2/js/bootstrap.min.js"></script> 
	<meta charset="UTF-8">
	<title>Snake Arcade</title>
</head>
<body>
	<div class="container py-5">
		<h1 class="mb-4">Welcome to Snake Arcade</h1>
		<nav>
			<ul class="list-unstyled">
				<li><a href="/logout" class="btn btn-secondary">Logout</a></li>
				<li><a href="/arcade/snake" class="btn btn-primary">Snake Game</a></li>
				<li><a href="/arcade/tetris" class="btn btn-primary">Tetris</a></li>
				<li><a href="/arcade/tictactoe" class="btn btn-primary">Tic-tac-toe</a></li>
			</ul>
		</nav>
	</div>
</body>
</html>
