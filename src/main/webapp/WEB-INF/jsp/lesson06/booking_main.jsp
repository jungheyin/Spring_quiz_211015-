<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		
		<section>
			<section>
				<img alt="메인화면" src="/static/images/Booking/test06_banner1.jpg">
			</section>
			<section class="d-flex">
				<div>
					<h2>실시간<br>예약하기</h2>
				</div>
				<div>
					<h6 class="mb-3">예약하기</h6>
					이름:<input type="text" class="form-control mb-2" id="name">
					전화번호:<input type="text" class="form-control" id="phoneNumber"><br>
					<button id="lookupBtn" class="btn btn-success mt-3" type="button">조회하기</button>
				</div>
				<div>예약문의: <br>010-<br>1111-2222</div>
			</section>
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
	$(document).ready(function(){
		
		$('#lookUpBtn').on('click', function(){
			
			let name = $('#name').val().trim();
			let phonNumber = $('#phonNumber').val().trim();
			
			// validation check
			if (name.length < 1) {
				alert("이름을 입력하세요");
				return;
			}
			if (phonNumber.length < 1) {
				alert("전화번호를 입력하세요");
				return;
			}
			
			if (phoneNumber.startsWith("010") == false) { // 정규식 써도 된다. 
				alert("010으로 시작하느 번호만 입력할 수 있습니다.");
				return;
			} // 개인 작업시에 좀 더 디테일하게 해서 하면 좋다!
			// console을 보기! 
			
			$.ajax({
				type: "POST" // GET도 괜찮고 POST도 괜찮지만 개인정보이므로 POST가 더 나은것 같다.
				, URL:"/booking_look_up_booking"
				, data: {"name": name, "phoneNumber:" phoneNumber}
				, success: function(data) {
					// {"result": "success",
					// "code::"1",
					// "booking": {"name":"신보람", "phoneNumber":"010-2222-2222"}}
					// result 값이나 code값 으로 성공여부 확인하기
					if (data.code == 1) { 
						// 성공
						// data안에 booking 안에 name이라는 키를 가져온다.
						let booking = data.booking; //data 안에 booking
						let message = "이름:" + booking.name
							// 2022-02-15 0, 10
							+ "n\날짜:" + booking.date.slice(0, 10) 
							+ "\n일수:" + booking.day + "\n인원:" + booking.headcount 
							+ "\n상태:" + booking.state;
						
						alert(message);
					} else {
						alert("예약 내역이 없습니다.")
					}
					
				}
				, error: function(e) {
					alert("서버 통신 실패");
				}
				 
			});
		});
		
		let bannerList = []
		let currnetImageIndex = 0;
		setInterval(function(){
			$("#bannerImage").attr("src", bannerList[currentImageIndex]);
			
		});
	});
</script>
</body>
</html>