<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Rewards</title>
<link rel="stylesheet" type="text/css" href="/css/rewards.css">

<style>
  		.one-reward {
    	display: inline-block;
    	margin-right: 20px;
    	margin-bottom: 30px;
  		html {
  		block-size: 100%;
  		inline-size: 100%;
		}

</style>

</head>
<body>
<input type="hidden" value="${user_id}" class="user_id"/>
<div><a href="/arcade">Back Home</a> <a href="/arcade/rewards/collection">View My Avatars!</a>
</div>
<div class="rewards-container">
  <h1>Your Rewards</h1>
  <p>Tickets: ${loggedUser.tickets}</p>
  <p>${error}</p>
  <c:forEach var="archivedReward" items="${allRewards}">
  <div class="one-reward">
  	<div class="reward-img">
 	  <img src="${archivedReward.hyperlink}" alt="avatar" name="${archivedReward.name}"/>
 	</div>
 	<p>Cost: ${archivedReward.cost} tickets</p>
 	<c:set var="doesUserHaveReward" value="false"/>
 	<c:forEach var="reward" items="${archivedReward.rewards}">
 		<c:if test="${reward.user.id == user_id}">
 			<c:set var="doesUserHaveReward" value="true"/>
 		</c:if>
  	</c:forEach>
  	<c:choose>
  		<c:when test="${doesUserHaveReward}">
  			<p>Already Redeemed</p>
  		</c:when>
  		<c:otherwise>
  			<form action="/arcade/rewards/redeem/${archivedReward.id}" method="post">
  				<input type="submit" value="Redeem Avatar"/>
  			</form>
  		</c:otherwise>
  	</c:choose>
  </div>
  </c:forEach>
</div>

</body>

</html>
