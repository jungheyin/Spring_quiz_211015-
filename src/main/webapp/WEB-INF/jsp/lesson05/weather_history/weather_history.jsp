<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날씨 정보 페이지</title>

 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
 <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css"
	href="/css/weather_style.css">
</head>

<!-- 템플릿으로 나누어서 하는것도 좋음!! -->
<body>
	<div class="container">
		<div class="body d-flex">
			<section class="col-2">
				<header>기상청</header>
				<nav>
					<ur>
						<li>날씨</li>
						<li>날씨입력</li>
						<li>테마날씨</li>
						<li>관측기후</li>
					</ur>
				</nav>
			</section>
			<section class="col-10">
				<table class="table">
					<thead>
						<tr>
							<th>날짜</th>
							<th>날씨</th>
							<th>기온</th>
							<th>강수량</th>
							<th>미세먼지</th>
							<th>풍속</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${weatherHistoryList}" var="item">
						<tr>
							<td>
								<fmt:formatDate value="${item.date}" pattern="yyyy년 M월 d일" />
							</td>
							<td>${itme.weater}
								<img src="/images/cloudy.jpg" alt="날씨">
								<c:choose>
									<c:when test="${itme.weater == '맑음'}"> 
									<img src="/images/sunny.jpg" alt="날씨">
									</c:when> 
									
									<c:when test="${itme.weater == '구름조금'}"> 
									<img src="/images/partlyCloudy.jpg" alt="날씨">
									</c:when> 
									
									<c:when test="${itme.weater == '흐림'}"> 
									<img src="/images/cloudy.jpg" alt="날씨">
									</c:when> 
									
									<c:when test="${itme.weater == '비'}"> 
									<img src="/images/rainy.jpg" alt="날씨">
									</c:when> 
								</c:choose>
							</td>
							<td>${itme.temperatures}C</td>
							<td>${itme.previpitation}mm</td>
							<td>${itme.microDust}</td>
							<td>${itme.windSpeed}km/h</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>	
			</section>
		</div>
		<footer>
			<div class="d-flex">
				<div class="footerLogo"></div>
				<div>
					<small>
						(07062)서울시 동작구 여의대방로16길 61 <br>
						Copyright@ KMA All
					</small>
				</div>
			</div>
		</footer>
	</div>
</body>
</html>