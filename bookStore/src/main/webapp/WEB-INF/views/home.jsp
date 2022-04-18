<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/board/include/header.jsp" />

<body>
	<header class="p-3 mb-3 border-bottom">
    <div class="container">
      <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
        <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-dark text-decoration-none" style="color:#ffc107;">
          <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg>
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
		<div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
		  <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
          	<li><a href="#" class="btn nav-link px-2 link-secondary" style="color:#fff; background-color:#198754; border-color:#198754;">로그인</a></li>
          </ul>
        </div>

        <!-- 로그인을 했을 때
        <div class="dropdown text-end">
          <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
            <img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle">
          </a>
          <ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1" style="">
            <li><a class="dropdown-item" href="#">New project...</a></li>
            <li><a class="dropdown-item" href="#">Settings</a></li>
            <li><a class="dropdown-item" href="#">Profile</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Sign out</a></li>
          </ul>
        </div> -->
      </div>
    </div>
  </header>
	
	<!-- 
	<div class="d-flex flex-row-reverse bd-highlight">
	  <div class="p-2 bd-highlight">회원가입</div>
	  <div class="p-2 bd-highlight">로그인</div>
	</div>
 -->
 
 
 
 
 
 
 
 
 <div class="flex-shrink-0 p-3 bg-white" style="width: 280px;">
    <a href="/" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
      <!-- <svg class="bi me-2" width="30" height="24"><use xlink:href="#bootstrap"></use></svg> -->
      &nbsp <!-- 공백 만들기 -->
      <span class="fs-5 fw-semibold">분야</span>
    </a>
    <ul class="list-unstyled ps-0">
      <li class="mb-1">
        <button style="font-weight:bold;" class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="true">
          국내도서
        </button>
        <div class="collapse show" id="home-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="#" class="link-dark rounded">소설/시/희곡</a></li>
            <li><a href="#" class="link-dark rounded">장르소설</a></li>
            <li><a href="#" class="link-dark rounded">에세이</a></li>
            <li><a href="#" class="link-dark rounded">인문학</a></li>
            <li><a href="#" class="link-dark rounded">사회과학</a></li>
            <li><a href="#" class="link-dark rounded">역사</a></li>
            <li><a href="#" class="link-dark rounded">과학</a></li>
            <li><a href="#" class="link-dark rounded">예술/대중문화</a></li>
            <li><a href="#" class="link-dark rounded">종교/역학</a></li>
          </ul>
        </div>
      </li>
      <li class="mb-1">
        <button style="font-weight:bold;" class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="false">
          외국도서
        </button>
        <div class="collapse" id="dashboard-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="#" class="link-dark rounded">소설/시/희곡</a></li>
            <li><a href="#" class="link-dark rounded">ELT/어학/사전</a></li>
            <li><a href="#" class="link-dark rounded">인문/사회</a></li>
            <li><a href="#" class="link-dark rounded">경제경영</a></li>
            <li><a href="#" class="link-dark rounded">자기계발</a></li>
            <li><a href="#" class="link-dark rounded">프랑스 도서</a></li>
            <li><a href="#" class="link-dark rounded">독일 도서</a></li>
            <li><a href="#" class="link-dark rounded">스페인 도서</a></li>
            <li><a href="#" class="link-dark rounded">베트남 도서</a></li>
            <li><a href="#" class="link-dark rounded">기타 도서</a></li>
          </ul>
        </div>
      </li>
      <li class="mb-1">
        <button style="font-weight:bold;" class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="false">
          eBook
        </button>
        <div class="collapse" id="orders-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="#" class="link-dark rounded">로맨스</a></li>
            <li><a href="#" class="link-dark rounded">라이트노벨</a></li>
            <li><a href="#" class="link-dark rounded">판타지/무협</a></li>
            <li><a href="#" class="link-dark rounded">만화</a></li>
          </ul>
        </div>
      </li>
      <li class="border-top my-3"></li>
      <li class="mb-1">
        <button style="font-weight:bold;" class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#account-collapse" aria-expanded="false">
          고객센터
        </button>
        <div class="collapse" id="account-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="#" class="link-dark rounded">Settings</a></li>
            <li><a href="#" class="link-dark rounded">Settings</a></li>
            <li><a href="#" class="link-dark rounded">Settings</a></li>
            <li><a href="#" class="link-dark rounded">Settings</a></li>
          </ul>
        </div>
      </li>
    </ul>
  </div>
 
 
</body>
</html>
