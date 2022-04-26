<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>

<jsp:include page="/WEB-INF/views/board/include/header.jsp" />

<link rel="stylesheet" href="/resources/css/board/list.css" >

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


<body>

<!-- <h1>목록페이지 입니다</h1> -->
<!-- <a href="/board/enroll">게시판 등록</a> -->


<div class="container" style="padding-top:50px;">

		<!-- 후기 게시판 배너 -->
		<div class="banner_wrap" style="text-align:center;background-color:#f8f9fa;">			
			<a href="#"><!-- <a href="/board/best_review"> -->
				<img src="../../../resources/img/Best_Review.jpg" width="500" height="250">
			</a>
		</div>


		<div class="table_wrap" id="table_wrap">
			<a href="/board/enroll" class="top_btn">게시판 등록</a>
			<table id="Btable">
				<thead>
					<tr>
						<th class="bno_width">No</th>
						<th class="title_width">제목</th>
						<th class="regdate_width">작성일</th>
						<th class="writer_width">작성자</th>			
						<!-- <th class="updatedate_width">작성일</th> -->
						<th class="boardcnt_width">조회수</th>
					</tr>
				</thead>
					<c:forEach items="${list}" var="list">
						<tr>
							<td><c:out value="${list.bno}" /></td>
							<!-- 제목을 눌렀을 때, 해당 조회페이지로 이동할 수 있도록 함 -->
							<td class="left"> 
							<!-- 
								<a class="move" href='/board/get?bno=<c:out value="${list.bno}" />'>
									<c:out value="${list.title}" />
								</a>
							-->
								<a class="move" href='<c:out value="${list.bno}" />'>
									<c:out value="${list.title}"/>
								</a>
							</td>
							
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${list.regdate}" /></td><%-- <td><c:out value="${list.regdate}" /></td> --%>
							<td><c:out value="${list.writer}" /></td>
							<%-- <td><fmt:formatDate pattern="yyyy-MM-dd" value="${list.updateDate}" /></td><td><c:out value="${list.updateDate}" /></td> --%>
							<td><c:out value="${list.boardcnt}" /></td>
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
			
			<!--  -->
			<div class="pageInfo_wrap">
				<div class="pageInfo_area" id="paging">
					<ul id="pageInfo" class="pageInfo">
					
						<!-- 이전페이지 버튼 -->
						<c:if test="${pageMaker.prev}">
							<li class="pageInfo_btn previous"><a href="${pageMaker.startPage-1}">◀Previous</a></li>
						</c:if>
					
						<!-- 각 번호 페이지 버튼 -->
						<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
							<%-- <li class="pageInfo_btn"><a href="${num}">${num}</a></li> --%>
							<li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? 'active' : ''}"><a href="${num}">${num}</a></li>
						</c:forEach>
						
						<!-- 다음페이지 버튼 -->
						<c:if test="${pageMaker.next}">
							<li class="pageInfo_btn next"><a href="${pageMaker.endPage+1}">▶Next</a></li>
						</c:if>
						 
						
						
					</ul>
				</div>
			</div>
			
			
			<!-- 제목을 눌렀을 때, 해당 게시판 상세조회 -->
			<form id="moveForm" method="get">
				<!-- 서버에 페이지 이동 할 때 필요정보인 pageNum과 amount정보를 전송하기 위해 -->
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
			</form>
		</div>
</div>







<!-- 
    <div id="mainWrapper">

        <ul>
            게시판 제목
            <li>게시판 Title </li>

            게시판 목록 
            <li>
                Table
                <ul id ="ulTable">
                    <li>
                        <ul>
                            <li>No</li>
                            <li>제목</li>
                            <li>작성일</li>
                            <li>작성자</li>
                            <li>조회수</li>
                        </ul>
                    </li>
                    게시물이 출력될 영역
                    <li>
                        <ul>
                            <li>1</li>
                            <li class="left">제목제목제목제목1</li>
                            <li>2014.07.09</li>
                            <li>자바킹</li>
                            <li>0</li>
                        </ul>
                    </li>

                    <li>
                        <ul>
                            <li>2</li>
                            <li class="left">제목제목제목제목1</li>
                            <li>2014.07.09</li>
                            <li>자바킹</li>
                            <li>0</li>
                        </ul>
                    </li>

                    <li>
                        <ul>
                            <li>3</li>
                            <li class="left">제목제목제목제목1</li>
                            <li>2014.07.09</li>
                            <li>자바킹</li>
                            <li>0</li>
                        </ul>
                    </li>

                    <li>
                        <ul>
                            <li>4</li>
                            <li class="left">제목제목제목제목1</li>
                            <li>2014.07.09</li>
                            <li>자바킹</li>
                            <li>0</li>
                        </ul>
                    <li>                                        
                </ul>
            </li>

            게시판 페이징 영역
            <li>
                <div id="divPaging">
                    <div>◀</div>
                       <div><b>1</b></div>
                    <div>2</div>
                    <div>3</div>
                    <div>4</div>
                    <div>5</div>
                    <div>▶</div>
                </div>
            </li>

            검색 폼 영역
            <li id='liSearchOption'>
                <div>
                    <select id='selSearchOption' >
                        <option value='A'>제목+내용</option>
                        <option value='T'>제목</option>
                        <option value='C'>내용</option>
                    </select>
                    <input id='txtKeyWord' />
                    <input type='button' value='검색'/>
                </div>
                </li>

        </ul>
    </div>

 -->

























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
	
<%-- 페이징 처리 --%>	
	$(".pageInfo a").on("click", function(e){ //페이지 번호 (a태그) 클릭하였을 때
		e.preventDefault(); //a태그 동작 멈춤
		moveForm.find("input[name='pageNum']").val($(this).attr("href")); //form 태그 내부 pageNum과 관련된 input태그의 value속성값을 클릭한 a태그의 페이지 번호를 삽입
		moveForm.attr("action", "/board/list"); //form태그 action속성 추가 및 '/board/list' 속성값으로 추가
		moveForm.submit();
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