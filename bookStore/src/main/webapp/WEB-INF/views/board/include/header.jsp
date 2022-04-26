<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>bookStore</title>
	<!-- Bootstrap css파일 사용 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

	<!-- Bootstrap javascript파일 사용 -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" 
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- 반응형 홈페이지 : 없으면 모바일 환경에서 제대로 작동하지 않음 -->
	
	<%-- JQuery라이브러리를 추가하는 코드 --%>
<script 
	src="http://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
	
	
<link rel="stylesheet" href="/resources/css/include/header.css">
	

</head>


<body>

<header class="p-3 mb-3 border-bottom">
    <div class="container">
      <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
        <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-dark text-decoration-none" style="">
          <img src="../../resources/img/home.svg" width="40" height="32">
        </a>
        <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
          <li><a href="#" class="nav-link px-2 link-secondary">분야</a></li>
          <li><a href="#" class="nav-link px-2 link-dark">베스트 셀러</a></li>
          <li><a href="#" class="nav-link px-2 link-dark">신간 도서</a></li>
          <li><a href="/board/list" class="nav-link px-2 link-dark">후기</a></li>
        </ul>

        <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
          <input type="search" class="form-control" placeholder="검색어를 입력하세요" aria-label="Search">
        </form>

		<!-- 로그인 하지 않았을 때 -->
		<c:if test="${user == null}">
			<div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
			  <ul class="login_ul nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
	          	<li><a href="/user/login" class="btn nav-link px-2 link-secondary">로그인</a></li>
	          </ul>
	        </div>
	    
	
			<div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
			  <ul class="join_ul nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
	          	<li><a href="/user/join" class="btn nav-link px-2 link-secondary">회원가입</a></li>
	          </ul>
	        </div>
		</c:if>
		
		
        <!-- 로그인을 했을 때 -->
        <c:if test="${user != null}">
	        <div class="dropdown text-end">
	          <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
	            <img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle">
	          </a>
	          <ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1" style="">
	            <li><a class="dropdown-item" href="#">마이페이지</a></li>
	            <li><a class="dropdown-item" href="#">장바구니</a></li>
	            <li><a class="dropdown-item" href="#">설정</a></li>
	            <li><hr class="dropdown-divider"></li>
	            <li><a class="dropdown-item" href="/user/logout">로그아웃</a></li>
	          </ul>
	        </div> 
      	</c:if>
      
      </div>
    </div>
  </header>


</body>
</html>