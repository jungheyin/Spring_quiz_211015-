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
			<label for="address">주소</label>
			<input type="text" class="form-control" id="address">
		</div>
		
		<button class="btn btn-success w-100" id="addBtn">추가</button>
	</div>
	
	<script>
		$(document).ready(function(e) {
			
			$('#addBtn').on('click', function() {
				// alert("추가");
				
				let name = $('#name').val.trim;
				if (name > 1) {
					alert("제목을 입력하세요.");
					return;
				};
				
				let address = $('#address').val.trim();
				if (address > 1) {
					alert("주소를 입력하세요.");
					return;
				};
				
				consele.log(name);
				consele.log(address);
			});
			
			$.ajax({
				type:'POST'
				, url: 'lesson06/favorite/afterFavorite'
				, success: function(data)
					alert(data);
					location.href="localhost/lesson06/aferFavorite"
				, error: function(data)
					alert("error" + e);
			});
			
		});
	</script>
</body>
</html>