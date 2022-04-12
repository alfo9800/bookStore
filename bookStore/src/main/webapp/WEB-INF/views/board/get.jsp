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
</style>

</head>
<body>

<!-- 조회 페이지 관련 -->
<h1>조회 페이지</h1>
	<div class="input_wrap">
		<label>게시판 번호</label>
		<input name="bno" readonly="readonly" value='<c:out value="${pageInfo.bno}" />'>
	</div>
	<div class="input_wrap">
		<label>게시판 제목</label>
		<input name="title" readonly="readonly" value='<c:out value="${pageInfo.title}" />'>
	</div>
	<div class="input_wrap">
		<label>게시판 내용</label>
		<textarea rows="3" name="content" readonly="readonly"><c:out value="${pageInfo.content}" /></textarea>
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
		<!-- url경로에 직접 서버로 전송할 데이터를 작성할 수 있음
		<a class="btn" id="list_btn" href="/board/list">조회</a> 
        <a class="btn" id="modify_btn" href="/board/modify?bno='${pageInfo.bno}'}">수정</a>
         //하지만 추후 페이징 적용, 검색 조건 적용 등 여러 기능이 추가에 따라 유연하게 다양한 상황을 처리하기 위해서 아래 form태그 사용 -->
		<a class="btn" id="list_btn">목록</a>
		<a class="btn" id="modify_btn">수정</a>
	</div>
	<form id="infoForm" action="/board/modify" method="get">
		<input type="hidden" id="bno" name="bno" value='<c:out value="${pageInfo.bno}" />'>
	</form>
	
<!-- 버튼 동작되도록 js구현 / '#'은 태그들의 id값이다 -->
<script>
	let form = $("#infoForm");
	
	//목록으로 가기
	$("#list_btn").on("click", function(e){
		form.find("#bno").remove();
		form.attr("action", "/board/list");
		form.submit();
	});
	
	//수정하기
	$("#modify_btn").on("click", function(e){
		form.attr("action", "/board/modify");
		form.submit();
	});
</script>

</body>
</html>