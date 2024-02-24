<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Review Write</title>
    <script src="${root}/script/jquery-3.4.1.min.js"></script>
    <style>
        .account {
            font-size: 25px;
        }

		.reviewCard{
			 display: flex;
    		 align-items: center;
    		 justify-content: flex-start; 
			 flex-direction: column;
		}
		
        .provider_profile {
            display: flex;
            flex-direction: row;
        }

        ::placeholder {
            font-size: 14px;
            color: #B5B5B5;
        }

        .star {
            border: none;
            background: none;
            cursor: pointer;
        }
        
        #fileInput {
            display: none;
        }

        #btn-container {
            display: flex;
            align-items: center;
        }

        #btn {
            border: 1px solid #F3F3F3;
            width: 90px;
            height: 90px;
            border-radius: 10px;
            position: relative;
            overflow: hidden;
            margin-right: 10px; 
        }

        #uploaded-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 10px;
        }

        .upload-icon {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: #6387A6;
            font-size: 24px;
        }
        
        .form-check-input:checked {
    		background-color: #6387A6 !important; 
    		border-color: #6387A6 !important;
    		color: white !important;
    		outline: none;
		}
		
		.charCount {
			 display: flex;
             justify-content: flex-end;
		}
		
		.star {
			padding: 0px 0px;
		}
		
		.commnuity-select{
		display: flex;
		flex-direction: row;
		align-items: center;
	}
	
	label.form-control.col-2.btn{
		display: flex;
    	align-items: center;
    	justify-content: center;
	}
	
	.col-1{
		border: 1px solid #C2C2C2;
    	border-radius: 10px;
    	width: 60px !important; 
    	height: 60px !important;
    	display: flex;
    	align-items: center;
    	justify-content: center;
    	margin-right: 15px;
	}
	
	.selected-image {
		display: flex;
		flex-wrap: wrap;
		align-items: center;
	}

	.selected-image-item {
		position: relative;
		margin: 5px;
		max-width: 60px;
		max-height: 60px;
		border-radius: 10px;
	}

	.remove-button {
		position: absolute;
		right: 17.2%;
		height: 5%;
		background: #D9E8F5;
		color: #6387A6;;
		border: none;
		padding: 5px;
		cursor: pointer;
		width: 70px;
    	border-radius: 8px;
	}
	
	span.col-2 {
    width: fit-content;
    display: flex;
    align-items: center;
    margin-bottom: 15px;
    border: 1px solid #B5B5B5;
    border-radius: 8px;
    margin-right: 7.5px;
}

	
	.selectimg{
		border: 1px solid #C2C2C2;
    	border-radius: 10px;
    	width: 60px; 
    	height: 60px;
    	padding: 10px;
    	align-items: center;
    	justify-content: center;
    	margin-right: 15px;
	}      
        .form-check-input:checked {
    		background-color: #6387A6 !important; 
    		border-color: #6387A6 !important;
    		color: white !important;
    		outline: none;
		}
		
		.charCount {
			 display: flex;
             justify-content: flex-end;
		}
		
		.star {
			padding: 0px 0px;
		}
		
		.commnuity-select{
		display: flex;
		flex-direction: row;
		align-items: center;
	}
	
	
	
	.selected-image {
		display: flex;
		flex-wrap: wrap;
		align-items: center;
	}

	.selected-image-item {
		position: relative;
		margin: 5px;
		max-width: 60px;
		max-height: 60px;
		border-radius: 10px;
	}

	.remove-button {
		position: absolute;
		right: 17.2%;
		height: 5%;
		background: #D9E8F5;
		color: #6387A6;;
		border: none;
		padding: 5px;
		cursor: pointer;
		width: 70px;
    	border-radius: 8px;
	}
	
		.catebtn {
    width:auto; 
    align-items: center;
    margin-bottom: 15px;
    border: 1px solid #B5B5B5;
    border-radius: 8px;
    margin-right: 7.5px;
    padding:10px; 
} 	
    </style> 
  
  <script>
		var categoryData = {
		   자격증시험: ['스포츠지도사 준비', '한국어능력시험 준비', '한국사능력시험 준비', '정보처리기사 준비', '컴퓨터활용능력 준비'],
		   인테리어: ['가구리폼', '욕실/화장실 리모델링', '도배시공', '주방 리모델링', '조명 인테리어'],
		   가전제품: ['전자제품 수리', '컴퓨터 수리', '비데 렌탈/구입/청소', '에어컨 설치 및 수리', '냉장고 설치 및 수리'],
		   청소: ['에어컨 청소', '바퀴벌레 퇴치', '가구 청소', '계단/화장실 청소', '화재 복구/청소'],
		   번역: ['한문 번역', '영어 번역', '독일어 번역', '일본어/일어 번역', '베트남어 번역'],
		   문서: ['문서/글 작성', 'PPT 제작', '자막 제작', '사업계획서 제작', '데이터 복구'],
		   개발외주: ['웹 개발', '게임 개발', 'iOS 개발', 'QA 테스트', 'ERP 개발'],
		   반려동물: ['반려견 산책', '반려동물 미용', '반려동물 수제간식 만들기', '반려동물 훈련', '반려동물 장례'],
		};
