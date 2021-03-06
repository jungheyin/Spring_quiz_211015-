<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨 찾기 추가하기</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</head>
<body>

<!-- form태그는 form:name:submit 이 세개가 세트이다!! -->
	<div class="container">
		<h1>즐겨 찾기 추가하기</h1>
		
		<div class="form-group">
			<label for="name">제목</label>
			<input type="text" class="form-control" id="name">
		</div>
		<div class="form-group">
			<label for="url">주소</label>
			<div class="form-inline">
				<input type="text" class="form-control col-10 mr-5" id="url">
				<button type="button" class="btn btn-info" id="checkBtn">중복확인</button>
			</div>
			
			<!-- 중복된 url일 경우에만 나타낸다. -->
			<small id="isDuplicationText" class="text-danger d-none">중복된 url 입니다.</small> 
			<small id="availableUrlText" class="text-success d-none">저장 가능한 url 입니다.</small> 
			
		</div>
		
		<button class="btn btn-success btn-block" id="addBtn">추가</button> 
	</div>
	
	<script>
		$(document).ready(function() {
			
			// 주소 중복 검사
			$('#checkBtn').on('click', function(){
				//alert("클릭");
				let url = $('#url').val().trim();
				if (url == '') {
					alert("검사할 URL을 입력해주세요");
					return;
				}
				
				// get보단 post
				$.ajax({
					type: "POST"
					, url: "/lesson06/is_duplication_url" // api
					,data: {"url": url}
					,success: function(data) {
						if (data.result) {
						// 중복일때 
							$('#isDuplicationText').removeClass("d-none");
							$('#availableUrlText').addClass("d-none");
						} else { 
						// 중복이 아닐때
							$('#availableUrlText').removeClass("d-none");
							$('#isDuplicationText').addClass("d-none");
						} 
					}
				});
				
			});
			
			// 즐겨찾기 추가
			$('#addBtn').on('click', function() {
				// alert("추가");
				
				let name = $('#name').val().trim();
				if (name > 1) {
					alert("사이트명을 입력하세요.");
					return;
				};
				
				let url = $('#url').val().trim();
				if (url > 1) {
					alert("주소를 입력하세요.");
					return;
				};
				// http도 아니고 https도 아닐 때 => and조건일때 얼럿을 띄워야함
				if (url.startsWith("http") === false && url.startsWith("https") === false ) {
					alert("주소 형식이 잘못되었습니다.");
					return;
				}; // 여기서 한번 검사해주는 것도 좋다.
				
				// quiz02 - 중복확인 체크
				if ($('#availableUrlText').hasClass("d-none")) { 
					// 저장 가능 URL 문구가 없으면 검사를 다시 해야함
					alert("다시 중복 확인을 해주세요");
					return;
				}
				
				// 서버 호출
				$.ajax({ // 아작스는 void도 안되고 무조건 String 을 보내야한다.
					type:"POST"
					, url: "/lesson06/add_favorite"
					, data: {"name": name, "url":url} // 데이터를 보낼것이 있으면 data를 붙여주는것이다.
					, success: function(data) {
						// alert(data.name); 
						// string일경우 alert(data.name); 이런식으로사용한다.
						if (data.result == "success") { // success인가 확인
							// 목록 화면으로 이동
						location.href="/lesson06/favorite_list_view"	
						}
					}
					, error: function(data) {
						alert("error");
					}
				});
				
				
		});
			
	});
	</script>
</body>
</html>