<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>

<jsp:include page="/WEB-INF/views/board/include/header.jsp" />

<link rel="stylesheet" href="/resources/css/board/modify.css">

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<!-- 첨부파일 부트스트랩 디자인 JS -->
<!-- 
<script src="/resources/plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>
 -->
 
 <!-- font awesome -->
<!-- 
<link rel="stylesheet" href="http://cdnjs.cloudeflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

 --> 
<!-- adminLTE -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/admin-lte@3.1/dist/css/adminlte.min.css">


<!-- css -->
<!-- 
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
 -->

</head>
<body>


	<!-- 사용자가 수정하는 input태그를 감싸는 form태그 추가 / 목적 : 사용자가 수정한 데이터 내용을 서버에 전송하기 위한 목적 -->
	<%-- 
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
	 --%>
<%-- 		
	<form id="infoForm" action="/board/modify" method="get">
		<input type="hidden" id="bno" name="bno" value='<c:out value="${pageInfo.bno}" />'>
		<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>' > 
		<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>' > 
	</form>
	 --%>
	
<!-- 버튼 동작되도록 js구현 / '#'은 태그들의 id값이다 -->
<!-- 
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
 -->

<div class="container mod_container">
	<div class="bodytext_area box_inner">
				<!-- 폼영역 -->
				<form method="post" id="modifyForm" action="/board/modify" class="appForm">
					<input type="hidden" value="<c:out value='${pageInfo.bno}' />" name="bno" />
					<fieldset>
						<ul class="app_list">			
							<li class="clear">
								<label for="title_lbl" class="tit_lbl pilsoo_item">제목</label>
								<div class="app_content">
									<input value="<c:out value='${pageInfo.title}' />" type="text" name="title" class="w100p" id="title_lbl" placeholder="제목을 입력해주세요" required/>
								</div>
							</li>
							<li class="clear">
								<label for="content_lbl" class="tit_lbl pilsoo_item">내용</label>
								<div class="app_content">
									<textarea name="content" id="content_lbl" class="w100p" placeholder="내용을 입력해주세요." required><c:out value="${pageInfo.content}" /></textarea>
								</div>
							</li>
							<li class="clear">
								<label for="writer_lbl" class="tit_lbl pilsoo_item">작성자명</label>
								<div class="app_content">
									<input value="<c:out value='${pageInfo.writer}' />" readonly="readonly" type="text" name="writer" class="w100p" id="writer_lbl" />
								</div>
							</li>
							<li class="clear">
								<label for="updatedate_lbl" class="tit_lbl pilsoo_item">수정일</label>
								<div class="app_content">
									<input value='<fmt:formatDate pattern="yyyy-MM-dd" value="${pageInfo.updateDate}" />' readonly="readonly" name="updateDate" class="w100p" id="updateDate_lbl"> 
								</div>
							</li>
							<%-- 
							<li class="clear">
			                    <label for="file_lbl" class="tit_lbl">첨부파일</label>
					                 
					                 <c:forEach begin="0" end="1" var="index">   
					                    <div class="div_file">
						                    <div class="custom-file" style="width:96%;margin:0 2%;">
							                    <input type="file" name="file" class="custom-file-input" id="customFile_${index}">
							                    <label class="custom-file-label" for="customFile" style="color:#999;">파일첨부${index}</label>
							                </div>
							                <c:if test="${boardVO.save_file_names[index] != null}">							
												<br>
												<div class="tit_lbl">
												<a href="/download?save_file_name=${boardVO.save_file_names[index]}&real_file_name=${boardVO.real_file_names[index]}" >${boardVO.real_file_names[index]} 다운로드 링크[${index}]</a>			
												&nbsp;
												<input type="hidden"  name="save_file_name" value="${boardVO.save_file_names[index]}">
												<button type="button" class="btn btn_file_delete" style="border:1px solid #ccc;">삭제</button>
												</div>
											</c:if>
							                <p></p> <!-- 사이에 공백 주기 위해 -->
						                </div>
						           	 </c:forEach>							           	 				           	   
			                </li>
			                 --%>
						</ul>
						
						<div class="btn_line">
							<a type="button" class="btn_bbs" id="list_btn">목록</a>
							<a type="button" class="btn_bbs" id="modify_btn">수정 저장</a>
							<a type="button" class="btn_bbs" id="cancel_btn">수정 취소</a>
							<a type="button" class="btn_bbs" id="delete_btn">삭제</a>
						</div>
						
					</fieldset>
				</form>

			</div>
		
			<form id="infoForm" action="/board/modify" method="get">
				<input type="hidden" id="bno" name="bno" value='<c:out value="${pageInfo.bno}" />'>
				<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>' > <!-- 페이징 이동 정보에 필요함 -->
				<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>' > <!-- 페이징 이동 정보에 필요함 -->
			</form>
		
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