<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
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
  
  <p>Tickets: ${loggedUser.tickets}</p>

  
  <c:forEach var="reward" items="${allRewards}">
  <div class="one-reward">
    <p>Image:</p>
  	<div class="reward-img">
 	  <img src="${reward.hyperlink}" alt="avatar" name="${reward.name}"/>
 	</div>
 	<p>Cost: ${reward.cost} tickets</p>
  	<a href="/arcade/rewards/redeem">Redeem this Avatar</a>
  </div>
  </c:forEach>
</div>

</body>

</html>
