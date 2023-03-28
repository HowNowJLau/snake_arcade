<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tic-tac-toe Game</title>
<link rel="stylesheet" type="text/css" href="/css/tictactoe.css">
<script type="text/javascript" src="/js/tictactoe.js"></script>
</head>
<body>
<input type="hidden" value="${user_id}" class="user_id"/>
<br>
<a href="/arcade">Back Home</a> <br>
  <body onload="initialize()">
    <h1>Tic-Tac-Toe</h1>
    <table id="table_game">
      <tr><td class="td_game"><div id="cell0" onclick="cellClicked(this.id)" class="fixed"></div></td><td class="td_game"><div id="cell1" onclick="cellClicked(this.id)" class="fixed"></div></td><td class="td_game"><div id="cell2" onclick="cellClicked(this.id)" class="fixed"></div></td></tr>
      <tr><td class="td_game"><div id="cell3" onclick="cellClicked(this.id)" class="fixed"></div></td><td class="td_game"><div id="cell4" onclick="cellClicked(this.id)" class="fixed"></div></td><td class="td_game"><div id="cell5" onclick="cellClicked(this.id)" class="fixed"></div></td></tr>
      <tr><td class="td_game"><div id="cell6" onclick="cellClicked(this.id)" class="fixed"></div></td><td class="td_game"><div id="cell7" onclick="cellClicked(this.id)" class="fixed"></div></td><td class="td_game"><div id="cell8" onclick="cellClicked(this.id)" class="fixed"></div></td></tr>
    </table>
    <div id="restart" title="Start new game" onclick="restartGame(true)"><span style="vertical-align:top;position:relative;top:-10px">#</span></div>
    <table>
      <tr><th class="th_list">Computer</th><th class="th_list" style="padding-right:10px;padding-left:10px">Draws</th><th class="th_list">Player</th></tr>
      <tr><td class="td_list" id="computer_score">0</td><td class="td_list" style="padding-right:10px;padding-left:10px" id="tie_score">0</td><td class="td_list" id="player_score">0</td></tr>
    </table>
    <!-- The modal dialog for announcing the winner -->
    <div id="winAnnounce" class="modal">
      <!-- Modal content -->
      <div class="modal-content">
        <span class="close" onclick="closeModal('winAnnounce')">&times;</span>
        <p id="winText"></p>
      </div>
    </div>
    <!-- The dialog for getting feedback from the user -->
    <div id="userFeedback" class="modal">
      <!-- Modal content -->
      <div class="modal-content">
        <p id="questionText"></p>
        <p><button id="yesBtn">Yes</button>&nbsp;<button id="noBtn">No</button></p>
      </div>
    </div>
    <!-- The options dialog -->
    <div id="optionsDlg" class="modal">
      <!-- Modal content -->
      <div class="modal-content">
        <h2>How would you like to play?</h2>
          <h3>Difficulty:</h3>
          <label><input type="radio" name="difficulty" id="r0" value="0">easy&nbsp;</label>
          <label><input type="radio" name="difficulty" id="r1" value="1" checked>hard</label><br>
          <h3>Play as:</h3>
          <label><input type="radio" name="player" id="rx" value="x" checked>X (go first)&nbsp;</label>
          <label><input type="radio" name="player" id="ro" value="o">O<br></label>
          <p><button id="okBtn" onclick="getOptions()">Play</button></p>
      </div>
    </div>
  </body>
</html>