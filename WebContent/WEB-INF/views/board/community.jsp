<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>커뮤니티테스트페이지</title>
<script src="${root}/script/jquery-3.4.1.min.js"></script>
<script src="${root}/jquery/locdata.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script>

$(document).ready(function() {
	function searchFunction() {
		var searchText = $(".list-group-item.selected").text().toLowerCase();
		//console.log(searchText);
		$('.card').each(function() {
			var cardText = $(this).text().toLowerCase();
			if (cardText.includes(searchText)) {
				$(this).show();
			} else {
				$(this).hide();
			}
		});

	}

	$('.btn-primary').click(function() {
		console.log("선택되었음");
		searchFunction();
	});

});

	$(function() {
		// Add a click event handler for the selectCategoryBtn button
		$("#selectCategoryBtn").click(function() {
			// Get the text content of the selected list item
			var selectedCategory = $(".list-group-item.selected").text();

			// Check if a category is selected
			if (selectedCategory) {
				console.log('Selected category:', selectedCategory);
				// Close the modal
				$("#exampleModal").modal('hide');
				$(".categoryBtn").text(selectedCategory);
			} else {
				console.log('Please select a category.');
			}
		});

		$("#selectLocationBtn").click(function() {
			// Get the text content of the selected list item 
			var selectedLocation = $(".list-group-item.selected").text();

			// Check if a category is selected
			if (selectedLocation) {
				console.log('Selected category:', selectedLocation);
				// Close the modal
				$("#locationModal").modal('hide');
				$(".locationBtn").text(selectedLocation);
			} else {
				console.log('Please select a category.');
			}
		});

		// Add a click event handler for the list-group items to toggle the "selected" class
		$(".list-group-item").click(function() {
			// Remove the "selected" class from all items
			$(".list-group-item").removeClass("selected");

			// Add the "selected" class to the clicked item
			$(this).addClass("selected");
		});
	});
</script>

<style>
.btncommon {
	border-radius: 20px;
}

.commloc {
	margin-left: 5%;
	margin-top: 2%;
}

.feedlist {
	list-style: none;
}

.f-color {
	color: #E2E2E2;
}
</style>
<body>
<c:import url="/WEB-INF/views/include/header.jsp" />

	<div class="community-layout mx-auto" style="width: 70%; height: 100%;">
		<div class="ms-5 mt-5">
			<h2>
				<b>커뮤니티</b>
			</h2>
		</div>
		
		<div class="btn-catelocat">
<!-- 			<button type="button"
				class="btn btn-outline-dark ms-5 mt-4 btncommon categoryBtn"
				data-bs-toggle="modal" data-bs-target="#exampleModal">카테고리
				<i class="bi bi-caret-down"></i></button>
			<button type="button"
				class="btn btn-outline-dark ms-2 mt-4 btncommon locationBtn"
				data-bs-toggle="modal" data-bs-target="#locationModal">지역 <i class="bi bi-caret-down"></i></button> -->
			<button type="button" class="btn button-custom me-5"
				onclick="location.href='${root}/board/post'" style="float: right; color: white; margin:8px;">
				글쓰기 <img src="../image/pen2.png" style="width: 18px;">
			</button>
		</div>
		
		<!-- 검색 폼 -->
<form action="${root}/board/community" method="get" class="form-inline justify-content-center mt-3">
    <label for="searchType">검색 유형:</label>
    <select name="searchType" id="searchType" class="form-control mx-2">
        <option value="title" <c:if test="${param.searchType == 'title'}">selected</c:if>>제목</option>
        <option value="content" <c:if test="${param.searchType == 'content'}">selected</c:if>>내용</option>
        <option value="category" <c:if test="${param.searchType == 'category'}">selected</c:if>>카테고리</option>
        <option value="location" <c:if test="${param.searchType == 'location'}">selected</c:if>>지역</option>
    </select>
    <label for="searchText" class="mr-2">검색어:</label>
    <input type="text" name="searchText" id="searchText" class="form-control mx-2" value="${param.searchText}" />
    <button type="submit" class="btn btn-primary">검색</button>
