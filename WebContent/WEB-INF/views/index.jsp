<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="root" value="${pageContext.request.contextPath }"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>메인페이지</title>
<script src="${root}/script/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1.6.1/dist/sockjs.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/stompjs/lib/stomp.min.js"></script>
<script src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>

<script>
document.addEventListener('DOMContentLoaded', function () {
    var timeElements = document.querySelectorAll('.time');

    timeElements.forEach(function (timeElement) {
        var boardDate = moment(timeElement.textContent, 'YYYY-MM-DD HH:mm:ss');
        var now = moment(); // 현재 시간
        var diffInMinutes = now.diff(boardDate, 'minutes');
        var diffInHours = now.diff(boardDate, 'hours');
        var diffInDays = now.diff(boardDate, 'days');

        var relativeTime;
        if (diffInMinutes < 1) {
            relativeTime = '방금 전';
        } else if (diffInHours < 1) {
            relativeTime = diffInMinutes + '분 전';
        } else if (diffInHours < 24) {
            relativeTime = diffInHours + '시간 전';
        } else if (diffInDays < 7) {
            relativeTime = diffInDays + '일 전';
        } else {
            relativeTime = boardDate.format('YYYY-MM-DD');
        }

        timeElement.textContent = relativeTime;
    });
});
</script>

	<style>
	  
		#comments{
			color: #878787;
		}
		
		.carousel-control-prev-icon,
		.carousel-control-next-icon {
			background-color: gray;
			/* 아이콘의 배경색을 검정색으로 변경 */
			border-radius: 50%;
			/* 동그라미 모양으로 만들기 */
			width: 30px;
			/* 동그라미의 너비 */
			height: 30px;
			/* 동그라미의 높이 */
			display: flex;
			align-items: center;
			justify-content: center;

		}	
		 .hover-pointer:hover {
		    cursor: pointer;
		}
	</style>
</head>

