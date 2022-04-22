<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<jsp:include page="/WEB-INF/views/board/include/header.jsp"/>

</head>


<body>

<div class="container text-center">
	<div class="col-lg-4" style="left:50%;position:absolute;transform:translateX(-50%);padding-top:140px;">
	
					<main class="form-signin">
					  <form action="/login" method="post">
					    <h1 class="h3 mb-3 fw-normal">로그인</h1>
					
					    <div class="form-floating" style="padding-bottom:20px;">
					      <input type="text" class="form-control" id="floatingInput" placeholder="아이디">
					      <label for="floatingInput">ID</label>
					    </div>
					    <div class="form-floating" style="padding-bottom:20px;">
					      <input type="password" class="form-control" id="floatingPassword" placeholder="비밀번호">
					      <label for="floatingPassword">Password</label>
					    </div>
					
					    <div class="checkbox mb-3">
					      <label>
					        <input type="checkbox" value="remember-me"> remember me
					      </label>
					    </div>
					    <button class="w-100 btn btn-lg btn-primary" type="submit">로그인</button>
					    <p class="mt-5 mb-3 text-muted">© 2017–2021</p>
					  </form>
					 </main>
					 
	</div>
</div>



<%--  
	<!-- 로그인 양식 -->
	<div class="container"> 하나의 영역 생성
		<div class="col-lg-4"> 영역 크기
			<!-- 점보트론은 특정 컨텐츠, 정보를 두드러지게 하기 위한 큰 박스 -->
			<div class="jumbotron" style="padding-top:20px;">
				<form method="post" action="loginAction.jsp">
				
					<h3 style="text-align:center;">로그인 화면</h3>
					
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
					</div>
					
					<input type="submit" class="btn btn-primary form-control" value="로그인">
				</form>
			</div>
		</div>
	</div>
  --%>

</body>
</html>