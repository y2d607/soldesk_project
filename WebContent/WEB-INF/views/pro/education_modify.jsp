<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!-- 루트경로, 프로젝트시작할 때  -->
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>학력</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="${root}/script/jquery-3.4.1.min.js"></script>

<style>
.Explanation {
	color: #B5B5B5;
	font-size: 16px;
	margin-top: 5px;
	margin-bottom: 5px;
}

.Explanation2 {
	color: #3E3E3E;
	font-size: 14px;
	margin-top: 5px;
	margin-bottom: 5px;
}

.Subtitle {
	font-size: 20px;
	font-weight: bold;
	color: #3E3E3E;
}

.Subtitle2 {
	font-size: 24px;
	font-weight: bold;
	color: #3E3E3E;
}

.AfterMD {
	font-size: 12px;
	font-weight: bold;
	color: #85BCEB;
	text-decoration: none;
}

/* .custom-file-upload {
    border: 1px solid #d2d2d2;
    display: inline-block;
    padding: 8px 12px;
    cursor: pointer;
    background-color: #fff;
    color: #6387A6;
    border-radius: 5px;
}

.custom-file-upload i {
    margin-right: 5px;
} */

/* 파일 업로드 버튼에 적용할 스타일 */
.custom-file-upload {
    border: 1px solid #d2d2d2;
    display: inline-block;
    padding: 8px 12px;
    cursor: pointer;
    background-color: #fff;
    color: #6387A6;
    border-radius: 5px;
}

.custom-file-upload i {
    margin-right: 5px;
}

/*섹션 스타일*/
.section-divider {
	border-bottom: 1px solid #F2F2F2; /* 실선 스타일 및 색상 설정 */
}
/*색 있는 버튼*/
.button1 {
	background-color: #85BCEB;
	font-weight: bold;
	margin-top: 20px;
	border: none;
}
</style>

<script>
	
</script>

</head>
<body>

	<c:import url="/WEB-INF/views/include/header.jsp" />
	<!-- 헤더 -->

	<div class="container mt-5 mb-3 " style="width: 38%">
		<div>
			<h2>
				<strong>학력</strong>
			</h2>
		</div>
		<p></p>
		<p></p>
	</div>
	
	<form:form action="${root}/pro/education_modify_pro" method="post" modelAttribute="educationContentModifyBean" enctype="multipart/form-data">
		<form:hidden path="education_id"/>
        <div class="container mt-3 mb-5" style="width: 38%">
            <div class="modal-body mx-auto">
                <div class="row">
					<div class="Explanation2">*필수 입력 항목입니다</div>
				</div>
				
				<div class="rounded-3 p-3 border" style="background-color: #D2D2D2; text-align: center;">
					<i class="bi bi-exclamation-circle"> &nbsp;
					<span style="font-size: 14px;"> 
						개인 정보 노출 및 허위 정보를 기재할 경우, 아숨 이용이 제한될 수 있으며 사안에 따라 법적 책임을 물을 수 있습니다. 
					</span></i>
				</div>
				
				<form class="was-validated">
				    <!-- 학교명 입력 -->
				    <div class="mt-4">
				        <label for="schoolName" class="form-label">학교명*</label> 
				        <form:input path="school_name" class="form-control" id="school_name" placeholder="ex. 아숨대학교" required="required" />
				        
				        <div class="row">
				            <div class="col-auto invalid-feedback">
				                <form:errors path="school_name" cssClass="invalid-feedback" />
				            </div>
				            <div class="col text-end" style="color: #B5B5B5; font-size: 14px;">
				                <span id="titleCharCount" style="color: #85BCEB;">0&nbsp;</span>/40자
				            </div>
				        </div>
				    </div>
				</form>
				
               <div class="mt-4">
			        <label for="major" class="form-label">전공명*</label> 
			        <form:input path="major_name" class="form-control" id="major_name" placeholder="ex. 경영학과" required="required" />
			        <div class="row">
			            <div class="col-auto invalid-feedback">
			                <form:errors path="major_name" cssClass="invalid-feedback" />
			            </div>
			            <div class="col text-end" style="color: #B5B5B5; font-size: 14px;">
			                <span id="descriptionCharCount" style="color: #85BCEB;">0&nbsp;</span>/20자
			            </div>
			        </div>
			    </div>
			    
				
			<div class="mt-4">
			    <label for="admission_date">입학 연월*</label>
			    <div class="row">
			        <div class="col">
			            <form:select path="admissionYear" class="form-select" aria-invalid="false" id="admissionYear" aria-required="true">
			                <form:option value="" label="년" />
			                <form:options items="${yearOptions}" />
			            </form:select>
			        </div>
			        <div class="col">
			            <form:select path="admissionMonth" class="form-select" aria-invalid="false" id="admissionMonth" aria-required="true">
			                <form:option value="" label="월" />
			                <form:options items="${monthOptions}" />
			            </form:select>
			        </div>
			    </div>
			</div>


			<div class="mt-4">
		        <label for="graduation_date">졸업 연월*</label>
		        <div class="row">
		            <div class="col">
		                <form:select path="graduationYear" class="form-select" aria-invalid="false" id="graduationYear" aria-required="true">
						    <form:option value="" label="년" />
						    <form:options items="${yearOptions}" />
						</form:select>

		            </div>
		            <div class="col">
		                <form:select path="graduationMonth" class="form-select" aria-invalid="false" id="graduationMonth" aria-required="true">
						    <form:option value="" label="월" />
						    <form:options items="${monthOptions}" />
						</form:select>
		            </div>
		        </div>
		    </div>
		    
		    <div class="mt-4">
			    <label for="validationTextarea" class="form-label">증빙 자료 첨부</label>
			    <div class="row">
			        <div class="photo_review">
			            <div id="document-btn-container" style="margin-top: 0.2%; margin-bottom: 20px; display: flex; flex-wrap: nowrap; overflow-x: auto;">
			                <input type="file" id="document-fileInput" style="display: none;" accept="image/*" name="eduUpload" multiple="true" />
			                <form:label path="evidence_image" for="document-fileInput" class="custom-file-upload" style="width: 100px; height: 100px; display: flex; align-items: center; justify-content: center; border: 1px solid #d2d2d2; border-radius: 8px;">
			                    <i class="bi bi-plus-circle upload-icon" style="color: #6387A6; margin-left: 4px;"></i>
			                </form:label>
			
			                <div id="uploaded-images-container" style="display: flex; flex-wrap: nowrap;" class="ms-3">
			                    <c:set var="education_id" value="${education_id}" />
			                    <%-- 특정 education_id에 해당하는 이미지 정보 조회 --%>
			                    <c:forEach var="education" items="${educationList}">
			                        <c:if test="${education.education_id eq education_id}">
			                            <%-- 이미지 표시 --%>
			                            <img src="${root}/eduUpload/${education.evidence_image}" class="feed-img" style="width: 100px; height: 100px; border-radius: 8px; margin-right: 5px;" alt="이미지">
			                        </c:if>
			                    </c:forEach>
			                </div>
			                
			            </div>
			        </div>
			    </div>
			</div>

                <!-- 나머지 폼 필드들도 유사하게 추가 -->

               
          </div> 
          <form:button type="submit" class="btn btn-primary " style="width: 100%; background-color: #85BCEB; font-weight: bold; margin-top: 20px; border: none;">
                	저장
             </form:button>
      </div>
  </form:form>
	

