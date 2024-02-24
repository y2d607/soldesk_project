<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${root}/script/jquery-3.4.1.min.js"></script>
<script src="${root }/jquery/locdata.js"></script>
<style>
.Explanation {
	color: #B5B5B5;
	font-size: 16px;
	margin-top: 5px;
	margin-bottom: 5px;
}

.Subtitle {
	font-size: 20px;
	font-weight: bold;
	color: #3E3E3E;
}

#InvisibleButton {
	background-color: transparent;
	border: none;
}

.AfterMD {
	font-size: 15px;
	font-weight: bold;
	color: #85BCEB;
	text-align: right;
}

.InvisibleButton {
	background-color: transparent;
	border: none;
}

/*섹션 스타일*/
.section-divider {
	border-bottom: 1px solid #F2F2F2; /* 실선 스타일 및 색상 설정 */
}
</style>

<script>
var cityData = {
		   서울: ['강남구', '강동구', '강북구', '강서구', '관악구', '광진구', '구로구', '금천구', '노원구', '도봉구', '동대문구', '동작구', '마포구', '서대문구', '서초구', '성동구', '성북구', '송파구', '양천구', '영등포구', '용산구', '은평구', '종로구', '중구', '중랑구'],
		   부산: ['강서구', '금정구', '남구', '동구', '동래구', '부산진구', '북구', '사상구', '사하구', '서구', '수영구', '연제구', '영도구', '중구', '해운대구'],
		   인천: ['계양구', '남동구', '동구', '미추홀구', '부평구', '서구', '연수구', '중구'],
		   대전: ['대덕구', '동구', '서구', '유성구', '중구'],
		   대구: ['남구', '달서구', '달서군', '동구', '북구', '서구', '수성구', '중구'],
		   울산: ['남구', '동구', '북구', '중구', '울주군'],
		   광주: ['광산구', '남구', '동구', '북구', '서구'],
		   제주도: ['서귀포시', '제주시'],
		   세종: ['세종특별자치시'],
		   경기도: ['고양시', '과천시', '광명시', '광주시', '구리시', '군포시', '김포시', '남양주시', '동두천시', '부천시', '성남시', '수원시', '시흥시', '안산시', '안성시', '안양시', '양주시', '여주시', '오산시', '용인시', '의왕시', '의정부시', '이천시', '파주시', '평택시', '포천시', '하남시', '화성시', '가평군', '양평군', '연천군'],
		   강원도: ['강릉시', '동해시', '삼척시', '속초시', '원주시', '춘천시', '태백시', '고성군', '양구군', '양양군', '영월군', '인제군', '정선군', '철원군', '평창군', '홍천군', '화천군', '횡성군'],
		   충청북도: ['제천시', '청주시', '충주시', '괴산군', '단양군', '보은군', '영동군', '옥천군', '음성군', '증평군', '진천군'],
		   충청남도: ['계룡시', '공주시', '논산시', '당진시', '보령시', '서산시', '아산시', '천안시', '금산군', '부여군', '서천군', '예산군', '청양군', '태안군', '홍성군'],
		   경상북도: ['경산시', '경주시', '구미시', '김천시', '문경시', '상주시', '안동시', '영주시', '영천시', '포항시', '고령군', '군위군', '봉화군', '성주군', '영덕군', '영양군', '예천군', '울릉군', '울진군', '의성군', '청도군', '청송군', '칠곡군'],
		   경상남도: ['거제시', '김해시', '밀양시', '사천시', '양산시', '진주시', '창원시', '통영시', '거창군', '고성군', '남해군', '산청군', '의령군', '창녕군', '하동군', '함안군', '함양군', '합천군'],
		   전라북도: ['군산시', '김제시', '남원시', '익산시', '전주시', '정읍시', '고창군', '무주군', '부안군', '순창군', '완주군', '임실군', '장수군', '진안군'],
		   전라남도: ['광양시', '나주시', '목포시', '순천시', '여수시', '강진군', '고흥군', '곡성군', '구례군', '담양군', '무안군', '보성군', '신안군', '영광군', '영암군', '완도군', '장성군', '장흥군', '진도군', '함평군', '해남군', '화순군']
		};
</script>
<script>