<body>	
<c:import url="/WEB-INF/views/include/header.jsp" />

	<div id="categoryphoto" class="carousel" style="width: 100%; margin: auto;"> <!-- 캐러셀 부분--> 
      <div class="carousel-inner">
         <div class="carousel-item active">
            <img src="image/test5.png" class="d-block w-100" style="height: 500px;" alt="pic">
         </div>
         <div class="carousel-item">
            <img src="image/2.png" class="d-block w-100" style="height: 500px;" alt="pic1">
         </div>
         <div class="carousel-item">
            <img src="image/It.png" class="d-block w-100" style="height: 500px;" alt="p">
         </div>
      </div>
      <button class="carousel-control-prev" type="button" data-bs-target="#categoryphoto" data-bs-slide="prev">
         <span class="carousel-control-prev-icon" aria-hidden="true"></span>
         <span class="visually-hidden">Previous</span>
      </button>
      <button class="carousel-control-next" type="button" data-bs-target="#categoryphoto" data-bs-slide="next">
         <span class="carousel-control-next-icon" aria-hidden="true"></span>
         <span class="visually-hidden">Next</span>
      </button>
   </div>
  

	<div class="container d-flex justify-content-center mb-3"> <!-- 카테고리 부분 -->
		<div class="categories list-group list-group-horizontal mt-3" style="width: 50%;">
			<button type="button"  onclick="location.href='${root}/detailCategory?service_category_id=${categoryList[0].service_category_id }'"
				class="license list-group-item list-group-item-action d-flex flex-column align-items-center justify-content-center border-0 mr-3">
				<img src="image/study.png" alt="과외 이미지" class="img-fluid" style="width: 50%;">
				<span class="ms-2 text-center mt-2 fw-bold">시험/자격증</span>
			</button>
			<button type="button" onclick="location.href='${root}/detailCategory?service_category_id=${categoryList[1].service_category_id }'"
				class="list-group-item list-group-item-action d-flex flex-column align-items-center justify-content-center border-0 mr-3">
				<img src="image/interior.png" alt="인테리어 이미지" class="img-fluid" style="width: 50%;">
				<span class="ms-2 text-center mt-2 fw-bold">인테리어</span>
			</button>
			<button type="button" onclick="location.href='${root}/detailCategory?service_category_id=${categoryList[2].service_category_id }'"
				class="list-group-item list-group-item-action d-flex flex-column align-items-center justify-content-center border-0 mr-3">
				<img src="image/repair-11252667.png" alt="가전제품 이미지" class="img-fluid" style="width: 50%;">
				<span class="ms-2 text-center mt-2 fw-bold">가전제품</span>
			</button>
			<button type="button" onclick="location.href='${root}/detailCategory?service_category_id=${categoryList[3].service_category_id }'"
				class="clean list-group-item list-group-item-action d-flex flex-column align-items-center justify-content-center border-0">
				<img src="image/clean (1).png" alt="청소 이미지" class="img-fluid" style="max-width: 50%;">
				<span class="ms-2 text-center mt-2 fw-bold">청소</span>
			</button>
		</div>

		<div class="categories list-group list-group-horizontal mt-3" style="max-width: 50%;">
			<button type="button" onclick="location.href='${root}/detailCategory?service_category_id=${categoryList[4].service_category_id }'"
				class="list-group-item list-group-item-action d-flex flex-column align-items-center justify-content-center border-0">
				<img src="image/translation-2751742.png" alt="번역 이미지" class="img-fluid" style="max-width: 50%;">
				<span class="ms-2 text-center mt-2 fw-bold">번역</span>
			</button>
			<button type="button" onclick="location.href='${root}/detailCategory?service_category_id=${categoryList[5].service_category_id }'"
				class="list-group-item list-group-item-action d-flex flex-column align-items-center justify-content-center border-0">
				<img src="image/document.png" alt="문서 이미지" class="img-fluid" style="max-width: 50%;">
				<span class="ms-2 text-center mt-2 fw-bold">문서</span>
			</button>
			<button type="button" onclick="location.href='${root}/detailCategory?service_category_id=${categoryList[6].service_category_id }'"
				class="list-group-item list-group-item-action d-flex flex-column align-items-center justify-content-center border-0">
				<img src="image/development.png" alt="개발 이미지" class="img-fluid" style="max-width: 50%;">
				<span class="ms-2  text-center mt-2 fw-bold">개발</span>
			</button>
			<button type="button" onclick="location.href='${root}/detailCategory?service_category_id=${categoryList[7].service_category_id }'"
				class="list-group-item list-group-item-action d-flex flex-column align-items-center justify-content-center border-0">
				<img src="image/pet.png" alt="반려동물 이미지" class="img-fluid" style="max-width: 50%;">
				<span class="ms-2 text-center mt-2 fw-bold">반려동물</span>
			</button>
		</div>
	</div>

	
	<div class="container mt-5 p-5"> <!--커뮤니티 부분-->
		<div class="d-flex justify-content-between align-items-center">
			<h2>
				<strong>커뮤니티</strong>
			</h2>
			 <p><a href="${root}/board/community" class="link-underline-light">더보기</a></p>
		</div>
    	 
	    <ul class="list-group">
	    
	       <c:forEach var="post" items="${postList}" varStatus="loop">
      		<!-- 최대 5개의 게시글만 표시 -->
		    <c:if test="${loop.index < 5}">
		    
	         <li class="list-group-item d-flex align-items-center" onclick="location.href='${root}/board/detailCommunity?board_id=${post.board_id}'">
	            <div class="hover-pointer"></div>
	            <div class="hover-pointer" style="margin-top: 20px;">
	               <span class="title ">${post.title }</span>
	               <div style="display: flex; flex-direction: row; align-items: center; margin-top: 10px;">
	               		<div style="margin-right: 15px;">
	                  		<div class="f-color" style="color: gray;"><i class="bi bi-eye-fill"></i> &nbsp;${post.viewCnt }</div>
	               		</div>
	                	<div class="timeInfo">
							<div class="time" style="color: gray;">${post.board_date }</div>
						</div>
	               </div>
	            </div>
	   
	            <div class="ms-auto">
	               <!-- 맨 오른쪽에 표시될 내용 -->
	               <c:if test="${post.photos != null}">
						<c:forEach var="photo" items="${fn:split(post.photos, ',')}" varStatus="loop">
							<c:if test="${loop.index == 0}">
								<img src="${root}/upload/${photo}" class="feed-img" style="width: 100px; height: 100px; border-radius: 8px;" alt="이미지">
							</c:if>
						</c:forEach>
					</c:if> 
	            </div>

	         </li>
	         
		    </c:if>
		</c:forEach>

	     </ul>
	</div>
	
	   
<c:import url="/WEB-INF/views/include/footer.jsp" />

 <script>
      var stompClient = null;
      
      function connect() {
          var socket = new SockJS('/ws');
          stompClient = Stomp.over(socket);
      
          stompClient.connect({}, function(frame) {
              console.log('Connected: ' + frame);
      
              stompClient.subscribe('/topic/boardNotifications', function(notification) {
                
                  alert("게시글에 댓글이 달렸습니다.");
                 
              });
          });
      }
      
      
      
      // 페이지 로드 시 연결
      window.onload = function() {
          connect();
      }; 
      </script>
 	
</body>
</html>