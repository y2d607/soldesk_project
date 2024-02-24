<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>경력</title>
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
</head>
<body>

<c:import url="/WEB-INF/views/include/header.jsp" />
	
<form:form modelAttribute="careerForm" action="${root}/pro/career_pro" method="post">
    <div class="container mt-5 mb-3">
        <div class="row justify-content-center">
            <div class="col-md-6 section-divider">
                <div>
                    <h2><strong>경력</strong></h2>
                </div>
                <div class="col Subtitle mt-4"><strong>총 경력 기간</strong></div>
                <div class="col Explanation">전문 분야와 관련된 총 기간을 선택해주세요</div>
                   <label for="total_experience_period">총 경력기간</label>
					<form:select path="total_experience_period" class="form-select" id="totalPeriod">
					    <form:option value="-1" label="총 경력기간" />
					    <form:options items="${totalPeriodOptions}" />
					</form:select>
                </div>

                <p></p>
                <p></p>
                
                <div class="container" style="width: 50%">
					<div class="row justify-content-center">
						<div class="col">
							<div class="col">
								<div class="modal-body">

									<div class="row">
										<div class="Explanation2">*필수 입력 항목입니다</div>
									</div>

									<div class="rounded-3 p-3 border" style="background-color: #D2D2D2; text-align: center;">
										<i class="bi bi-exclamation-circle"> &nbsp;
											<span style="font-size: 14px;"> 
												개인 정보 노출 및 허위 정보를 기재할 경우, 아숨 이용이 제한될 수 있으며 사안에 따라 법적 책임을 물을 수 있습니다. 
											</span>
										</i>
									</div>

									<form class="was-validated">
										
										<div class="mt-4">
											<label for="validationTextarea" class="form-label">경력 타이틀*</label> 
											<form:input path="career_title" class="form-control" id="validationTextarea" placeholder="ex. 회사명, 직함" aria-required="true"/>
											<div class="row">
												<div class="col-auto invalid-feedback">경력을 입력해주세요.</div>
												<div class="col text-end" style="color: #B5B5B5; font-size: 14px;">
													<span id="titleCharCount" style="color: #85BCEB;">0&nbsp;</span>/20자
												</div>
											</div>
										</div>
									</form>

									
									<div class="mt-4">
									    <label for="startYearMonth">시작 연도*</label>
									    <div class="row">
									        <div class="col">
									            <form:select path="startYear" class="form-select" aria-invalid="false" id="startYear" aria-required="true">
									                <form:option value="" label="년" />
									                <form:options items="${yearOptions}" />
									            </form:select>
									        </div>
									        <div class="col">
									            <form:select path="startMonth" class="form-select" aria-invalid="false" id="startMonth" aria-required="true">
									                <form:option value="" label="월" />
									                <form:options items="${monthOptions}" />
									            </form:select>
									        </div>
									    </div>
									</div>


									<div class="mt-4">
								        <label for="startYear">종료연월*</label>
								        <div class="row">
								            <div class="col">
								                <form:select path="endYear" class="form-select" aria-invalid="false" id="startYear" aria-required="true">
												    <form:option value="" label="년" />
												    <form:options items="${yearOptions}" />
												</form:select>

								            </div>
								            <div class="col">
								                <form:select path="endMonth" class="form-select" aria-invalid="false" id="startMonth" aria-required="true">
												    <form:option value="" label="월" />
												    <form:options items="${monthOptions}" />
												</form:select>
								            </div>
								        </div>
								    </div>

									<!-- 상세 설명 입력 -->
									<div class="mt-4">
										<label for="myTextarea" class="form-label">상세 설명</label>
										<div class="review_text">
									        <form:textarea path="detailed_introduction" id="myTextarea" style="border-radius: 10px; border: 1px solid #e1e1e1; width: 100%; margin-top: 0.8%;" placeholder="해당 경력에 대한 상세한 설명을 작성해 주세요." rows="5"/>
									        <div class="col text-end" style="color: #B5B5B5; font-size: 14px;">
									            <span id="descriptionCharCount" style="color: #85BCEB;">0&nbsp;</span>/40자
									        </div>
									    </div>
									</div>
									
									<!-- 등록 버튼 -->
					                <form:button type="submit" class="btn btn-primary " style="width: 100%; background-color: #85BCEB; font-weight: bold; margin-top: 20px; border: none;">
					                	저장
					                </form:button>
								</div>
							</div>
						</div>
					</div>
				</div>
                
            </div>
        </div>
  
</form:form> <!-- 폼 종료 -->

<c:import url="/WEB-INF/views/include/footer.jsp" />
	<!-- JavaScript 부분 -->
<script>
		// 경력 타이틀 입력 글자수 세기
		$('#validationTextarea').on('input', function() {
			var enteredValue = $(this).val();
			var charCount = enteredValue.length;
			$('#titleCharCount').text(charCount + " ");

			// 20자 제한
			if (charCount > 20) {
				$(this).val(enteredValue.substring(0, 20));
				$('#titleCharCount').text("20" + " ");
			}
		});
		
		 $('#myTextarea').on('input', function() {
		        countChars();
		    });

		// 상세 설명 입력 글자수 세기
		function countChars() {
			var enteredValue = $('#myTextarea').val();
			var charCount = enteredValue.length;
			$('#descriptionCharCount').text(charCount + " ");

			// 40자 제한
			if (charCount > 40) {
				$('#myTextarea').val(enteredValue.substring(0, 40));
				$('#descriptionCharCount').text("40" + " ");
			}
		}
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


	


	<!-- 모달 데이터 등록 스크립트 -->
	


</body>
</html>