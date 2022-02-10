<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨 찾기 목록</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</head>
<body>
	<div class="container">
		<h1>즐겨 찾기 목록</h1>
		<table class="table">
			<thead>
				<tr>
					<th>No.</th>
					<th>이름</th>
					<th>주소</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="favorite" items="${favoriteList}"> <!--  items는 List안에 가져온거 -->
				<tr>
					<td>${favorite.id}</td> <!-- 여기는 varStatus 혹은 DB의 id값을 넣어도 된다. -->
					<td>${favorite.name}</td>
					<td>${favorite.url}</td>
					<td>
						<div class="deleteBtn btn btn-danger">삭제</div>
					</td>
				</tr>
			</c:forEach>
			
			
			<script>
			$(document).ready(function() {
				// 중복확인 버튼 클릭
				$('.deleteBtn').on('click', function(){
						// alert("삭제");
			
					
					});
				
					$.ajax({
						type: "POST",
						url: "/lesson06/is_delete_favorite",
						data: {"name": name, "url", url},
						success: function(data) {
							alert("삭제");
						location.href:"/lesson06/favorite_list_view"
						}
						
					});
				});
			
			</script>
			
			</tbody>
		</table>
	</div>
</body>
</html>