<c:import url="/WEB-INF/views/include/footer.jsp" />

		<!-- JavaScript 부분 -->
		<script>
		// 학교명 입력 글자수 세기
		$('#school_name').on('input', function() {
		    var enteredValue = $(this).val();
		    var charCount = enteredValue.length;
		    $('#titleCharCount').text(charCount + " ");

		    // 40자 제한
		    if (charCount > 40) {
		        $(this).val(enteredValue.substring(0, 40));
		        $('#titleCharCount').text("40" + " ");
		    }
		});

		// 전공명 입력 글자수 세기
		$('#major_name').on('input', function() {
		    var enteredValue = $(this).val();
		    var charCount = enteredValue.length;
		    $('#descriptionCharCount').text(charCount + " ");

		    // 20자 제한
		    if (charCount > 20) {
		        $(this).val(enteredValue.substring(0, 20));
		        $('#descriptionCharCount').text("20" + " ");
		    }
		});
		</script>


		<script>
			// select bar 스크립트
			$(function() {
				$('#totalPeriod').on('change', function() {
					var selectedValue = $(this).val();
					console.log('선택된 값: ' + selectedValue);
					// 선택된 값을 사용하여 무언가를 처리할 수 있습니다.
				});
			});
		</script>


		<!-- <script>
			//연월 select bar
			function initializeYearMonth(selectId, yearRange) {
				var yearSelect = document.getElementById(selectId + 'Year');
				var monthSelect = document.getElementById(selectId + 'Month');

				// 년 옵션 추가
				var currentYear = new Date().getFullYear();
				for (var i = 0; i <= yearRange; i++) {
					var option = document.createElement('option');
					option.value = currentYear - i;
					option.textContent = currentYear - i + '년';
					yearSelect.appendChild(option);
				}

				// 월 옵션 추가
				for (var i = 1; i <= 12; i++) {
					var option = document.createElement('option');
					option.value = i;
					option.textContent = i + '월';
					monthSelect.appendChild(option);
				}
			}

			document.addEventListener('DOMContentLoaded', function() {
				initializeYearMonth('start', 30);
				initializeYearMonth('end', 15);
			});

			// 문서 로드 시 시작 연월 초기화 함수 호출
			document.addEventListener('DOMContentLoaded',
					initializeStartYearMonth);
		</script> -->


		<!-- 증빙 자료 첨부 스크립트 -->
		<script>
		document.getElementById('document-fileInput').addEventListener('change', function() {
		    var currentImageCount = document.querySelectorAll('.uploaded-document-image').length;

		    // 이미지 컨테이너를 가져옵니다
		    var imagesContainer = document.getElementById('uploaded-images-container');

		    // 기존에 추가된 이미지를 모두 제거합니다
		    imagesContainer.innerHTML = '';

		    if (currentImageCount >= 7) {
		        alert('최대 7장까지만 첨부할 수 있습니다.');
		        return;
		    }

		    var reader = new FileReader();
		    reader.onload = function(e) {
		        var newImage = document.createElement('img');
		        newImage.src = e.target.result;
		        newImage.alt = 'Uploaded Document';
		        newImage.className = 'uploaded-document-image';
		        newImage.style.width = '100px';
		        newImage.style.height = '100px';
		        newImage.style.border = '1px dashed #d2d2d2';
		        newImage.style.borderRadius = '10px';
		        newImage.style.marginRight = '5px';

		        // 새 이미지를 컨테이너에 추가합니다
		        imagesContainer.appendChild(newImage);

		        // 이미지 삭제 기능 추가
		        newImage.addEventListener('click', function() {
		            // 클릭한 이미지를 삭제합니다
		            imagesContainer.removeChild(newImage);
		        });
		    };

		    reader.readAsDataURL(this.files[0]);
		});
			/* document.getElementById('document-btn').addEventListener('click',
					function() {
						document.getElementById('document-fileInput').click();
					}); */
		</script>

		<script>
			// 고수 프로필로 이동하는 버튼<저장하기>
			//function redirectToExpertPage() {
			//	window.location.href = 'expert.html';
			//}
		</script>


		<!-- 모달 데이터 등록 스크립트(미완성 상태)