</script>
  
</head>
<body style="background-color: #FAFAFA;">
<c:import url="/WEB-INF/views/include/header.jsp" />
   <div class="container mt-5 mb-5">
        <div class="row justify-content-center">
            <div class="col-md-10">
                <div class="account"><strong>리뷰 작성</strong></div>
                <div class="reviewCard" style="border: 1px solid #D9E8F5; border-radius: 10px; background-color: #fff; height: auto;; margin-top: 2%;">
                    <div class="provider_profile" style="width: 75%; padding-top: 40px;">
                        <img src="${root }/upload/${proUserBean.certification_documents_images}" style="width: 52px; height: 52px; border-radius: 25%; border: 1px solid #F3F3F3; margin-right: 1.5%"/>
                        <div class="profileInfo" style="margin-top: 0.6%;">
                            <div class="provider_name" style="font-size: 16px;"><strong>${proUserBean.pro_name }</strong></div>
                            <div class="service_name" style="font-size: 14px; color: #737373;">${ctg1 }, ${ctg2 }, ${ctg3 }</div>
                        </div>
                    </div>
                    <div style="width: 75%;">
                    
                    	<div class="provider_serviceKind"
								style="width: 75%; padding-top: 45px;">
								<div class="star_rate_title" style="font-size: 16px;">
									<strong>어떤 서비스를 받으셨나요?</strong>
								</div>
								<div class="serviceExplain"
									style="color: #B5B5B5; font-size: 14px;">카테고리를 선택해주세요</div>
								
								<!-- 카테고리 모달 -->
							<div class="postInfo mt-3">
								<span class="mt-2 catebtn">
									<button class="btn button categoryBtn ms-2" data-bs-toggle="modal"
										data-bs-target="#exampleModal" aria-controls="category">
										카테고리<i class="bi bi-caret-down"></i>
									</button>
								</span> 
							</div>
							
							<!-- 카테고리 클릭하면 보이는 모달창 -->
							<div class="modal fade" id="exampleModal" tabindex="-1"
								aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog modal-dialog-scrollable">
									<div class="modal-content">
										<div class="modal-header">
											<h1 class="modal-title fs-5" id="exampleModalLabel">카테고리
												선택</h1>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
											<div class="accordion">
												<!-- 아래 스크립트를 body 내부에 추가하세요 -->
												<script>
							// 선택된 데이터를 사용하여 출력하는 부분
							$.each(categoryData, function (city, districts) {
								document.write('<div class="accordion-item">');
								document.write('<h2 class="accordion-header">');
								document.write('<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#' + city + '" aria-expanded="false" aria-controls="' + city + '">');
								document.write(city);
								document.write('</button></h2>');
								document.write('<div id="' + city + '" class="accordion-collapse collapse" data-bs-parent="#category">');
								document.write('<ul class="list-group">');
									
								$.each(districts, function (index, district) {
									document.write('<button type="button" class="list-group-item list-group-item-action ctgBtn" data-district="' + district + '">' + district + '</button>');
								});
								document.write('</ul></div></div>');
							}); 
							
						    $(".ctgBtn").click(function () {
						        $(".ctgBtn").removeClass("selected");
						        $(this).addClass("selected");

						        var selectedCategory = $(this).data("district");

						        console.log('선택한 카테고리:', selectedCategory);

						        // 폼이나 필요한 곳에 값 설정
						        document.getElementById("modalSelectedCategory").value = selectedCategory;

						        // 모달 닫기
						        $("#exampleModal").modal('hide');
						        $(".categoryBtn").text(selectedCategory);
						        
						        
						 
						    });
						</script>
											</div>
										</div>
										<div class="modal-footer" style="border: none; height: 30px;">
										</div>
									</div>
								</div>
							</div>

						</div>
                    
                    	<div class="provider_star_rate"
								style="width: 75%; padding-top: 45px;">
								<div class="star_rate_title" style="font-size: 16px;">
									<strong>일류님은 어떠셨나요?</strong>
								</div>
								<div class="starrateExplain"
									style="color: #B5B5B5; font-size: 14px;">별점을 선택해주세요</div>
								<div class="stars">
									<button class="star">
										<img src="../image/star-solid-gray.svg" alt="Image 1">
									</button>
									<button class="star">
										<img src="../image/star-solid-gray.svg" alt="Image 1">
									</button>
									<button class="star">
										<img src="../image/star-solid-gray.svg" alt="Image 1">
									</button>
									<button class="star">
										<img src="../image/star-solid-gray.svg" alt="Image 1">
									</button>
									<button class="star">
										<img src="../image/star-solid-gray.svg" alt="Image 1">
									</button>
								</div>
								<div class="rateMessage" style="color: #B5B5B5;"></div>
								
							</div>
							
						<form:form action="${root }/review/ReviewWrite_pro" method="post" modelAttribute="writeReviewBean" enctype="multipart/form-data">
							
							<form:hidden path="category" id="modalSelectedCategory" name="selectedCategory" value=""/>
							<form:hidden path="rating" id="rating" />
							<form:hidden path="pro_id" id="pro_id" name="pro_id" value="" /> <!-- url에서의 pro_id 저장 -->
							
							<div class="review_text" style="width: 100%; padding-top: 45px;">
								<div class="review_text_title" style="font-size: 16px;">
									<strong>솔직한 리뷰를 작성해주세요</strong>
								</div>
								<div class="review_textExplain"
									style="color: #B5B5B5; font-size: 14px;">리뷰는 최소 10자 이상입니다</div>
								<form:textarea path="review_contents" id="myTextarea"
									style="border-radius: 10px; padding: 10px; border: 1px solid #e1e1e1; width: 100%; margin-top: 0.8%;"
									placeholder="서비스 시간, 일류 장점, 특징 등 구체적일수록 좋아요"
									oninput="countChars()" rows="5" />
								<form:errors path="review_contents" style="color:red"/>
								<div class="charCount" style="color: #B5B5B5; font-size: 14px;">
									<span id="charCount" style="color: #6387A6;">0&nbsp;</span>/300자
								</div>
							</div>
							<div class="photo_review" style="width: 75%; padding-top: 45px;">
								<div class="photo_reviewTitle" style="font-size: 16px;">
									<strong>서비스 사진을 올려주세요 (최대 5장)</strong>
								</div>
								<div class="photo_reviewExplain"
									style="color: #B5B5B5; font-size: 14px;">서비스 전 / 후 사진이면
									더욱 좋아요</div>
								<div id="btn-container"
									style="margin-top: 0.8%; margin-bottom: 40px;">
									<!-- 사진 -->
									<div class="commnuity-select">
										<div class=" selectimg"> 
											
											<input type="file" class="form-control col-2" id="inputGroupFile04" name="uploadFiles" style="display: none;" accept="image/*" multiple="true"/>
											
											<form:label path="photos" for="inputGroupFile04" class="form-control btn"> 
												<i class="bi bi-camera-fill me-1"></i> <!-- 카메라 아이콘(사진 첨부) -->
											</form:label>
										</div>
										
										<div class="selected-image"></div>
										
									</div>
									<!-- <label for="fileInput">
										<div class="btn" id="btn">
											<i class="bi bi-plus-circle upload-icon"
												style="color: #6387A6"></i>
											<img id="uploaded-image" src="#">
										</div>
									</label> 
									<input type="file" id="fileInput" name="uploadFiles"
										style="display: none;" accept="image/*" multiple="true" /> -->
								</div>
							</div>
							<div class="d-grid gap-2 col-4 mx-auto"
								style="padding-bottom: 40px;">
								<form:button class="btn btn-primary" type="submit"
									style="background-color: #6387A6; border: 1px solid #B5B5B5;">작성
								완료</form:button>
							</div>

						</form:form>
					</div>
                </div>
            </div>
        </div>
   </div>
   <c:import url="/WEB-INF/views/include/footer.jsp" />
  
  <script>
  
