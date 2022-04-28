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

<link rel="stylesheet" href="/resources/css/board/get.css">
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
</style>
 -->

<!-- 부트스트랩의 경우는 header에 포함되어 있다 -->

<!-- font awesome -->
<!-- 
<link rel="stylesheet" href="http://cdnjs.cloudeflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
 -->

<!-- adminLTE -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/admin-lte@3.1/dist/css/adminlte.min.css">

</head>
<body>



<!-- 조회 페이지 관련 -->

<%-- 
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
 --%>	
	
	
	<!-- 버튼 관련 -->
	<!-- 
	<div class="btn_wrap"> -->
		<!-- url경로에 직접 서버로 전송할 데이터를 작성할 수 있음
		<a class="btn" id="list_btn" href="/board/list">조회</a> 
        <a class="btn" id="modify_btn" href="/board/modify?bno='${pageInfo.bno}'}">수정</a>
         //하지만 추후 페이징 적용, 검색 조건 적용 등 여러 기능이 추가에 따라 유연하게 다양한 상황을 처리하기 위해서 아래 form태그 사용 -->
		<!-- 
		<a class="btn" id="list_btn">목록</a>
		<a class="btn" id="modify_btn">수정</a>
	</div>
	 -->
	<%--  
	<form id="infoForm" action="/board/modify" method="get">
		<input type="hidden" id="bno" name="bno" value='<c:out value="${pageInfo.bno}" />'>
		<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}" />'> <!-- 페이징 이동 정보에 필요함 -->
		<input type="hidden" name="amount" value='<c:out value="${cri.amount}" />'> <!-- 페이징 이동 정보에 필요함 -->
	</form> 
	 --%>
	
	
<!-- 버튼 동작되도록 js구현 / '#'은 태그들의 id값이다 -->
<!-- 
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

 -->






	<div class="container" id="container">
		<!-- 메인본문영역 -->
		<div class="bodytext_area box_inner">			
			<ul class="bbsview_list">
				<li class="bbs_title" name="title"><c:out value="${pageInfo.title}" /></li><!-- 게시판 제목 -->
				<li class="bbs_hit" name="regdate">작성일 : <fmt:formatDate pattern="yyyy-MM-dd" value="${pageInfo.regdate}" /></li> <!-- 작성일 -->
				<li class="bbs_boardcnt">조회수 : <c:out value="${pageInfo.boardcnt}" /></li><!-- 조회수 -->
				<li class="bbs_content">
					<div class="editer_content" name="content" readonly="readonly">
						<c:out value="${pageInfo.content}" />
						내용입니다
						전주한옥마을
						안산
						스타벅스
						일본여행 가고싶다
						오사카 도쿄
                    </div>
				</li>
				<li class="bbs_title" style="height:inherit;">
					첨부파일 다운로드
					<%-- 
					<c:forEach begin="0" end="1" var="index">
						<c:if test="${boardVO.save_file_names[index] != null}">
							<br>
							<a href="/download?save_file_name=${boardVO.save_file_names[index]}&real_file_name=${boardVO.real_file_names[index]}" >${boardVO.real_file_names[index]} 다운로드 링크[${index}]</a>
							<c:set var="fileNameArray" value="${fn:split(boardVO.save_file_names[index],'.')}" />
			                <c:set var="extName" value="${fileNameArray[fn:length(fileNameArray)-1]}" />
							<!-- lenght의 결과는 2-1= 배열의 인덱스1 -->
							<!-- 첨부파일이 이미지 인지 아닌지 비교해서 img태그를 사용할 지 결정 -->
							
							<!-- fn:contains함수({'jpg','gif','png'...}비교배열내용,JPG,jpg첨부파일확장자) -->
							<c:choose>
								<c:when test="${fn:containsIgnoreCase(checkImgArray,extName)}">
									<br>
									<img style="width:100%;" src="/image_preview?save_file_name=${boardVO.save_file_names[index]}&real_file_name=${boardVO.real_file_names[index]}">
								</c:when>
								<c:otherwise>
									<c:out value="${checkImgArray}" />
									<!-- 사용자 홈페이지 메인 최근게시물 미리보기 이미지가 없을 때 사용 예정. -->
								</c:otherwise>
							</c:choose>
							<!-- true이면 이미지 파일이란 의미 -->		
						</c:if>
					</c:forEach>
					 --%>
				</li>
			</ul>
			<div class="btn_line txt_right">
				<a type="button" class="btn_bbs" id="list_btn">목록</a>
				<a type="button" class="btn_bbs" id="modify_btn">수정</a>				
				<!-- <button class="btn_baseColor btn_smallColor" id="btn_board_delete">삭제</button> -->
			</div>
			<form id="infoForm" action="/board/modify" method="get">
				<input type="hidden" id="bno" name="bno" value='<c:out value="${pageInfo.bno}" />'>
				<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}" />'> <!-- 페이징 이동 정보에 필요함 -->
				<input type="hidden" name="amount" value='<c:out value="${cri.amount}" />'> <!-- 페이징 이동 정보에 필요함 -->
			</form> 
		</div>
	</div>

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
<!-- 
<script>
$(document).ready(function(){
	$("#btn_board_delete").on("click",function(){
		if(confirm("정말로 삭제 하시겠습니까?")) {
			$("form[name='action_form']").attr("method","post");
			$("form[name='action_form']").attr("action","/home/board/board_delete");
			$("form[name='action_form']").submit();
		}
	});	
});
</script>
 -->



</body>
</html>