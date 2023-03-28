<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Rewards</title>
<link rel="stylesheet" type="text/css" href="/css/rewards.css">

</head>
<body>
<input type="hidden" value="${user_id}" class="user_id"/>
<div><a href="/arcade">Back Home</a> </div>
<div class="rewards-container">
  <h2>Your Rewards</h2>
  
  <p>Tickets: <span id="tickets">0</span></p>

  <p>Image: <img src="https://api.dicebear.com/6.x/bottts/svg" alt="avatar"/></p>
</div>

</body>
<script type="text/javascript" src="/js/rewards.js"></script>

</html>