$(document).ready(function() {
 

    // 연도 선택 스크립트
    var yearSelectElement = $('#yearSelect');
    var currentYear = new Date().getFullYear();

    for (var year = currentYear; year >= 1980; year--) {
        var option = $('<option>').attr('value', year).text(year);
        yearSelectElement.append(option);
    } 


    // 삭제 버튼 생성 함수
    function createDeleteButton(containerId, previewId) {
        var deleteButton = $('<button>').addClass('btn delete-icon p-0 position-relative').html('<i class="bi bi-x-circle-fill" style="color: #CC0000; position: absolute; top:-55px; right: 0;"></i>');
        deleteButton.click(function() {
            resetImagePreview(containerId, '#representative-document-fileInput', previewId);
        });

        return deleteButton;
    }

    // 이미지 초기화 함수
    function resetImagePreview(containerId, fileInputId, previewId) {
        var documentContainer = $(containerId);
        documentContainer.empty(); // 이미지 미리보기 및 삭제 버튼 제거
        $(fileInputId).val(''); // 파일 선택 input 초기화
        // 이미지 등록 버튼 생성 및 추가
        var newUploadButton = createUploadButton(containerId, previewId);
        documentContainer.append(newUploadButton);
    }

    // 이미지 업로드 버튼 생성 함수
    function createUploadButton(containerId, previewId) {
        var uploadButton = $('<label for="representative-document-fileInput">')
            .append('<div id="' + previewId.substring(1) + '" class="d-none"></div>')
            .append('<button class="btn" id="representative-document-btn" style="width: 100px; height: 100px; border: 1px dashed #d2d2d2;">' +
                '<i class="bi bi-plus-circle upload-icon" style="color: #6387A6"></i>' +
                '</button>')
            .append('<input  type="file" id="representative-document-fileInput" style="display: none;" accept="image/*" >');

        return uploadButton;
    }
 

 // 상세 이미지 등록 처리
    $('#document-btn').click(function() {
        $('#document-fileInput').click();
    });

 // 상세 이미지 선택 시 처리
    $('#document-fileInput').change(function() {
        var currentImageCount = $('.uploaded-document-image').length;
        if (currentImageCount >= 10) {
            alert('최대 10장까지만 첨부할 수 있습니다.');
            return;
        }

        // Multiple files handling
        for (var i = 0; i < this.files.length; i++) {
            var reader = new FileReader();

            reader.onload = (function(file) {
                return function(e) {
                    var newImage = $('<img>').attr({
                        src: e.target.result,
                        alt: 'Uploaded Document',
                        class: 'uploaded-document-image',
                        style: 'width: 100px; height: 100px; border: 1px dashed #d2d2d2; border-radius: 10px; margin-right: 5px;'
                    });

                    var documentContainer = $('#document-btn-container');

                    var imageContainer = $('<div>').css('display', 'inline-block').append(newImage);

                    var deleteButton = $('<button>').addClass('btn delete-icon p-0 position-relative').html('<i class="bi bi-x-circle-fill" style="color: #CC0000; position: absolute; top:-55px; right: 0;"></i>');

                    deleteButton.click(function() {
                        imageContainer.remove();
                    });

                    imageContainer.append(deleteButton);

                    documentContainer.append(imageContainer);
                };
            })(this.files[i]);

            reader.readAsDataURL(this.files[i]);
        }
    });
});

</script>

<script>
$(document).ready(function() {
    // 서비스 종류 글자 수 세기
    $('#service_type').on('input', function() {
        var enteredValue = $(this).val();
        var charCount = enteredValue.length;
        $('#titleCharCount').text(charCount + " ");
        // 30자 제한
        if (charCount > 30) {
            $(this).val(enteredValue.substring(0, 30));
            $('#titleCharCount').text("30" + " ");
        }
    });

    // 상세 설명 글자 수 세기
    $('.myTextarea').on('input', function() {
        var enteredValue = $(this).val();
        var charCount = enteredValue.length;
        $('#descriptionCharCount').text(charCount + " ");
        // 100자 제한
        if (charCount > 100) {
            $(this).val(enteredValue.substring(0, 100));
            $('#descriptionCharCount').text("100" + " ");
        }
    });
});
</script>

