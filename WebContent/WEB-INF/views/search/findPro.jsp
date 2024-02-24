<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>findPro</title>
<script src="${root}/script/jquery-3.4.1.min.js"></script>
<script src="${root}/jquery/locdata.js"></script>
<script>
	$(document).ready(function() {
		// 각 후기 내용을 제한할 길이
		var maxCharacters = 100;

		// 각 후기 내용에 대해 실행
		$('.card-content').each(function() {
			var text = $(this).text();

			// 글자 수가 제한 길이를 초과하면 생략
			if (text.length > maxCharacters) {
				var truncatedText = text.substring(0, maxCharacters) + '...';
				$(this).text(truncatedText);
			}
		}); 
	});
</script> 

<script>
$(document).ready(function () {
    $('.selectedDetailCate').on('click', function () {
        var selectedCategory = $(this).text().trim();
        //var selectedLocation = $(".locationBtn").text().trim(); // Get selectedLocation
        $('#exampleModal').modal('hide');
        //console.log('선택된 디테일 카테고리:', selectedCategory,selectedLocation);
        console.log('선택된 디테일 카테고리:', selectedCategory);
        $(".categoryBtn").text(selectedCategory); 
        sendToServerCategory(selectedCategory);
        sendToServer(selectedCategory,selectedLocation);  
    });

    $('.selectedLocation').on('click', function() {
        var selectedLocation = $(this).text().trim();
        //var selectedCategory = $(".categoryBtn").text().trim(); // Get selectedCategory
        $('#locationModal').modal('hide');
        //console.log('선택된 위치:', selectedLocation,selectedCategory);
        console.log('선택된 위치:',selectedLocation);
        $(".locationBtn").text(selectedLocation);
        sendToServerLocation(selectedLocation);
        sendToServer(selectedCategory,selectedLocation);  
    }); 
});

//값이 두개가 있을 때 
function sendToServer(selectedCategory, selectedLocation) {
	// 값이 없을 때 디폴트로 null 설정 
    $.ajax({
        type: 'GET',
        url: '${root}/search/getCategoryInfo',
        data: {
            selectedCategory: selectedCategory,
            active_location: selectedLocation
        },
        success: function (data) {
            console.log("받아온 data:", data); 
           
            var outputContainer = $('.here > div'); 
            outputContainer.empty(); // 기존 내용을 비워줍니다.

            for (var i = 0; i < data.proActive.length; i++) {
                var detailCategory = data.proActive[i];  
                var reviewList = data.reviewList[i];  
                var careerInfo = data.careerInfo[i];  
                console.log(" 받아온값은?",detailCategory);
                var card = $('<div class="card mb-3" ></div>').click(function(){
                    // Redirect to review page with pro_id
                    location.href = '${root}/review/Review?pro_id=' + detailCategory.pro_id;
                });
                var cardBodyRow = $('<div class="card-body row"></div>');
                var col10 = $('<div class="col-10"></div>');
                var boldText = $('<b style="font-size: 18px;"></b>').text(detailCategory.pro_name);
                var cardContent = $('<div class="card-content">'+detailCategory.pro_detailed_introduction+'</div>');
                var starReview = $('<div class="star-review mt-1"></div>').html('<i class="bi bi-star-fill star"></i> <span class="review-count" style="font-size: 13px;">'+reviewList.review_cnt+'</span>');
                var career = $('<div class="career mt-2 lig"></div>').html('<span>경력'+careerInfo.career_sum+'</span>');

                col10.append(boldText, cardContent, starReview, career);

                var col2 = $('<div class="col-2 text-center mt-4"></div>');
                var image = $('<img class="profileimage">');
                image.attr("src", "${root}/upload/" + detailCategory.certification_documents_images);
                col2.append(image);
                
                cardBodyRow.append(col10, col2);
                card.append(cardBodyRow);

                outputContainer.append(card);
            }
        },
        error: function (error) {
            console.error('Error fetching category info:', error);
        }
    });
}

