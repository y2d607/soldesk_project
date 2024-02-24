<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>saved</title>

<script src="${root}/script/jquery-3.4.1.min.js"></script>
<script>
	$(document).ready(function () {
		// 각 후기 내용을 제한할 길이
		var maxCharacters = 100;
			
		// 각 후기 내용에 대해 실행
		$('.card-content').each(function () {
			var text = $(this).text();

			// 글자 수가 제한 길이를 초과하면 생략
			if (text.length > maxCharacters) {
				var truncatedText = text.substring(0, maxCharacters) + '...';
				$(this).text(truncatedText);
			}
		});
	}); 
	
$(document).ready(function () {
       // 삭제 버튼 클릭 시
       $('.removebtn').click(function () {
           // 해당 일류의 ID 가져오기
           var interest_id = $(this).data("interest-id");
           console.log("interest_id :"+ interest_id);

           // AJAX를 통해 삭제 요청 보내기
           if (confirm("삭제하시겠습니까?")) {
           $.ajax({
               type: "POST",
               url: "${root}/common/interest_delete/",
               contentType: "application/json",
               data: JSON.stringify({ interest_id: interest_id }), 
               success: function(response) {
               	console.log(response);
               	location.reload();
               },
               error: function() {
               	
               }
           });
       }
    });
  });
</script>
	<style>
		#a_comment-board-title:hover {
			color: #fff;
		}

		.star {
			color: #FFE500;
		}

		.lig {
			color: grey;
		}
		
		.profileimage{
			width: 70px;
			height: 90px;
		}
	</style>
</head>

<body>
	<!-- 네비부분 -->
<c:import url="/WEB-INF/views/include/header.jsp" />
	<!--여기까지 네비부분-->
	<!--본문-->

	<div class="container mx-auto mt-5 mb-5" style="width:50%;">
		
			<h2>
				<strong>찜한 일류</strong>
			</h2>
	
		<!--여기 -->
		<c:forEach var="profile" items="${getProfileList}" varStatus="num">
		    <div class="card mt-5">
		        <div class="card-body row" onclick="location.href='${root}/review/Review?pro_id=${profile.pro_id }'" style="cursor:pointer">
		            <div class="col-10">
		                <div class="">
		                    
		                        <b style="font-size: 18px;">${profile.pro_name}</b>
		                    
		                </div>
		                <div class="card-content mt-3">
		                    ${profile.pro_detailed_introduction}
		                </div>
		                <div class="star-review mt-1">
	                        <i class="bi bi-star-fill star"></i> 
	                          <span class="review-count" style="font-size: 13px;">5.0 (${getReviewList[num.index].review_count})</span>
	                    </div>
	                    <div class="career mt-2 lig"> 
	                       <span>경력 ${getcareerList[num.index].total_experience_sum}년</span>
	                    </div>
		            </div>
		            <div class="col-2 text-center mt-4">
		                <img class="profileimage" src="${root}/upload/${profile.certification_documents_images}">
		            </div>
		        </div>
		    </div>
		    
		    <div class="mt-2 text-end ">
		    	<button class="btn button-custom removebtn" type="button" data-interest-id="${profile.interest_id }">삭제</button>
		    </div>
		    
		</c:forEach>
	</div>
	
	
	
<c:import url="/WEB-INF/views/include/footer.jsp" />

</body>

</html>