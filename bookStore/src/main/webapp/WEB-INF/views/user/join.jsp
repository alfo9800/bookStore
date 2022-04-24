<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<jsp:include page="/WEB-INF/views/board/include/header.jsp" />

<link rel="stylesheet" href="/resources/css/user/join.css" >

</head>
<body>

		<div class="wrapper">
			<form id="join_form" method="post">
			<div class="wrap">
					<div class="subjecet">
						<span>회원가입</span>
					</div>
					<div class="id_wrap">
						<div class="id_name">아이디</div>
						<div class="id_input_box">
							<input class="id_input" name="userId">
						</div>
						<span class="id_input_re_1">사용가능한 아이디입니다</span>
						<span class="id_input_re_2">아이디가 이미 존재합니다</span>
					</div>
					<div class="pw_wrap">
						<div class="pw_name">비밀번호</div>
						<div class="pw_input_box">
							<input class="pw_input" name="userPw">
						</div>
					</div>
					<div class="pwck_wrap">
						<div class="pwck_name">비밀번호 확인</div>
						<div class="pwck_input_box">
							<input class="pwck_input">
						</div>
					</div>
					<div class="user_wrap">
						<div class="user_name">이름</div>
						<div class="user_input_box">
							<input class="user_input" name="userName">
						</div>
					</div>
					<div class="mail_wrap">
						<div class="mail_name">이메일</div> 
						<div class="mail_input_box">
							<input class="mail_input" name="userEmail">
						</div>
						<div class="mail_check_wrap">
							<div class="mail_check_input_box">
								<input class="mail_check_input">
							</div>
							<div class="mail_check_button">
								<span>인증번호 전송</span>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
					<div class="address_wrap">
						<div class="address_name">주소</div>
						<div class="address_input_1_wrap">
							<div class="address_input_1_box">
								<input class="address_input_1" name="userAddr1">
							</div>
							<div class="address_button">
								<span>주소 찾기</span>
							</div>
							<div class="clearfix"></div>
						</div>
						<div class ="address_input_2_wrap">
							<div class="address_input_2_box">
								<input class="address_input_2" name="userAddr2">
							</div>
						</div>
						<div class ="address_input_3_wrap">
							<div class="address_input_3_box">
								<input class="address_input_3" name="userAddr3">
							</div>
						</div>
					</div>
					<div class="join_button_wrap">
						<input type="button" class="join_button" value="가입하기">
					</div>
				</div>
			</form>
		</div>


<!-- 회원가입 기능 작동 -->
<script>
<%-- 
	'가입하기 버튼' -> <input type="button" class="join_button" value="가입하기">
	클릭하였을 때, form태그에 속성 action(url경로)가 추가되거, form태그가 서버에 제출디 된다는 의미
	** post는 form에 미리 추가되어져있음 **
--%>
	$(document).ready(function(){
		//회원가입 버튼 동작
		$(".join_button").click(function(){
			$("#join_form").attr("action", "/user/join");
			$("#join_form").submit();
		});
	});
	
	
	
<%-- 회원가입 완료 시 띄우는 '알림창' --%>
/* 
$(document).ready(function(){
	let result = '<c:out value="${result}" />'; //서버로부터 전달 받은 값을 저장하기 위한 result변수를 선언한 뒤, 전달받은 값으로 초기화
	
	checkAlert(result);
	
	function checkAlert(result){
		if(result === ''){
			return; //result에 담긴 값이 아무것도 없을 경우 실행되지 않음
		}
		
		if(result === "join success"){
			alert("등록이 완료되었습니다"); //result에 담긴 값이 있을 경우 어떠한 메시지가 있는지 체크한 뒤 게시판 등록 완료되었다는 경고창을 띄움
		}		
	 }
	});
 */	
 
 
<%-- 아이디 중복검사 --%> 
$('.id_input').on("propertychange change keyup paste input", function(){
	
	//console.log("keyup test");
	
	var userId = $('.id_input').val();	//class id_input에 입력되는 값
	var data = {userId : userId}		//컨트롤에 넘길 데이터 이름 : '데이터 .id_input에 입력되는 값'
	
	$.ajax({
		type : "post",
		url : "/user/userIdCk",
		data : data
	});//ajax 종료
	
});//function 종료
 
</script>



</body>
</html>