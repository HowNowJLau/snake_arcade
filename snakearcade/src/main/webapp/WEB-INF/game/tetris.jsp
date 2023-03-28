<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tetris Game</title>
<link rel="stylesheet" type="text/css" href="/css/tetris.css">

</head>
<body>
<br>
<div> <a href="/arcade">Back Home</a> </div>
<h1>Tetris</h1>
<input type="hidden" value="${user_id}" class="user_id"/>
<div id="score">Score:</div> <br>
<canvas id="canvas" width="228" height="380"></canvas>
<canvas id="hold" width="76" height="76"></canvas>
<p>Instructions: Use the Left and Right Arrows to move left and right. You can press the Down Arrow to "Soft Drop". The Up Arrow and Q will rotate right. CTRL and E will rotate left. (Not simultaneously for rotation) You can press Space for a "Hard Drop". Press Shift to swap HOLD. Fill up 150 Lines to win.</p>
<script type="text/javascript" src="/js/tetris.js"></script>
</body>
</html>
