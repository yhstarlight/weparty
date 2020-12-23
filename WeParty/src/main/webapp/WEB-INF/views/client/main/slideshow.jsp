<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html class="s">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/client/unit.css" rel="stylesheet" />
<link href="/resources/css/client/slide_common.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.1.3/TweenMax.min.js"></script>
<script src="/resources/js/jquery.js"></script>
<script src="/resources/js/client/controller.js"></script>
<style type="text/css">
img.slideshow{
	width:350px; height:490px;
}
</style>
</head>
<body>
	<div class="slide">
		<button class="prev" type="button"><img src="/resources/img/client/button_l.png"></button>
		<ul>
		
			<c:forEach items="${slideShowList}" var="l">
				<li><img class="slideshow" src="/resources${l.display_poster }" onclick="location.href='${l.display_link }'"></li>
			</c:forEach>
		</ul>
		<button class="next" type="button"><img src="/resources/img/client/button_r.png"></button>
	</div>
</body>
</html>