//서비스 카테고리만 있을 떄 
function sendToServerCategory(selectedCategory) {
	// 값이 없을 때 디폴트로 null 설정 
    $.ajax({
        type: 'GET',
        url: '${root}/search/getCategoryInfo',
        data: {
            selectedCategory: selectedCategory 
        },
        success: function (data) {
            console.log("받아온 data:", data); 
           
            var outputContainer = $('.here > div'); 
            outputContainer.empty(); // 기존 내용을 비워줍니다.
            
            
            for (var i = 0; i < data.proActive.length; i++) {
                var detailCategory = data.proActive[i];  
                var reviewList = data.reviewList[i];  
                var careerInfo = data.careerInfo[i];  
                console.log(" 받아온값은?",detailCategory);
                var card = $('<div class="card mb-3" ></div>').click(function(){
                    // Redirect to review page with pro_id
                    location.href = '${root}/review/Review?pro_id=' + detailCategory.pro_id;
                });
                var cardBodyRow = $('<div class="card-body row"></div>');
                var col10 = $('<div class="col-10"></div>');
                var boldText = $('<b style="font-size: 18px;"></b>').text(detailCategory.pro_name);
                var cardContent = $('<div class="card-content">'+detailCategory.pro_detailed_introduction+'</div>');
                var starReview = $('<div class="star-review mt-1"></div>').html('<i class="bi bi-star-fill star"></i> <span class="review-count" style="font-size: 13px;">'+reviewList.review_cnt+'</span>');
                var career = $('<div class="career mt-2 lig"></div>').html('<span>경력'+careerInfo.career_sum+'</span>');

                col10.append(boldText, cardContent, starReview, career);

                var col2 = $('<div class="col-2 text-center mt-4"></div>');
                var image = $('<img class="profileimage">');
                image.attr("src", "${root}/upload/" + detailCategory.certification_documents_images);
                col2.append(image);
                
                cardBodyRow.append(col10, col2);
                card.append(cardBodyRow);

                outputContainer.append(card);
            }
        },
        error: function (error) {
            console.error('Error fetching category info:', error);
        }
    });
}

//지역카테고리만 있을 때
function sendToServerLocation(selectedLocation) {
	// 값이 없을 때 디폴트로 null 설정 
    $.ajax({
        type: 'GET',
        url: '${root}/search/getCategoryInfo',
        data: { 
            active_location: selectedLocation
        },
        success: function (data) {
            console.log("받아온 data:", data); 
           
            var outputContainer = $('.here > div'); 
            outputContainer.empty(); // 기존 내용을 비워줍니다.
//onclick="location.href='${root}/review/Review?pro_id="+detailCategory.pro_id
            
            for (var i = 0; i < data.proActive.length; i++) {
                var detailCategory = data.proActive[i];  
                var reviewList = data.reviewList[i];  
                var careerInfo = data.careerInfo[i];  
                console.log(" 받아온값은?",detailCategory);
                var card = $('<div class="card mb-3" ></div>').click(function(){
                    // Redirect to review page with pro_id
                    location.href = '${root}/review/Review?pro_id=' + detailCategory.pro_id;
                });
                var cardBodyRow = $('<div class="card-body row"></div>');
                var col10 = $('<div class="col-10"></div>');
                var boldText = $('<b style="font-size: 18px;"></b>').text(detailCategory.pro_name);
                var cardContent = $('<div class="card-content">'+detailCategory.pro_detailed_introduction+'</div>');
                var starReview = $('<div class="star-review mt-1"></div>').html('<i class="bi bi-star-fill star"></i> <span class="review-count" style="font-size: 13px;">'+reviewList.review_cnt+'</span>');
                var career = $('<div class="career mt-2 lig"></div>').html('<span>경력'+careerInfo.career_sum+'</span>');

                col10.append(boldText, cardContent, starReview, career);

                var col2 = $('<div class="col-2 text-center mt-4"></div>');
                var image = $('<img class="profileimage">');
                image.attr("src", "${root}/upload/" + detailCategory.certification_documents_images);
                col2.append(image);
                
                cardBodyRow.append(col10, col2);
                card.append(cardBodyRow);

                outputContainer.append(card);
            }
        },
        error: function (error) {
            console.error('Error fetching category info:', error);
        }
    });
}



function showfindpro(){ 
	$(".showhid").toggle(); 
}

function reset(){
	location.reload();
}
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

.profileimage {
	width: 70px;
	height: 90px;
}
.bi.bi-arrow-counterclockwise {
    font-weight: bold;
}

</style>
</head>

