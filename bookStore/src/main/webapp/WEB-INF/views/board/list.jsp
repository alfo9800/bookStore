<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>


<!-- Bootstrap css파일 사용 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<!-- Bootstrap javascript파일 사용 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<%-- JQuery라이브러리를 추가하는 코드 --%>
<script 
	src="http://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<%-- 
<script>
	history.pushState(null, null, ''); //data, title, url의 값이 들어감. 비워두면 이벤트 발생의 플래그 정도로 사용할 수 있음
									   //기존 페이지 이외에 입력한 url로 페이지가 하나 더 만들어지는 것을 알 수 있음
	
	window.onpopstate = function(event){ //뒤로 가기 이벤트 캐치
		history.back(); //pushState로 인하여 페이지가 하나 더 생성 되기 때문에 한 번에 뒤로 가기 위해서 뒤로 가기 한 번 더 해줌
		
		console.log('뒤로가기 ck');
	};
</script>
--%>

</head>

<style>
	a {text-decoration:none;}
	table {border-collapse:collapse; width:1000px; margin-top:20px; text-align:center;}
	td,th {border:1px solid black; height:50px;}
	th {font-size:17px;}
	thead {font-weight:700;}
	
	.table_wrap {margin:50px 0 0 50px;}
	.bno_width {width:12%;}
	.writer_width {width:20%;}
	.regdate_width {width:15%;}
	.updatedate_width {width:15%;}
	.top_btn {font-size:20px; padding:6px 12px; background-color:#fff; border:1px solid #ddd; font-weight:600;}
</style>

<body>

<h1>목록페이지 입니다</h1>
<!-- <a href="/board/enroll">게시판 등록</a> -->

<div class="table_wrap">
	<a href="/board/enroll" class="top_btn">게시판 등록</a>
	<table>
		<thead>
			<tr>
				<th class="bno_width">번호</th>
				<th class="title_width">제목</th>
				<th class="writer_width">작성자</th>
				<th class="regdate_width">작성일</th>
				<th class="updatedate_width">수정일</th>
			</tr>
		</thead>
			<c:forEach items="${list}" var="list">
				<tr>
					<td><c:out value="${list.bno}" /></td>
					<!-- 제목을 눌렀을 때, 해당 조회페이지로 이동할 수 있도록 함 -->
					<td> 
					<!-- 
						<a class="move" href='/board/get?bno=<c:out value="${list.bno}" />'>
							<c:out value="${list.title}" />
						</a>
					-->
						<a class="move" href='<c:out value="${list.bno}" />'>
							<c:out value="${list.title}"/>
						</a>
					</td>
					
					<td><c:out value="${list.writer}" /></td>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${list.regdate}" /></td><%-- <td><c:out value="${list.regdate}" /></td> --%>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${list.updateDate}" /></td><%-- <td><c:out value="${list.updateDate}" /></td> --%>
				</tr>
			</c:forEach>
			<!-- <tr>
				<td>1</td>
				<td>책1</td>
				<td>책1에 대한 내용입니다</td>
				<td>2022-04-10</td>
				<td>2022-04-10</td>
			</tr>
			<tr>
				<td>2</td>
				<td>책2</td>
				<td>책2에 대한 내용입니다</td>
				<td>2022-04-10</td>
				<td>2022-04-10</td>
			</tr> -->
	</table>
	
	<!-- 제목을 눌렀을 때, 해당 게시판 상세조회 -->
	<form id="moveForm" method="get">
	</form>
</div>

<script>
<%-- 게시판 등록 완료 시 띄우는 '알림창' --%>
	$(document).ready(function(){
		let result = '<c:out value="${result}" />'; //서버로부터 전달 받은 값을 저장하기 위한 result변수를 선언한 뒤, 전달받은 값으로 초기화
		
		checkAlert(result);
		
		function checkAlert(result){
			if(result === ''){
				return; //result에 담긴 값이 아무것도 없을 경우 실행되지 않음
			}
			
			if(result === "enroll success"){
				alert("등록이 완료되었습니다"); //result에 담긴 값이 있을 경우 어떠한 메시지가 있는지 체크한 뒤 게시판 등록 완료되었다는 경고창을 띄움
			}
			
			if(result === "modify success"){
				alert("수정이 완료되었습니다"); 
			}
			
			if(result === "delete success"){
				alert("삭제가 완료되었습니다");
			}
		}
	
	});
	
<%-- 게시판 제목을 클릭 했을 때, 상세조회로 이동 --%>
	let moveForm = $("#moveForm");
	
	$(".move").on("click", function(e){ 
		e.preventDefault(); //클릭한 a태그 기능 정지 //이벤트 작동 X
		
		moveForm.append("<input type='hidden' name='bno' value='"+ $(this).attr("href") +"'>"); //form태그 내부 bno값을 저장하는 input태그 생성
		moveForm.attr("action", "/board/get"); //form태그 action속성 추가
		moveForm.submit(); //form태그 내부 데이터 서버 전송
	});
</script>

<script> //문제 : 1) 마우스 뒤로가기로 했을 때는 된다. 그런데 브라우저 왼쪽 상단의 뒤로가기를 눌렀을 때는 안된다. 2) 뒤로가기 3번하면 다시 데이터 있는 상태로 돌아오게 됨.
	history.pushState(null, null, ''); 
	
	window.onpopstate = function(event){ 
		var prevUrl = document.referrer;
		
		if(prevUrl.indexOf('/board/enroll') < 0){ // /board/list로 작성하면 prevUrl에 없기때문에 -1로 반환이 됨. 그래서 무조건 '값이 존재할 것'이 실행 된다. 
			//console.log('이전 페이지는 게시판 등록이 아님 : ' + prevUrl);
			//alert('제출한 양식을 가져옵니다'); //이벤트 감지 시 무조건 alert가 출력됨 -> 주석처리
			history.back(); //등록 창으로 감, 데이터 값은 존재
		}else{
			console.log('데이터 값 사라짐 : ' + prevUrl);
			alert('제출한 양식이 사라집니다');
			location.href = prevUrl; //등록 창으로 감, 데이터 값은 사라짐		
		}
	};
</script>

</body>
</html>