//URL에서 pro_id 값을 추출하여 폼에 설정하는 JavaScript 코드
  window.onload = function() {
      var urlParams = new URLSearchParams(window.location.search);
      var proId = urlParams.get('pro_id');
      
      // pro_id 값을 폼의 hidden 필드에 설정
      document.getElementById('pro_id').value = proId;
  };
  
  $(function() {
	    $('#inputGroupFile04').on('change', function (event) {
	        const selectedImageDiv = $('.selected-image');

	        // Count only images, not remove buttons
	        if (selectedImageDiv.find('.selected-image-item:not(.remove-button)').length >= 5) {
	            alert('최대 5개의 이미지까지만 선택할 수 있습니다.');
	            return;
	        }

	        const files = event.target.files;

	        for (const file of files) {
	            const reader = new FileReader();

	            reader.onload = function (e) {
	                const img = $('<img>').attr('src', e.target.result).addClass('selected-image-item');
	                selectedImageDiv.append(img);

	                const removeButton = $('<button>').text('삭제').addClass('remove-button');
	                removeButton.on('click', function () {
	                    img.remove();
	                    removeButton.remove();
	                });

	                img.after(removeButton); 
	            };

	            reader.readAsDataURL(file);
	        }
	    });
	});
		
  </script>
  
   <script type="text/javascript">
				document.addEventListener('DOMContentLoaded', function() {
					const buttons = document.querySelectorAll('.star');
					const messageDiv = document.querySelector('.rateMessage');
					const ratingField = document.getElementById('rating');
					
					buttons.forEach(function(button, index) {
						button.addEventListener('click', function() {
							for (let i = 0; i < buttons.length; i++) {
								const img = buttons[i].querySelector('img');
								if (i <= index) {
									img.src = '../image/star-solid.svg'; //선택한 별까지 노란색으로 표시
								} else {
									img.src = '../image/star-solid-gray.svg'; //아닌 곳은 회색 별로 표시
								}
							}
							
							ratingField.value = index + 1;
							console.log(ratingField.value);

							//별점에 따라 메시지 달라짐
							switch (index) {
							case 0:
								messageDiv.innerText = '아쉬워요'; //별 1개
								break;
							case 1:
								messageDiv.innerText = '그저 그래요';
								break;
							case 2:
								messageDiv.innerText = '괜찮았어요';
								break;
							case 3:
								messageDiv.innerText = '좋았어요';
								break;
							case 4:
								messageDiv.innerText = '최고예요'; //별 5개
								break;
							default:
								messageDiv.innerText = '';
								break;
							}
						});
					});
					
					
					
				});

				document
						.getElementById('fileInput').addEventListener(
								'change',
								function() {
									// 이미지 개수를 확인
									var currentImageCount = document
											.querySelectorAll('.uploaded-image').length;

									// 이미지가 5장 이상이면 추가로 이미지를 삽입하지 않음
									if (currentImageCount >= 5) {
										alert('최대 5장까지만 첨부할 수 있습니다.');
										return;
									}

									var reader = new FileReader();
									reader.onload = function(e) {
										// 새로운 이미지를 표시할 img 요소 생성
										var newImage = document
												.createElement('img');
										newImage.src = e.target.result;
										newImage.alt = 'Uploaded Image';
										newImage.className = 'uploaded-image'; // 클래스 추가
										newImage.style.width = '90px';
										newImage.style.height = '90px';
										newImage.style.borderRadius = '10px';
										newImage.style.border = '1px solid #e1e1e1';
										newImage.style.marginRight = '10px';

										// 이미지를 표시할 컨테이너를 찾음
										var imageContainer = document
												.getElementById('btn-container');

										// 새로운 이미지를 컨테이너에 추가
										imageContainer.appendChild(newImage);
									};

									reader.readAsDataURL(this.files[0]);
								});

				document.getElementById('btn').addEventListener('click',
						function() {
							document.getElementById('fileInput').click();
						});

				//textarea 글자수 세기
				function countChars() {
					var textarea = document.getElementById('myTextarea');
					var charCountSpan = document.getElementById('charCount');
					var charCount = textarea.value.length;
					charCountSpan.textContent = charCount;
				}
			</script>
</body>
</html>