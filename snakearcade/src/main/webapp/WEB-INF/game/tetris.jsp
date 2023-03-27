<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Snake Arcade</title>
<link rel="stylesheet" type="text/css" href="/css/tetris.css">
<script type="text/javascript" src="/js/tetris.js"></script>
</head>
<a href="/arcade">Back Home</a> <br>
<body onload="draw()">
  <h1>tetris</h1>
    <p id="score">score: 0</p>
    <div id="container">
        <canvas id="console"></canvas>
        <p id="skeletonConsole"></p>
    </div>
    <div id="start_stop">
        <button id="startbtn" onclick="start()">start</button>
        <button id="stopbtn" onclick="stop()">stop</button>
    </div>
    <div id="controls">
        <div class="control_row">
            <button id="rotatebtn" class="controlbtn">&#8631</button>
        </div>
        <div class="control_row">
            <button id="leftbtn" class="controlbtn">&#8592</button>
            <button id="downbtn" class="controlbtn">&#8595</button>
            <button id="rightbtn" class="controlbtn">&#8594</button>
        </div>
    </div>
</body>
</html>