<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>

<%-- JQuery라이브러리를 추가하는 코드 --%>
<script 
	src="http://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
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

<h1>목록페이지 입니다.</h1>
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
		}
	
	});
	
<%-- 게시판 제목을 클릭 했을 때, 상세조회로 이동 --%>
	let moveForm = $("#moveForm");
	
	$(".move").on("click", function(e){ 
		e.preventDefault(); //클릭한 a태그 기능 정지 //이벤트 작동 X
		
		moveForm.append("<input type='hidden' name='bno' value=' "+$(this).attr("href")+" '>"); //form태그 내부 bno값을 저장하는 input태그 생성
		moveForm.attr("action", "/board/get"); //form태그 action속성 추가
		moveForm.submit(); //form태그 내부 데이터 서버 전송
	});
</script>

</body>
</html>