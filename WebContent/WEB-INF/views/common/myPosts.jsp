<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myposts</title>
<script src="${root}/script/jquery-3.4.1.min.js"></script>
<script>
	$(function () {
		
	})
	
	$(document).ready(function () {
		// 각 후기 내용을 제한할 길이
		var maxCharacters = 70;

		// 각 후기 내용에 대해 실행
		$('.communitycomment').each(function () {
			var text = $(this).text();

			// 글자 수가 제한 길이를 초과하면 생략
			if (text.length > maxCharacters) {
				var truncatedText = text.substring(0, maxCharacters) + '...';
				$(this).text(truncatedText);
			}
		});
	}); 
	
	function formatDate() {
	    var commentDateElements = document.querySelectorAll('.date');
	    commentDateElements.forEach(function (element) {
	        var originalDate = element.innerText;
	        var formattedDate = originalDate.split(' ')[0]; // 시간 부분 제거
	        element.innerText = formattedDate;
	    });
	}

	// 호출
	document.addEventListener('DOMContentLoaded', function () {
	    formatDate();
	});
</script>
<style>
	#a_comment-board-title:hover {
		color: #fff;
	}
</style>
</head>

<body>
	<!-- 네비부분 -->
<c:import url="/WEB-INF/views/include/header.jsp" />
	<!--여기까지 네비부분-->


	<div class="my_comment  mx-auto"  style="width: 50%;">
		<div class="container mt-5">
			<h2>
				<strong>작성글/댓글</strong>
			</h2>
			
			<ul class="nav nav-tabs mt-5" style="text-decoration: none;">
			  <li class="nav-item">
			    <a class="nav-link active" aria-current="page" href="myPosts.html">작성글</a>
			  </li>
			  <li class="nav-item" style="text-decoration: none;">
			    <a class="nav-link" href="${root}/common/comment" style="color: black;">내가 작성한 댓글</a>
			  </li>
			</ul>

			<!--본문-->
			<div class="my_comment_list"  >
				<ul class="list-group mt-3">
					<!-- 여기서부터 -->
					<c:forEach var="obj" items="${getMyPosts }">
						<li class="list-group-item">
						<div class="communitytitle">
							<a id="comment-board-title" href="${root}/board/detailCommunity?board_id=${obj.board_id}"   
								style="color: black; text-decoration: none;">
								<span class="fw-bold">${obj.title }</span>
							</a>
						</div>

						<div class="communitycomment mt-1">
							<a href="${root}/board/detailCommunity?board_id=${obj.board_id}" style="color: gray; text-decoration: none;">
								<span>${obj.content }</span>
							</a>
						</div>

						<div class="communitycomment mt-1">
							<a href="${root}/board/detailCommunity?board_id=${obj.board_id}" style="color: gray; text-decoration: none;">
								<span class="date">${obj.board_date }</span>
							</a>
						</div>
					</li>
					</c:forEach>
					
					<!-- 여기까지? -->
					
					
				</ul>
			</div>
		</div>
	</div>
	
	<div class="d-none d-md-block mt-5">
            <ul class="pagination justify-content-center">
               
               <!-- 이전 페이지가 1 이하이면 이전 페이지는 비활성화 -->
               <c:choose>
                  <c:when test="${pageBean.prevPage <= 0 }">
                     <li class="page-item disabled">
                        <a href="#" class="page-link">이전</a>
                     </li>
                  </c:when>
                  <c:otherwise>
                     <li class="page-item">
                        <a href="${root }/common/myPosts?page=${pageBean.prevPage}" 
                        class="page-link">이전</a>
                     </li>
                  </c:otherwise>
               </c:choose>
               
               <c:forEach var="idx" begin="${pageBean.min }" end="${pageBean.max }">
               <!-- model로 가져온 pageBean의 최소페이지부터 최대페이지까지 반복 -->
                  <c:choose>
                     <c:when test="${idx==pageBean.currentPage }">
                        <li class="page-item active" >
                        <!-- 현재페이지 활성화 -->
                           <a href="${root }/common/myPosts?page=${idx}" class="page-link">
                              ${idx }
                           </a>
                        </li>
                     </c:when>
                     <c:otherwise>
                        <li class="page-item">
                           <a href="${root }/common/myPosts?page=${idx}" class="page-link">
                              ${idx }
                           </a>
                        </li>
                     </c:otherwise>
                  </c:choose>
               </c:forEach>
               
               <c:choose>
                  <c:when test="${pageBean.max >= pageBean.pageCnt }">
                  <!-- 현재 페이지가 최대페이지이면 다음버튼 비활성화 -->
                     <li class="page-item disabled">
                        <a href="#" class="page-link">다음</a>
                     </li>
                  </c:when>
                  <c:otherwise>
                     <li class="page-item">
                        <a href="${root }/common/myPosts?page=${pageBean.nextPage}" 
                        class="page-link">다음</a>
                     </li>
                  </c:otherwise>
               </c:choose>
               
            </ul>
         </div>
          
	
<c:import url="/WEB-INF/views/include/footer.jsp" />

</body>

</html>