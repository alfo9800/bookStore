<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- JQuery추가 -->
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>

<!-- css -->
<style type="text/css"> 
.input_wrap {padding:5px 20px;}
label {display:block; margin:10px 0; font-size:20px;}
input {padding:5px; font-size:17px;}
textarea {width:800px;  height:200px; font-size:15px; padding:10px;}
.btn {display:inline-block; font-size:22px; padding:6px 12px; background-color:#fff; border:1px solid #ddd; font-weight:600;
    width:140px; height:41px; line-height:39px; text-align: enter; margin-left:30px; cursor:pointer;}
.btn_wrap {padding-left:80px; margin-top:50px;}
#delete_btn {background-color:#f3e3e7;}
</style>

</head>
<body>

<!-- 조회 페이지 관련 -->
<h1>수정 페이지</h1>

	<!-- 사용자가 수정하는 input태그를 감싸는 form태그 추가 / 목적 : 사용자가 수정한 데이터 내용을 서버에 전송하기 위한 목적 -->
	<form id="modifyForm" action="/board/modify" method="post">

		<div class="input_wrap">
			<label>게시판 번호</label>
			<input name="bno" readonly="readonly" value='<c:out value="${pageInfo.bno}" />'>
		</div>
		<div class="input_wrap">
			<label>게시판 제목</label>
			<input name="title" value='<c:out value="${pageInfo.title}" />'> <!-- readonly 속성 지움 -->
		</div>
		<div class="input_wrap">
			<label>게시판 내용</label>
			<textarea rows="3" name="content"><c:out value="${pageInfo.content}" /></textarea> <!-- readonly 속성 지움 -->
		</div>
		<div class="input_wrap">
			<label>게시판 작성자</label>
			<input name="writer" readonly="readonly" value='<c:out value="${pageInfo.writer}" />'>
		</div>
		<div class="input_wrap">
			<label>게시판 등록일</label>
			<input name="regdate" readonly="readonly" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${pageInfo.regdate}" />'>
		</div>
		<div class="input_wrap">
			<label>게시판 수정일</label>
			<input name="updateDate" readonly="readonly" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${pageInfo.updateDate}" />'>
		</div>
		
		<!-- 버튼 관련 -->
		<div class="btn_wrap">
			<a class="btn" id="list_btn">목록</a>
			<a class="btn" id="modify_btn">수정 저장</a>
			<a class="btn" id="cancel_btn">수정 취소</a>
			<a class="btn" id="delete_btn">삭제</a>
		</div>
	
	</form>	
		
	<form id="infoForm" action="/board/modify" method="get">
		<input type="hidden" id="bno" name="bno" value='<c:out value="${pageInfo.bno}" />'>
	</form>
	
<!-- 버튼 동작되도록 js구현 / '#'은 태그들의 id값이다 -->
<script>
	let form = $("#infoForm"); //페이지 이동 form (list목록 & get조회 페이지이동)
	let mform = $("#modifyForm"); //페이지 데이터 수정 form
	
	/* 목록 페이지 이동 버튼 */
	$("#list_btn").on("click", function(e){
		form.find("#bno").remove();
		form.attr("action", "/board/list");
		form.submit();
	});
	
	/* 수정 버튼 */	
	$("#modify_btn").on("click", function(e){
		mform.submit();
	});
	
	/* 취소 버튼 */
	$("#cancel_btn").on("click", function(e){
		form.attr("action", "/board/get");
		form.submit();
	});
	
	/* 삭제 버튼 */
	$("#delete_btn").on("click", function(e){
		form.attr("action", "/board/delete");
		form.attr("method", "post");
		form.submit();
	});
	
</script>

</body>
</html>