</form>
</div>
		
		
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-scrollable">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">카테고리 선택</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="accordion" id="categoryAccordion">
							<script>
								$.each(categoryData, function(cate, districts) {
									document.write('<div class="accordion-item">');
									document.write('<h2 class="accordion-header">');
									document.write('<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#' + cate + '">'+ cate + '</button>');
									document.write('</h2>');
									document.write('<div id="' + cate + '" class="accordion-collapse collapse" data-bs-parent="#categoryAccordion">');
									document.write('<ul class="list-group">');
								$.each(districts, function(index, district) {
									document.write('<button type="button" class="list-group-item list-group-item-action selected">'+ district + '</button>');
									});
									document.write('</ul></div></div>');
								});
							</script>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
						<button type="button" class="btn btn-primary" id="selectCategoryBtn">선택</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 추가된 locationModal -->
		<div class="modal fade" id="locationModal" tabindex="-1"
			aria-labelledby="locationModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-scrollable">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="locationModalLabel">지역 선택</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="accordion" id="categoryAccordion">
							<!-- 아래 스크립트를 body 내부에 추가하세요 -->
							<script>
								$.each(cityDatas, function(city, districts) {
									document.write('<div class="accordion-item">');
									document.write('<h2 class="accordion-header">');
									document.write('<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#' + city + '">' + city + '</button>');
									document.write('</h2>');
									document.write('<div id="' + city + '" class="accordion-collapse collapse" data-bs-parent="#categoryAccordion">');
									document.write('<ul class="list-group">');
								$.each(districts, function(index, district) {
									document.write('<button type="button" class="list-group-item list-group-item-action selected">' + district + '</button>');
									});
									document.write('</ul></div></div>');
								});
							</script>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
						<button type="button" class="btn btn-primary" id="selectLocationBtn">선택</button>
					</div>
				</div>
			</div>
		</div>

	

	<article class="community-feed-list mx-auto" style="width: 70%; height: 100%;">
		<ul class="list-group list-group-flush commloc">
			<li class="list-group-item feedlist"><a href="#" style="text-decoration: none; color: black;"> </a>
				<div id="feed">
					<a href="detail-commnuity.jsp" style="text-decoration: none; color: black;"> </a>
						<div class="feed-container">
							
							<c:forEach var="obj" items="${postList }">
							
								<button style="background-color: #fff; border: none; width: 100%;" onclick="location.href='${root}/board/detailCommunity?board_id=${obj.board_id }'">
									<div class="card" style="border:none;">
										<div class="cardInfo" style="display: flex; justify-content: left;">
											<div class="f-color">${obj.category } &nbsp;•&nbsp; ${obj.location }</div><br/>
										</div>
										<div class="cardContent" style="display: flex; flex-direction: row; justify-content: space-between;">
											<div>
												<div class="title mb-3" style="text-align: left;">${obj.title }</div>
												<div class="content" style="color: gray;">${obj.content }</div>
											</div>
											<div>
												<c:if test="${obj.photos != null}">
													<c:forEach var="photo" items="${fn:split(obj.photos, ',')}" varStatus="loop">
														<c:if test="${loop.index == 0}">
        													<img src="${root}/upload/${photo}" class="feed-img" style="width: 100px; height: 100px; border-radius: 8px;" alt="이미지">
    													</c:if>
													</c:forEach>
												</c:if>
												
												
												<!-- 후에 DB에 이미지 저장 후 변경 -->
											</div>
										</div>
										<div class="cardBasicInfo" style="display: flex; flex-direction: row; justify-content: space-between;">
											<div class="viewInfo" style="display: flex; flex-direction: row">
												<div class="f-color" style="display:flex; flex-direction: row; align-items: center;"><i class="bi bi-chat-left-text-fill" style="margin-right: 5px; margin-top: 1px;"></i><div>댓글 수 ${obj.commentCnt }</div></div>
												<div class="f-color" style="margin-left: 20px;"><i class="bi bi-eye-fill" style="margin-right: 5px;"></i>조회수 ${obj.viewCnt }</div>
											</div>
											<div class="timeInfo">
												<div class="f-color time" >${obj.board_date }</div>
											</div>
										</div>
										<hr>
									</div>
									
								</button>
							
							</c:forEach>
						
						</div>
				</div>
			</li>
		</ul>
	</article>
	
	 <div class="d-none d-md-block">
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
                <a href="${root }/board/community?page=${pageBean.prevPage}&searchType=${param.searchType}&searchText=${param.searchText}" 
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
                   <a href="${root }/board/community?page=${idx}&searchType=${param.searchType}&searchText=${param.searchText}" class="page-link">
                      ${idx }
                   </a>
                </li>
             </c:when>
             <c:otherwise>
                <li class="page-item">
                   <a href="${root }/board/community?page=${idx}&searchType=${param.searchType}&searchText=${param.searchText}" class="page-link">
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
                <a href="${root }/board/community?page=${pageBean.nextPage}&searchType=${param.searchType}&searchText=${param.searchText}" 
                class="page-link">다음</a>
             </li>
          </c:otherwise>
       </c:choose>
       
    </ul>
 </div>
 
 <div class="d-block d-md-none">
    <ul class="pagination justify-content-center">
       <li class="page-item">
          <a href="#" class="page-link">이전</a>
       </li>
       <li class="page-item">
          <a href="#" class="page-link">다음</a>
       </li>
    </ul>
 </div>



	<c:import url="/WEB-INF/views/include/footer.jsp" />

<script>
    document.addEventListener('DOMContentLoaded', function () {
        var timeElements = document.querySelectorAll('.time');

        timeElements.forEach(function (timeElement) {
            var boardDate = moment(timeElement.textContent);
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

</body>

</html>