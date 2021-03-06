<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>

<jsp:include page="/WEB-INF/views/board/include/header.jsp" />

<!-- <link rel="stylesheet" href="/resources/css/board/list.css" > -->
<link rel="stylesheet" href="/resources/css/board/insert.css" >

<!-- adminLTE -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/admin-lte@3.1/dist/css/adminlte.min.css">

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>


</head>
<body>

<%-- view에서 controller로 데이터를 전송을 하고 그 데이터가 제대로 들어오는지 확인하기 위해 form 작성 --%>
<!-- 
<form id="insert_form" action="/board/insert" method="post">
	
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
 -->
<!-- 
<script> //구현되지 않음
	history.pushState(null, null, ''); 

	var checkUnload = true;
	$(window).on("beforeunload", function(){
		if(checkUnload) return "작성 중인 글이 있습니다. 정말로 나가시겠습니까?";
	});
</script>
-->











<div class="container mod_container">
	<div class="bodytext_area box_inner">
				<!-- 폼영역 -->
				<form method="post" id="insertForm" action="/board/insert" class="appForm">
					<fieldset>
						<ul class="app_list">			
							<li class="clear">
								<label for="title_lbl" class="tit_lbl pilsoo_item">제목</label>
								<div class="app_content">
									<input type="text" name="title" class="w100p" id="title_lbl" placeholder="제목을 입력해주세요" required/>
								</div>
							</li>
							<li class="clear">
								<label for="content_lbl" class="tit_lbl pilsoo_item">내용</label>
								<div class="app_content">
									<textarea name="content" id="content_lbl" class="w100p" placeholder="내용을 입력해주세요." required></textarea>
								</div>
							</li>
							<li class="clear">
								<label for="writer_lbl" class="tit_lbl pilsoo_item">작성자명</label>
								<div class="app_content">
									<input value="${user.userId}" type="text" name="writer" class="w100p" id="writer_lbl" readonly="readonly" />
								</div>
							</li>
						</ul>	
					</fieldset>
				</form>
				
				<div class="btn_line">
					<a type="button" class="btn_bbs" id="insert_btn">등록</a>
					<!-- <a type="button" class="btn_bbs" id="cancel_btn">작성 취소</a> --> <!-- Resolved [org.springframework.web.HttpRequestMethodNotSupportedException: Request method 'POST' not supported] -->
				</div>
				
			</div>		
	</div>


<!-- 첨부파일 선택한 내용 출력 실행 -->
<!-- 
<script>
$(document).ready(function () {
  bsCustomFileInput.init();
});
</script>
 -->

 
<!-- 버튼 동작되도록 js구현 / '#'은 태그들의 id값이다 -->
<script>
	let form = $("#insertForm"); //게시물 등록
	
	$("#insert_btn").on("click", function(e){
		form.submit();
	});
</script>

<script>
	/* 작성 취소 버튼 */
	/* 
	$("#cancel_btn").on("click", function(e){
		form.find("#bno").remove();
		form.attr("action", "/board/list");
		form.submit();
	});
	 */
</script>		


<script>
$(document).ready(function(){
	$('#content_lbl').summernote({
		height:150,
		lang:"ko-KR",
		placeholder:'글 내용을 입력해 주세요',
		toolbar: [
				    ['fontname', ['fontname']],
				    ['fontsize', ['fontsize']],
				    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
				    ['color', ['forecolor','color']],
				    ['table', ['table']],
				    ['para', ['ul', 'ol', 'paragraph']],
				    ['height', ['height']],
				    ['insert',['link','video']],//'picture',
				    ['view', ['fullscreen', 'help']]
				],
		fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
	});
});//textarea 중 content아이디영역을 섬머노트에디터로 변경처리 함수실행
</script>







</body>
</html>