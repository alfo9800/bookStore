<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<body>

<h1>목록페이지 입니다.</h1>
<a href="/board/enroll">게시판 등록</a>

<script>
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
		}
	
	});
</script>

</body>
</html>