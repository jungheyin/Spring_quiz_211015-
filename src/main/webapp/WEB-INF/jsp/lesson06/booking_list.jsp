<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 목록</title>


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css" href="/css/booking_style.css"> <!-- 꼭 아래쪽에 있어야한다. -->
</head>
<body>
	<div id="wrap" class="container">
		<header class="text-center">
			<a href="#">
				<h1 class="logo text-dark">통나무 팬션</h1>
			</a>
		</header>
		
		<nav class=" menu d-flex align-items-center justify-content-center mb-3">
			<ur class="nav w-100 nav-fill">
				<li class="nav-item" ><a href="#" class="nav-link text-white font-weight-bold">팬션소개</a></li>
				<li class="nav-item" ><a href="#" class="nav-link text-white font-weight-bold">객실보기</a></li>
				<li class="nav-item" ><a href="booking_reservation_view" class="nav-link text-white font-weight-bold">예약하기</a></li>
				<li class="nav-item" ><a href="booking_list_view" class="nav-link text-white font-weight-bold">예약목록</a></li>
			</ur>
		</nav>
		
		<section class="contents">
			<h3 class="text-center mb-3"><b>예약 목록 보기</b></h3>
			<table class="table text-center">
			<thead>
				<tr>
					<th>이름</th>
					<th>예약날짜</th>
					<th>숙박일수</th>
					<th>숙박인원</th>
					<th>전화번호</th>
					<th>예약상태</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="booking" items="${bookingList}">	
				<tr>
					<td>${booking.name}</td>
					<td>
						<fmt:formatDate value="${booking.date}" pattern="yyyy년 M월 d일" />
						<!-- DTO에서 date객체가 무엇인지 보고 Date형 일경우 바로 formatDate만 해주면 된다. -->
						<!-- 원형 그대로 가져와서 내가 원하는 형태로 바꾸는게 좋다. -->
					</td>
					<td>${booking.day}</td>
					<td>${booking.headcount}</td>
					<td>${booking.phoneNumber}</td>
					<td>
					<c:choose>
						<c:when test="${booking.state == '대기중'}"> 
							<span class="text-info">${booking.state}</span>
						</c:when>
						<c:when test="${booking.state == '확정'}"> 
							<span class="text-success">${booking.state}</span>
						</c:when>
						<c:when test="${booking.state == '취소'}"> 
							<span class="text-danger">${booking.state}</span>
						</c:when>
					</c:choose>
					
					</td>
					<td><button class="del-btn btn btn-danger" data-booking-id="${booking.id}">삭제</button></td>
					<!-- value 보단 data로 사용하기 -->
				</tr>
			</c:forEach>
			</tbody>
			</table>
		</section>
		<footer>
			<samll class="text-secondary">
				제주특별자치도 제주시 애월읍 <br>
				사업자등록번호:111-23-25555222//농어촌민박사업자지정/대표김등록<br>
				Capyright 2025 tongnamu All right revered.
			</samll>
		</footer>
	</div>
	
<script>
	$(document).ready(function() {
		$('.del-btn').on('click', function() {
			// alert("삭제 버튼");
			// del-btn은 리스트라고 생각하면 된다. 
			let bookingId = $(this).data('booking-id');
			// alert(bookingId);
		$.ajax({
				// delete라는 type이 있다.
			type: "DELETE"
			, url: "/booking_delete"
			, data: {"id", bookingId} // 키와 벨류의 이름이 다르다!! 잘 확인해야함!
			, success: function(data) {
				
				if (data.result == "success") {
				// 성공적으로 삭제된 후에 새로고침
				location.reload();
				}
				
			}
			, error: function(e) { // 사용자가 보이는 곳이므로 예쁘게 에러 처리 하는게 좋다.
				alert("에러");
			}
		});
		
	});
});
	</script>
</body>
</html>