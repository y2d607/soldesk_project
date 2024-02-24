<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>detailCategory</title>
<script src="${root}/script/jquery-3.4.1.min.js"></script>
</head>
<script> 

   $(document).ready(function() {
    // 각 후기 내용을 제한할 길이ㅋㅋ
    var maxCharacters = 100;

    // 각 후기 내용에 대해 실행
    $('.card-text').each(function() {
      var text = $(this).text();
      
      // 글자 수가 제한 길이를 초과하면 생략
      if (text.length > maxCharacters) {
        var truncatedText = text.substring(0, maxCharacters) + '...';
        $(this).text(truncatedText);
      }
    });
  }); 
  

</script>
<style>
	 body, div, span, h5, button, h2, ul, li, a {
	    font-family:'Gothic A1' !important;
	  }
	  
	  .custom-mt {
      margin-top: 10rem; /* 원하는 여백 값으로 조절 */
      margin-bottom: 8rem;
    }
    
    .profile{
    	font-size: 35px;
    }
    
    .star{
    	color: #FFE500;
    }
    
    .username{
    	color: #878787;
    	font-size: 13px;
    }
    
    .square-image {
	    width: 80px; /* 원하는 가로 크기 */
	    height: 80px; /* 가로 크기와 동일하게 설정 */
	    object-fit: cover; /* 이미지가 정사각형에 맞게 잘릴 수 있도록 설정 */
  	}
  	
  	#cheader, #cheader2{
  		background-color: white;
  	}
  	
  	.card:hover {
	  cursor: pointer;
	}
	
	.card-img-top{
		width: 170px; /* 원하는 가로 크기 */
	    height: 120px; /* 가로 크기와 동일하게 설정 */
	    object-fit: cover; /* 이미지가 정사각형에 맞게 잘릴 수 있도록 설정 */
	}
	
	.services{
		margin-top: 150px;
	}
	
	.reviews{
		margin-top: 150px;
	}
	
	  .card {
        height: 220px; /* 원하는 높이로 조절 */
        
        overflow: hidden;
    }
    

    .custom-card {
            max-width: 500px; /* 카드의 최대 너비 */
            margin: 20px auto; /* 가운데 정렬을 위한 여백 */
        }
       
       .reviewstory{
		   min-height: 100%;
	   } 
     
    
</style>
<body>
<c:import url="/WEB-INF/views/include/header.jsp" />

	<div class="container text-center custom-mt">
 
			<h2>${serviceCategoryname}</h2>
		
    	
    	<span>지금 시작해보세요</span>
 	</div>
 	
 	<div class="container d-flex justify-content-center mb-3"> <!-- 카테고리 부분 -->
		<div class="categories list-group list-group-horizontal mt-3" style="width: 50%;">
			<button type="button"  onclick="location.href='${root}/detailCategory?service_category_id=${categoryList[0].service_category_id }'"
				class="license list-group-item list-group-item-action d-flex flex-column align-items-center justify-content-center border-0 mr-3">
				<img src="image/study.png" alt="과외 이미지" class="img-fluid" style="width: 50%;">
				<span class="ms-2  text-center mt-2 fw-bold">시험/자격증</span>
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
 	 
	<div class="container mt-5 mb-5">
		<div class="d-flex justify-content-center align-items-center text-center mb-3 services">
			<h2>
				<strong>모든 서비스</strong>
			</h2>
		</div>
		  <div class="row row-cols-1 row-cols-md-5 g-4">
		    <!-- Card 1 --> 
		    <c:forEach var="obj" items="${detailCategoryList }">
			    <div class="col" onclick="location.href='${root}/Questions?service_category_id=${service_category_id}&detail_category_name=${obj.detail_category_name}' ">
			        <div class="card">
			    		<img src="${root}/category/${obj.file_name}" class="card-img-top" alt="sport" style="object-fit: fill;">
			    		
			      		<div class="card-body text-center ">
			        		<h5 class="card-title text-center">${obj.detail_category_name }</h5>
			      		</div>
			    	</div>
			  	</div> 
		  </c:forEach>	
	  </div>
	</div>
	
	<div class="container mt-5 mb-5">
	  <div class="d-flex justify-content-between align-items-center reviews">
		<h2>
			<strong>일류를 찾았어요!</strong>
		</h2>
	  </div>
		
	  <div class="row row-cols-1 row-cols-md-2 g-4 mb-3">
		    <!-- Original Card -->
		    
		   
		     <c:forEach var="review" items="${getReviewList}" varStatus="loop" begin="0" end="1">
			    <!-- 여기서 ${reviews}는 가져온 리뷰 데이터를 나타내는 변수일 것입니다. -->
			
			    <div class="col">
			        <div class="card reviewstory" style="">
			            <!-- 카드 헤더 프로필 부분 -->
			            <div class="card-header" id="cheader" onclick="location.href='${root}/review/Review?pro_id=${review.pro_id}'">
			                <div class="d-flex align-items-center">
			                    <i class="bi bi-person-circle profile"></i>
			                    <div class="ms-3">
			                        <div><strong>${review.pro_name}</strong></div>
			                        <div><span>${review.category}</span></div>
			                    </div>
			                    <span class="ms-auto p-2">
			                        <button type="button" class="btn">
			                            <i class="bi bi-chevron-compact-right"></i>
			                        </button>
			                    </span>
			                </div>
			            </div>
			            <!-- 카드 바디 부분 리뷰 내용 -->
			            <div class="card-body">
			                <!-- 리뷰 점수 -->
			                <div class="score row mr-5">
			                    <div class="col-md-10">
			                        <i class="bi bi-star-fill star"></i>
			                        <i class="bi bi-star-fill star"></i>
			                        <i class="bi bi-star-fill star"></i>
			                        <i class="bi bi-star-fill star"></i>
			                        <i class="bi bi-star-fill star"></i>
			                        <span class="ms-2">${review.rating}.0</span>
			                    </div>
			                </div>
			                
			                <div class="row">
			                    <div class="col-md-9">   
		                        	<div class="col-row-9 mt-3">
		                            	<p class="card-text" style="height: 40px;">${review.review_contents}</p>
		                            </div> 
		                            <div class="col-row-2 username mt-3"> 
		                               ${review.user_name} 고객님의 후기
		                            </div>
			                    </div>
			                         
			                    <div class="col-md-3" style="float:left;">
								    <c:if test="${review.photos != null}">
								        <c:forEach var="photo" items="${fn:split(review.photos, ',')}" varStatus="loop">
								            <c:if test="${loop.index == 0}"> 
								                <div class="me-3 float-start" style="position: absolute;"> 
								                    <img src="${root}/upload/${photo}" class="feed-img" style="width: 100px; height: 100px; border-radius: 8px;" alt="이미지">
								                </div>
								            </c:if> 
								        </c:forEach>
								    </c:if>			                       
								</div>
			                    
			                </div>
			            </div>
			        </div>
			    </div>
			</c:forEach>
	  

		</div>	
	</div>

<c:import url="/WEB-INF/views/include/footer.jsp" />
</body>
</html>