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
						<!-- select하는 방법중에  name이나 class하는 방법이있다.-->
						
						<!-- 1. name속성과 vlaue 속성르 이용해서 삭제버튼 감지  -->
						<!-- <button type="button" name="delBtn" class="btn btn-danger" value="${favorite.id}">삭제</button> -->
						<!-- value값으로 삭제를 할거이다.! value는 속성이다. -->
						
						<!--  value를 여러개를 넣을땐 위에 처럼 넣으면 힘들다!!  -->
						
						<!-- 2) data를 이용해서 태그에 임시 저장해놓기 -->
						<!--  class 속성으로 이용해 삭제 -->
						<button type="button" class="del-btn btn btn-danger" data-favorite-id="${favorite.id}">삭제</button>
						<!-- data-favorite-id이것은 카멜케이스로 되면 안되다 무조건 -(하이픈)을 이용해서 사용해야한다. 
							data-이름지정= -->
						
					</td>
				</tr>
			</c:forEach>
			
			
<script>
$(document).ready(function() {
	// 중복확인 버튼 클릭
	
	<!-- 1. name속성과 vlaue 속성르 이용해서 삭제버튼 감지  -->
	/* 밥법 2.
		// 1) name속성과 vlaue 속성르 이용해서 삭제버튼 감지 
	$('td').on('click', 'button[name=delBtn]', function(e){
		let id = e.target.value; <!-- target으로 사용하는 방법 -->
	});
		 */

	/* 방법 1
	$(document).ready(function() {
	// 중복확인 버튼 클릭
	$('td').on('click', 'button[name=delBtn]', function(){
		let id = $(this).attr('value')
		alert(id);
		<!-- 여기에서 this는 클릭 그 자체 attr:속성-->
	});
		
}); 
*/
	// 2) data를 이용해서 태그에 임시 저장해놓기
	// 태그: data-favorite-id 속성 : data- 그 뒤부터는 우리가 이름을 정한다.(반드시 - 하이픈사용)
	// 자바스크립트: $(this).data('favorite-id');
		$('.del-btn').on('click', function(e) {
			let id = $(this).data('favorite-id');
			// data(키값:위에서 우리가 지정한 이름 data빼고)
			 alert(id);
			
			$.ajax({
				type: "POST"
				, url: "/lesson06/delete_favorite"
				, data: {"id": id}
				, success: function(data) {
					//alert(data.result);
					// 삭제를 한다음 새로고침을 하는 효과를 낸다.
					if (data.result == 'success') {
						alert("성공");
						location.reload();
					} else {
						alert("삭제 하는데 실패했습니다. 관리자에게 문의해주세요.");
					}
				}
				, error: function(e) {
					alert("에러");
				}
				// DELETE는 주위해야하는것!!: 남의 아이디를 알아내서 삭제 할수있으므로 꼭 POST로 해주기
			});
		});

});

</script>
			<!-- 에러났을 경우 console과 네트워크 보기!: 네트워크에서 화면 연결이 잘 됐는지 본다.
			 그 후 에러 못찾았을땐, 위에서부터 하나씩 다시 해보기.. -->
			</tbody>
		</table>
	</div>
</body>
</html>