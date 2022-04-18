<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>

</head>
<body>

<h1>게시판 등록</h1>
<%-- view에서 controller로 데이터를 전송을 하고 그 데이터가 제대로 들어오는지 확인하기 위해 form 작성 --%>
<form id="enroll_form" action="/board/enroll" method="post">
	
	<div class="input_wrap">
		<label>Title</label>
		<input name="title">
	</div>
	
	<div class="input_wrap">
		<label>Content</label>
		<input name="content">
	</div>
	
	<div class="input_wrap">
		<label>Writer</label>
		<input name="writer">
	</div>
	
	<button class="btn">등록</button>
</form>
<!-- 
<script> //구현되지 않음
	history.pushState(null, null, ''); 

	var checkUnload = true;
	$(window).on("beforeunload", function(){
		if(checkUnload) return "작성 중인 글이 있습니다. 정말로 나가시겠습니까?";
	});
</script>
-->
</body>
</html>