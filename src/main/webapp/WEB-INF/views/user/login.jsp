<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<jsp:include page="/WEB-INF/views/board/include/header.jsp"/>

<link rel="stylesheet" href="/resources/css/user/login.css" >

</head>


<body>

<div class="login_container container text-center">
	<div class="col-lg-4">
	
					<main class="form-signin">
					  <form id="login_form" method="post">
					    <h1 class="h3 mb-3 fw-normal">로그인</h1>
					
					    <div class="form-floating">
					      <input type="text" class="form-control id_input" id="userId" name="userId" placeholder="아이디">
					      <label for="floatingInput">아이디</label>
					    </div>
					    <div class="form-floating">
					      <input type="password" class="form-control pw_input" id="userPw" name="userPw" placeholder="비밀번호">
					      <label for="floatingPassword">비밀번호</label>
					    </div>
					
						<!-- **경고문구 :  controller에서 로그인 실패 시 '0'값이 담긴 result를 받아서 사용 -->
						<c:if test="${result == 0}">
							<div class="login_warn">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다</div>
						</c:if>
					
					    <div class="checkbox mb-3">
					      <label>
					        <input type="checkbox" value="remember-me"> remember me
					      </label>
					    </div>
					    <button class="w-100 btn btn-lg btn-primary login_button" type="submit">로그인</button>
					    <p class="mt-5 mb-3 text-muted">© 2017–2021</p>
					  </form>
					 </main>
					 
	</div>
</div>


<script>
<%-- 로그인 버튼 클릭 메서드 --%>
//var prevUrl = document.referrer;
//console.log('전 페이지 : ' + prevUrl);

$(".login_button").on("click", function(){
	//alert("로그인 버튼 작동");
	
	/* 로그인 버튼 클릭 메서드 내부에 로그인 메서드를 서버에 요청하는 코드 */
	$("#login_form").attr("action", "/user/login");	
	$("#login_form").submit();
	/* 
	$("#login_form").submit(function(e){
		e.preventDefault();
		var prevUrl = document.referrer;
		console.log('전 페이지 : ' + prevUrl);
		location.href = prevUrl;
	});
 */
	
});

</script>

<script>
<%-- 페이지가 로드되었을 때, 어디서 넘어왔는지 체크 --%>
/* 
var prevUrl = document.referrer;
console.log("이전 페이지 정보" + prevUrl);

var page = prevUrl.indexOf('/user/login');
console.log('=======> ' + page); // -1 출력

if(prevUrl.indexOf('/user/login') != -1){
	//window.location.href = "/";
}else{
	//window.location.href = prevUrl;
}
 */


//var subprevUrl = prevUrl.indexOf('/board/list')
//console.log('========= ' + subprevUrl); //5가 찍힘
//var subprevUrl = prevUrl.indexOf('/*')
//console.log('========= ' + subprevUrl); //-1이 찍힘

//===================================================================
/* 
if(prevUrl == 'http://localhost:8080/' 
	|| prevUrl == 'http://localhost:8080/user/login'
	|| prevUrl == 'http://localhost:8080/user/join' 	){ 
	console.log('페이지가 없음');
	
}else if(prevUrl !== 'http://localhost:8080/'){
	console.log('전 페이지가 있음');
}
 */
</script>


</body>
</html>