</head>
<body>
	<c:import url="/WEB-INF/views/include/header.jsp" />

	<div class="container mt-5 mb-5">
		<div class="row justify-content-center">
			<div class="col-md-6 section-divider">
				<div>
					<h2>
						<strong>포트폴리오</strong>
					</h2>
				</div>

				<div class="col Subtitle mt-4">
					<strong>필수 정보*</strong>
				</div>

				<form:form action="${root}/pro/ModifyProPortfolio" method="post" modelAttribute="ProportfolioModify" enctype="multipart/form-data">
					<form:hidden path="portfolio_id"/>
					<div class=form-container><!--enctype="multipart/form-data"  -->
						<div class="mt-4">
							<form:label path="service_type" class="form-label"
								style="font-weight: bold;">서비스 종류</form:label>
							<form:input path="service_type" autocomplete="off"
								class="form-control required service"
								placeholder="서비스한 활동명을 입력해 주세요" value="${PortfolioIdList.service_type }" />
							<div class="row">
								<div class="col text-end"
									style="color: #B5B5B5; font-size: 14px;">
									<span id="titleCharCount" style="color: #85BCEB;">0&nbsp;</span>/30자
								</div>
							</div>
						</div>

						<div class="was-validated">
							<!-- 포트폴리오 제목 입력 -->
							<div class="mt-4">
								<form:label path="portfolio_title" class="form-label"
									style="font-weight: bold;">포트폴리오 제목</form:label>
								<form:input path="portfolio_title" autocomplete="off"
									class="form-control" placeholder="포트폴리오 제목을 입력해주세요." value="${PortfolioIdList.portfolio_title }" />
								<!-- <div class="row">
								<div class="col text-end"
									style="color: #B5B5B5; font-size: 14px;">
									<span id="titleCharCount" style="color: #85BCEB;">0&nbsp;</span>/30자
								</div>
							</div> -->
							</div>
						</div>

						<div class="mt-4">
							<div class="form-label" style="font-weight: bold;">상세 이미지
								등록</div>
							<div class="rounded-3 p-3 border"
								style="background-color: #D2D2D2;">
								<i class="bi bi-exclamation-circle" style="font-size: 14px;">&nbsp;이미지는
									가로, 세로 600px 이상 1:1 비율로 권장합니다. (최대 10장)</i>
							</div>
							
							<div class="photo_review" style="padding-top: 22.5px;"> 
								<div id="document-btn-container" style="margin-top: 0.2%; margin-bottom: 20px;">
							    <label class="btn" id="document-btn" style="width: 100px; height: 100px; border: 1px dashed #d2d2d2; margin-right: 5px;">
							        <i class="bi bi-plus-circle upload-icon" style="position: absolute; top:40%; left:11.5%; transform: translate(-50%, -50%); color: #6387A6"></i>
							    </label>
							    <input type="file" id="document-fileInput" name="uploadFiles" style="display: none;" accept="image/*" multiple="true" />
							</div> 
								</div>
							</div>
							<p></p>
							<p></p>
							<p></p>
						</div>
						<div class="container mb-5">
							<div class="row justify-content-center">
								<div class="col-md">
									<div class="col Subtitle mt-4">
										<strong>상세 정보</strong>
									</div>
									<div class="mt-4 d-flex flex-column">
										<label class="form-label" style="font-weight: bold;">지역
											정보</label>
										<div>
											<div class="text-decoration-none locationBtn" data-bs-toggle="modal"
												data-bs-target="#locationModal"
												style="width: 100%; padding: 0; border: none; position: relative; color: black;">
												<input class="form-control w-100" value="${PortfolioIdList.location_info }"
													placeholder="시/군/구를 선택해주세요."/>
											</div>
										</div>
										<!-- 지역 모달 -->
										<div class="modal fade" id="locationModal" tabindex="-1"
											aria-labelledby="locationModalLabel" aria-hidden="true">
											<div class="modal-dialog modal-dialog-scrollable">
												<div class="modal-content">
													<div class="modal-header">
														<h1 class="modal-title fs-5" id="locationModalLabel">지역
															선택</h1>
														<button type="button" class="btn-close"
															data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													<div class="modal-body">
														<div class="accordion" id="categoryAccordion">
															<!-- 아래 스크립트를 body 내부에 추가하세요 -->
															<script>
									                        $.each(cityDatas, function (city, districts) {
									                            document.write('<div class="accordion-item">');
									                            document.write('<h2 class="accordion-header">');
									                            document.write('<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#' + city + '">' + city + '</button>');
									                            document.write('</h2>');
									                            document.write('<div id="' + city + '" class="accordion-collapse collapse" data-bs-parent="#categoryAccordion">');
									                            document.write('<ul class="list-group">');
									                            $.each(districts, function (index, district) {
									                                document.write('<button type="button" class="list-group-item list-group-item-action locBtn" data-city="' + city + '" data-district="' + district + '">' + district + '</button>');
									                            });
									                            document.write('</ul></div></div>');
									                        });
									                     // 구 선택을 처리하는 클릭 이벤트 핸들러 추가
									                         $(document).ready(function() {
														        $(".locBtn").click(function () {
														            $(".locBtn").removeClass("selected");
														            $(this).addClass("selected");
														        });
														
														        $("#selectLocationBtn").click(function () {
														            var selectedCity = $(".locBtn.selected").data("city");
														            var selectedDistrict = $(".locBtn.selected").data("district");
														
														            console.log('선택한 위치:', selectedCity, selectedDistrict);
														
														           // $("#modalSelectedLocation").val(selectedCity + '/' + selectedDistrict);
														            $("#modalSelectedLocation").val(selectedDistrict);
														            $("#locationModal").modal('hide');
														            $(".locationBtn").text(selectedDistrict);
														        });
														    });
									                    </script>
														</div>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary"
															data-bs-dismiss="modal">취소</button>
														<button type="button" class="btn btn-primary"
															id="selectLocationBtn">선택</button>
													</div>
													<form:hidden path="location_info" id="modalSelectedLocation" name="selectedLocation" value=""/>
												</div>
											</div>
										</div>

									</div>

									<div class="mt-4">
										<form:label path="final_amount" class="form-label"
											style="font-weight: bold;">최종 금액</form:label>
										<form:input path="final_amount" class="form-control" value="${PortfolioIdList.final_amount }"
											placeholder="최종 금액을 입력해주세요." />
									</div>

									<div class="row">
										<div class="col-md-6 mt-4" style="margin-right: 0;">
											<form:label path="work_year" class="form-label"
												style="font-weight: bold;">작업 연도</form:label>
											<form:select path="work_year" class="form-control required" value="${PortfolioIdList.work_year }"
												id="yearSelect">
												<!-- 연도 선택 스크립트 -->
											</form:select>
										</div>
										<div class="col-md-6 mt-4" style="margin-right: 0;">
											<div class="row">
												<div class="col-md">
													<form:label path="work_period" class="form-label"
														style="font-weight: bold;">작업 소요기간</form:label>
													<form:input path="work_period"
														class="form-control required" value="${PortfolioIdList.work_period }"
														placeholder="소요기간(ex.4개월, 1년반)" min="1" />
												</div>
											</div>
										</div> 
									</div> 
									<div class="mt-4">
										<form:label path="detailed_introduction" class="form-label"
											style="font-weight: bold;">상세 설명</form:label>
										<div class="review_text">
											<textarea name="detailed_introduction"
											    class="form-control myTextarea"
											    style="border-radius: 10px; border: 1px solid #e1e1e1; width: 100%; margin-top: 0.8%;"
											    placeholder="해당 경력에 대한 상세한 설명을 작성해 주세요."
											    rows="5">${PortfolioIdList.detailed_introduction}</textarea>
											<div class="col text-end"
												style="color: #B5B5B5; font-size: 14px;">
												<span id="descriptionCharCount" style="color: #85BCEB;">0&nbsp;</span>/100자
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="container mt-5">
							<div class="row justify-content-center">
								<div class="col-md-6 me-4">
									<form:button class="btn button-custom"
										style="width:110%; font-weight: bold; margin-top: 20px; ">등록하기</form:button>
								</div>
							</div>
						</div>
						
				</form:form>
					</div>
			</div>
		</div>
	</div>
	<c:import url="/WEB-INF/views/include/footer.jsp" />
</body>
</html>