<body> 
	<c:import url="/WEB-INF/views/include/header.jsp" />
 
	<div class="container mx-auto mt-5 mb-5" style="width: 60%;">

		<div class=" mt-5">
			<h2>
				<strong>일류 찾기</strong>
			</h2>
		</div>

		<div class="btn-catelocat mb-5">
			
			<button type="button"
				class="btn btn-outline-dark mt-4 ms-1 btncommon categoryBtn"
				data-bs-toggle="modal" data-bs-target="#exampleModal"> 
			        카테고리 V 
			</button>
			<button type="button"
				class="btn btn-outline-dark ms-2 mt-4 btncommon locationBtn"
				data-bs-toggle="modal" data-bs-target="#locationModal"> 
			        지역 V 
			</button>
			
			<!-- <button onclick="reset()" class="btn btn-outline-dark mt-4 btncommon mt-4 ms-2 "><i class="bi bi-arrow-counterclockwise"></i>초기화</b> -->
			<button onclick="showfindpro()" class="btn btn-outline-dark mt-4 btncommon mt-4 ms-2 ">전체 보기</button>
			
		</div>
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-scrollable modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">카테고리 선택</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="accordion" id="categoryAccordion">
							<%-- 서비스 카테고리 리스트 --%>
							<c:forEach var="category" items="${service_category_name}"
								varStatus="loop">
								<div class="accordion-item">
									<h2 class="accordion-header">
										<button class="accordion-button" type="button"
											data-bs-toggle="collapse" data-bs-target="#${category}">
											${category}</button>
									</h2>
									<div id="${category}" class="accordion-collapse collapse"
										data-bs-parent="#categoryAccordion">
										<ul class="list-group">
											<%-- 상세 카테고리 리스트 --%>
											<c:forEach var="detailCategory"
												items="${detailCategoryList[loop.index]}">
												<button type="button" 
													class="list-group-item list-group-item-action selectedDetailCate"
													id="selectCategoryBtn" name="category" >
													 ${detailCategory.detail_category_name}
												</button>
											</c:forEach>
										</ul>
									</div>
								</div>
							</c:forEach>
						</div>
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
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="accordion" id="categoryAccordion">
							<!-- 아래 스크립트를 body 내부에 추가하세요 -->
							<script>
								$.each(cityDatas,function(city, districts) {
													document.write('<div class="accordion-item">');
													document.write('<h2 class="accordion-header">');
													document.write('<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#' + city + '">'
																	+ city
																	+ '</button>');
													document.write('</h2>');
													document
															.write('<div id="' + city + '" class="accordion-collapse collapse" data-bs-parent="#categoryAccordion">');
													document
															.write('<ul class="list-group">');
													$
															.each(
																	districts,
																	function(
																			index,
																			district) {
																		document.write('<button type="button" class="list-group-item list-group-item-action selectedLocation">'
																				+ district
																				+ '</button>');

																	});
													document
															.write('</ul></div></div>');
												});
								 
							</script>
						</div>
					</div>
				</div>
			</div>
		</div>


		<div class="row">
			<div class="col-3">
				<div class="card border-0" style="background-color: #f4f4f4;">
					<div class="card-body p-4">
						<p>서비스 분야를 선택해 주세요.</p>
						<span style="color: #888888;"> 서비스 분야를 선택하면 나에게 딱 맞는 고수를
							필터링해 찾아볼 수 있어요! </span>
					</div>
				</div>
			</div>

			<div class="col-9 here">
				<form action="${root }/search/searchProName" method="get">
					<div class="mb-5"
						style="display: flex; justify-content: space-between;">
						<input id="searchInput" name="searchInput" class="form-control"
							autocomplete="off" placeholder="어떤 서비스가 필요하세요?"
							style="width: 90%;"></input>
						<button id="searchButton" class="btn button-custom"
							style="color: white;"
							onclick="location.href='${root}/search/findPro?s=${searchInput }'">검색</button>
					</div>
				</form>
				 
					<c:if test="${not empty search_proname}">
						<c:forEach var="pro" items="${search_proname}" varStatus="num">
							<div class="card mb-3" style="cursor: pointer;" onclick="location.href='${root}/review/Review?pro_id=${pro.pro_id }'">
						        <div class="card-body row">
						            <div class="col-10">
						                <b style="font-size: 18px;">${pro.pro_name }</b> 
						                <div class="card-content">${pro.pro_detailed_introduction }</div> 
					                        <div class="star-review mt-1">
					                            <i class="bi bi-star-fill star"></i> 
					                            <span class="review-count" style="font-size: 13px;">(${reviewList[num.index].review_cnt})</span>
					                        </div>  
					                		<div>
					                		 	<span>총 ${CareerInfo[num.index].career_sum }년</span>
					                		</div>
						            </div>
						            <div class="col-2 text-center mt-4">
						                <img class="profileimage" src="${root }/upload/${pro.certification_documents_images}">
						            </div>
						        </div>
						    </div>
						</c:forEach>
					</c:if>    
						<c:forEach var="pro" items="${ProprofileInfo}" varStatus="num">
						    <div class="card mb-3 showhid" style="display: none;cursor: pointer;" onclick="location.href='${root}/review/Review?pro_id=${pro.pro_id }'">
						        <div class="card-body row">
						            <div class="col-10">
						                <b style="font-size: 18px;">${pro.pro_name }</b> 
						                <div class="card-content">${pro.pro_detailed_introduction }</div> 
					                        <div class="star-review mt-1">
					                            <i class="bi bi-star-fill star"></i> 
					                            <span class="review-count" style="font-size: 13px;">(${reviewList[num.index].review_cnt})</span>
					                        </div> 
					                		<div>
					                		 	<span>총 ${CareerInfo[num.index].career_sum }년</span>
					                		</div>
						            </div>
						            <div class="col-2 text-center mt-4">
						                <img class="profileimage" src="${root }/upload/${pro.certification_documents_images}">
						            </div>
						        </div>
						    </div>
						</c:forEach> 
				 <div> 
				 </div>
			</div>
			<!-- 페이징 처리 -->
		</div> 
		

	</div>
	<!--여기까지 본문 -->
	<!--푸터-->
	<c:import url="/WEB-INF/views/include/footer.jsp" />

</body>
<script>

</script>
</html>