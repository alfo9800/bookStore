<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/board/include/header.jsp" />

<%-- 
<style>
* {margin:0;padding:0;box-sizing:border-box;}
label {display:flex;align-items:center;position:relative;top:30px;left:30px;transition:.5s;}
.material-icons {font-size:3rem;margin-right:10px;}
.bookmark-btt {border:none;outline:none;background-color:transparent;font-size:3rem;}
section {background-color:#34495e;color:#fff;width:200px;padding-top:30px;padding-left:30px;position:absolute;top:0;left:-200px;bottom:0;transition:ls ease;}
.bookmark-lists {padding-left:45px;}
.bookmark {margin:30px 0;}
.bookmark:nth-child(1) {margin-top:50px;}
.bookmark a {color:#fff;text-decoration:none;}
</style>
--%>

<body>	
	<!-- 
	<div class="d-flex flex-row-reverse bd-highlight">
	  <div class="p-2 bd-highlight">회원가입</div>
	  <div class="p-2 bd-highlight">로그인</div>
	</div>
 -->
<div class="container" style="padding-top:50px;">
		 <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
		  <div class="carousel-indicators">
		    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
		    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
		  </div>
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <img src="../../resources/img/blue.jpg" class="d-block w-100" alt="파란색이미지입니다" height="500">
		      <div class="carousel-caption d-none d-md-block">
		        <h5>First slide label</h5>
		        <p>Some representative placeholder content for the first slide.</p>
		      </div>
		    </div>
		    <div class="carousel-item">
		      <img src="../../resources/img/sky.jpeg" class="d-block w-100" alt="파란색이미지입니다" height="500">
		      <div class="carousel-caption d-none d-md-block">
		        <h5>Second slide label</h5>
		        <p>Some representative placeholder content for the second slide.</p>
		      </div>
		    </div>
		    <div class="carousel-item">
		      <img src="../../resources/img/blue.jpg" class="d-block w-100" alt="파란색이미지입니다" height="500">
		      <div class="carousel-caption d-none d-md-block">
		        <h5>Third slide label</h5>
		        <p>Some representative placeholder content for the third slide.</p>
		      </div>
		    </div>
		  </div>
		  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Previous</span>
		  </button>
		  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Next</span>
		  </button>
		</div>
</div>
 
 
 <!-- 책 정보 띄우는 카드 --> 
 <div class="container" style="padding-top:100px;text-align:center;">
			<div class="card" style="width: 18rem;float:left;margin-right:30px;">
			  <img src="../../resources/img/Book1.jpg" class="card-img-top" alt="...">
			  <div class="card-body">
			    <h5 class="card-title">2022년 젊은작가상 수상작품집</h5>
			    <p class="card-text">2022년 봄, 젊은작가상이 올해의 수상자를 호명한다. 임솔아, 김멜라, 김병운, 김지연, 김혜진, 서수진, 서이제라는 이름. 임솔아의 '초파리 돌보기'가 대상을 수상했다.</p>
			    <a href="#" class="btn btn-primary">보러가기</a>
			  </div>
			</div>
			
			<div class="card" style="width: 18rem;float:left;margin-right:30px;">
			  <img src="../../resources/img/Book2.jpg" class="card-img-top" alt="...">
			  <div class="card-body">
			    <h5 class="card-title">저주토끼</h5>
			    <p class="card-text">정보라의 호러/SF/판타지 소설집 '저주토끼'가 2022 부커상 1차후보로 지명되었다. 우리 독자에겐 한강의 '채식주의자'가 2016년 수상하며 더욱 각별해진 그 상이다.</p>
			    <a href="#" class="btn btn-primary">보러가기</a>
			  </div>
			</div>
			
			<div class="card" style="width: 18rem;float:left;margin-right:30px;">
			  <img src="../../resources/img/Book3.jpg" class="card-img-top" alt="...">
			  <div class="card-body">
			    <h5 class="card-title">아무튼, 노래</h5>
			    <p class="card-text">“노래방을 장악해보지도 않은 내가 왜 노래에 관한 책을 쓰는가?” 이슬아 작가는 스스로 던진 이 물음에, 생각해보면 몹시 자연스러운 일이라고 답한다.</p>
			    <a href="#" class="btn btn-primary">보러가기</a>
			  </div>
			</div>
</div>
 
 
 
 <!-- 하단의 소스를 가져다가 사용을 해봅시다 -->
 <%--  
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
--%>
 
</body>
</html>
