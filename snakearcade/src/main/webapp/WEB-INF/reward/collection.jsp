<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ page isErrorPage="true" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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
<title>Snake Arcade</title>
</head>
<body>
<div><a href="/arcade">Back Home</a> <a href="/arcade/rewards">View Rewards!</a></div>
<div class="rewards-container">
	<h1>My Collection</h1>
	<c:forEach var="reward" items="${userRewards}">
  <div class="one-reward">
  	<div class="reward-img">
 	  <img src="${reward.archivedReward.hyperlink}" alt="avatar" name="${reward.archivedReward.name}"/>
 	</div>
  	<c:choose>
  		<c:when test="${reward.isEnabled}">
  			<p>Enabled</p>
  		</c:when>
  		<c:otherwise>
  			<form action="/arcade/rewards/collection/${reward.id}" method="post">
  			<input type="hidden" name="_method" value="put"/>
  				<input type="submit" value="Use Avatar"/>
  			</form>
  		</c:otherwise>
  	</c:choose>
  </div>
  </c:forEach>
  </div>
</body>
</html>