<script>
    $(function () {
        var experienceCounter = 1;

        // 경력 등록 함수
        function registerExperience() {
            var title = $('#validationTextarea').val();
            var startYear = $('#startYear').val();
            var startMonth = $('#startMonth').val();
            var endYear = $('#endYear').val();
            var endMonth = $('#endMonth').val();
            var description = $('#myTextarea').val();

            var experienceId = 'experience' + experienceCounter;

            var liElement = $('<li id="' + experienceId + '">');
            liElement.append('<h4>' + title + '</h4>');
            liElement.append('<span>' + startYear + '년 ' + startMonth + '월 - ' + endYear + '년 ' + endMonth + '월</span>');
            liElement.append('<p>' + description + '</p>');
            liElement.append('<i class="bi bi-x remove-experience"></i>'); // 삭제 버튼 추가

            $('#experienceList').append(liElement);

            experienceCounter++;

            // 입력란 초기화
            $('#validationTextarea').val('');
            $('#startYear, #startMonth, #endYear, #endMonth').val('');
            $('#myTextarea').val('');

            // 모달 닫기
            $('#staticBackdrop').modal('hide');

            // 경력 리스트 텍스트 가시성 업데이트
            updateExperienceTextVisibility();
        }

        // 경력 리스트에서 경력 항목 삭제 함수
        $('#experienceList').on('click', '.remove-experience', function (event) {
            event.stopPropagation(); // 경력 항목 클릭 이벤트 방지
            $(this).closest('li').remove(); // 해당 경력 항목 제거
            updateExperienceTextVisibility(); // 경력 리스트 텍스트 가시성 업데이트
        });

        // 경력 리스트에서 경력 항목 클릭 시
        $('#experienceList').on('click', 'li', function () {
            var experienceId = $(this).attr('id');
            populateModalForEdit(experienceId);
            $('#staticBackdrop').modal('show');
        });

        // 초기 경력 리스트 텍스트 가시성 업데이트
        updateExperienceTextVisibility();

        // 경력 등록 버튼 클릭 시
		$('#staticBackdrop .btn-primary').on('click', function () {
		    registerExperience();
		
		    // 모달 닫기 추가
		    $('#staticBackdrop').modal('hide');
		});

        // 경력 리스트 텍스트 가시성 업데이트 함수
		function updateExperienceTextVisibility() {
		    var experienceListLength = $('#experienceList li').length;
		
		    // 클래스 선택자 수정
		    $('.Explanation').toggle(experienceListLength === 0);
        }
    });
</script> -->
</body>
</html>