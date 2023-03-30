<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="/webjars/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
	<meta charset="UTF-8">
	<title>Snake Arcade</title>
	<link rel="stylesheet" type="text/css" href="/css/dashboard.css">
</head>
<body>
	<div class="container py-5">
	<h1 class="mb-4">Welcome, ${loggedUser.userName}!</h1>	
		<div style="position: absolute; top: 30px; right: 50px;">
			<a href="/logout" class="btn btn-secondary" style="font-family: sans-serif;">Logout</a>
		</div>
		<div style="position: absolute; top: 50px; left: 50px; margin-top: -175px;">
		  <nav class="game-nav">
		  <ul>
		  <li>
		    <img class="avatar" src="/png/defaultpic.png" alt="avatar">
		    <br>
            <a href="arcade/rewards/collection">View My Avatars!</a>
            </li></ul>
          </nav>
		</div>
	<nav class="game-nav">
	<br>
	<ul>
	<li>
		<a href="/arcade/snake">
			<img class="game-icon" src="/png/snake.png" alt="Snake Game">
			<br>
			<span style="font-family: sans-serif;">Snake Game</span>
		</a>
	</li>
	<li>
		<a href="/arcade/tetris">
			<img class="game-icon" src="/png/tetris.png" alt="Tetris">
			<br>
			<span>Tetris</span>
		</a>
	</li>
	<li>
		<a href="/arcade/tictactoe">
			<img class="game-icon" src="/png/tictactoe.png" alt="Tic-tac-toe">
			<br>			
			<span>Tic-tac-toe</span>
		</a>
	</li>
	<li>
		<a href="/arcade/rewards">
			<img class="game-icon" src="/png/reward.png" alt="Rewards">
			<br>
			<span class="mt-9">Rewards</span>
		</a>
	</li>
			  </ul>
			</nav>
		</div>
</body>
</html>


