<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통나무 팬션</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
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
			<div>
		<h1 class="text-conter">예약하기</h1>
		<div>
			<label for="name">이름</label>
			<input type="text" id="name" class="form-control" name="name">
		</div>
		<div>
			<label for="date">예약날짜</label>
			<input type="text" id="date" class="form-control" name="date">
		</div>
		<div>
			<label for="day">숙박일수</label>
			<input type="text" id="day" class="form-control" name="day">
		</div>
		<div>
			<label for="headcount">숙박인원</label>
			<input type="text" id="headcount" class="form-control" name="headcount">
		</div>
		<div>
			<label for="phoneNumber">전화번호</label>
			<input type="text" id="phoneNumber" class="form-control" name="phoneNumber">
		</div>
		
		<button type="button" id="reservationBtn" class="btn btn-warning">예약하기</button>
	</div>
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
	
	// 데이트 피커(예약날짜)
	$('input[name=date]'). datepicker ({
		dateFormat:'yy-mm=dd'
		,minDate: 0 // 오늘부터 그 뒤 선택
	});
	$('reservationBtn').on('click', function() {
		
		let name = $('input[name=name]').val().trim();
		
		let date = $('input[name=date]').val().trim();
		let day = $('input[name=day]').val().trim();
		let headcount = $('input[name=headcount]').val().trim();
		let phoneNumber = $('input[name=phoneNumber]').val().trim();
		
		// validation
		if (name == '') {
			aleter("이름을 입력하세요");
			return;
		}
		
		if (date == '') {
			aleter("날짜를 입력하세요");
			return;
		}
		if (day == '') {
			aleter("숙박일을 입력하세요");
			return;
		}
		
		if (isNaN(day)) { // 숫자가 아닌 경우
			alert("숙박일은 숫자만 입력 가능합니다.")
			return;
		}
		if (headcount == '') {
			aleter("숙박인원을 입력하세요");
			return;
		}
		if (isNaN(headcount)) { // 숫자가 아닌 경우
			alert("숙박인원은 숫자만 입력 가능합니다.")
			return;
		}
		if (phoneNumber == '') { // 정규식이 아니인지 체크도 할 수 있다.
			aleter("핸드폰 번호를 입력하세요");
			return;
		}
		
		$.ajax({
			type: "POST"
			, url: "/booking_add_booking"
			, data: {"name":name, "date": date, "day": day, 
				"headcount": headcount, "phoneNumber": phoneNumber}
			, success: function(data) {
				//성공
				if (data.code == 1) {
					alert("예약 되었습니다.");
					location.href = "/booking_list_view";
				} else {
					alert("예약 처리에 실패했습니다.")
				}
				
			} // else와 error에서 문구는 좀 다르게 한다. 그래서 구분할수 있기 때문이다.!!
			, error: function(data) {
				alert("예약하는데 실패했습니다.")
			}
		});
	});
});
</script>
	
</body>
</html>