<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Snake Arcade</title>
<link rel="stylesheet" type="text/css" href="/css/snake.css">

</head>
<body>
<a href="/arcade">Back Home</a>  
<div><h1>Snake Game</h1></div>
<body>
<input type="hidden" value="${user_id}" class="user_id"/>
<canvas class="board"></canvas>

<div class="game-over hidden">
  <h1>Game Over</h1>
  <h2> Score: <span class="score">0</span></h2>
  <button class="reset-btn">Restart</button>
</div>
</body>
<script type="text/javascript" src="/js/snake.js"></script>
</html>
