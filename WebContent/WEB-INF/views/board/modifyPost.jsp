<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="root" value="${pageContext.request.contextPath }" />	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글작성페이지</title>
<script src="${root}/script/jquery-3.4.1.min.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/29.1.0/classic/ckeditor.js"></script>
<!-- <script src="../jquery/locations.js"></script> -->

<script>
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
	var categoryData = {
			자격증시험: ['스포츠지도사 준비', '한국어능력시험 준비', '한국사능력시험 준비', '정보처리기사 준비', '컴퓨터활용능력 준비'],
			인테리어: ['가구리폼', '욕실/화장실 리모델링', '도배시공', '주방 리모델링', '조명 인테리어'],
			가전제품: ['전자제품 수리', '컴퓨터 수리', '비데 렌탈/구입/청소', '에어컨 설치 및 수리', '냉장고 설치 및 수리'],
			청소: ['에어컨 청소', '바퀴벌레 퇴치', '가구 청소', '계단/화장실 청소', '화재 복구/청소'],
			번역: ['한문 번역', '영어 번역', '독일어 번역', '일본어/일어 번역', '베트남어 번역'],
			문서: ['문서/글 작성', 'PPT 제작', '자막 제작', '사업계획서 제작', '교정/교열'],
			개발외주: ['웹 개발', '게임 개발', 'iOS 개발', 'QA 테스트', 'ERP 개발'],
			반려동물: ['반려견 산책', '반려동물 미용', '반려동물 수제간식 만들기', '반려동물 훈련', '반려동물 장례'],
		};
	// 시/도와 군/구 데이터
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
<style>
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
		color: #6387A6;
		border: none;
		padding: 5px;
		cursor: pointer;
		width: 70px;
    	border-radius: 8px;
	}

	.t-color {
		color: #9E9C9C;
	}

	.t-box {
		border: none;
		outline: none;
		width: 100%;
	}

	.ck.ck-editor {
    	max-width: 1500px;
	}
	.ck-editor__editable {
	    min-height: 350px;
	}
	
	.col-1{
		border: 1px solid #C2C2C2;
    	border-radius: 10px;
    	width: 60px !important; 
    	height: 60px !important;
    	margin-left: 15px;
    	display: flex;
    	align-items: center;
    	justify-content: center;
    	margin-right: 15px;
	}
	
	label.form-control.col-2.btn{
		display: flex;
    	align-items: center;
    	justify-content: center;
	}
	
	span.col-2 {
		width: fit-content;
		display: flex;
		align-items: center;
		margin-bottom: 15px;
		border: 1px solid black;
		border-radius: 8px;
		margin-right: 7.5px;
		margin-left: 7.5px;
	}
	
	.postInfo {
		display: flex;
		flex-direction: row;
		align-content: center;
		margin-bottom: 15px;
	}
	
	.commnuity-select{
		display: flex;
		flex-direction: row;
		align-items: center;
	}

	
	

</style>
</head>
<body>
<c:import url="/WEB-INF/views/include/header.jsp" />

<div class="container mt-5" style="width: 70%; height: 100%;">
	
	
	<!-- form 태그 작성 -->
	<form:form action="${root }/board/modifyPost_pro" method="post" modelAttribute="modifyPostBean" enctype="multipart/form-data">
		
		<div class="postInfo">
		<span class="col-2 mt-2">
			<button class="btn button categoryBtn" data-bs-toggle="modal" data-bs-target="#exampleModal" aria-controls="category" onclick="handleOtherButtonClicked(event)">
				${ctgBtnText } <i class="bi bi-caret-down"></i>
			</button>
		</span>
				
		<span class="col-2 mt-2">
			<button class="btn button locationBtn" data-bs-toggle="modal" data-bs-target="#locationModal" onclick="handleOtherButtonClicked(event)">
				${locBtnText } <i class="bi bi-caret-down"></i>
			</button>
		</span>
	</div>
		
		<form:hidden path="category" id="modalSelectedCategory" name="selectedCategory" />
		<form:hidden path="location" id="modalSelectedLocation" name="selectedLocation" />
		<form:hidden path="board_id"/>
		
		<div class="community-container container">
			<div class="commnuity-title t-color ">
				<form:input path="title" type="text" name="title" class="t-box" htmlEscape="false" placeholder="제목을 입력해 주세요"/>
				<!-- 에러 메시지 작성 -->
				<form:errors path="title" style="color:red"/>
			</div>
			<hr>
			
			<!-- 사진 -->
			<div class="commnuity-select">
				<div class="col-1"> 
					
					<input type="file" class="form-control col-2" id="inputGroupFile04" name="uploadFiles" style="display: none;" accept="image/*" multiple="true"/>
					
					<form:label path="photos" for="inputGroupFile04" class="form-control col-2 btn"> 
						<i class="bi bi-camera-fill"></i> <!-- 카메라 아이콘(사진 첨부) -->
					</form:label>
					<form:hidden path="photos"/>
				</div>
				
				<div class="selected-image">${photos }</div>
				
			</div>

			<hr>
			
			<!-- CKeditor: 글 작성 영역  --> 
			<div id="editor">
				<form:textarea path="content" id="hiddenEditorContent" name="editorContent" style="display: none;"></form:textarea>
			</div>
	 		<!-- 에러 메시지 작성 -->
	 		<form:errors path="content" style="color:red"/>
	 		
			<br />
		
			<div class="commnutiy-complete" style="display: flex; float: right;">
				<a href="${root }/board/detailCommunity?board_id=${board_id }" class="btn btn-info" style="margin-right: 8px; background-color: #fff; border: 1px solid #6387A6; color: #6387A6;">취소</a>
				<form:button class="btn button-custom" style="color: white; float: right;">수정 완료</form:button>
			</div>
		</div>
	</form:form>
	
</div>


	<!-- 카테고리 클릭하면 보이는 모달창 -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">카테고리 선택</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
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
				
	<!-- 지역 클릭하면 나오는 모달창 -->
	<div class="modal fade" id="locationModal" tabindex="-1" aria-labelledby="locationModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable">
			<div class="modal-content">
							
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="locationModalLabel">지역 선택</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
								
				<div class="modal-body">
					<div class="accordion">
						<!-- 아래 스크립트를 body 내부에 추가하세요 -->
						<script>
    $.each(cityData, function (city, districts) {
        document.write('<div class="accordion-item">');
        document.write('<h2 class="accordion-header">');
        document.write('<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#' + city + '" aria-expanded="false" aria-controls="' + city + '">');
        document.write(city);
        document.write('</button></h2>');
        document.write('<div id="' + city + '" class="accordion-collapse collapse" data-bs-parent="#locationModal">');
        document.write('<ul class="list-group">');

        $.each(districts, function (index, district) {
            document.write('<button type="button" class="list-group-item list-group-item-action locBtn" data-city="' + city + '" data-district="' + district + '">' + district + '</button>');
        });
        document.write('</ul></div></div>');
    });

    // 구 선택을 처리하는 클릭 이벤트 핸들러 추가
    $(".locBtn").click(function () {
        $(".locBtn").removeClass("selected");
        $(this).addClass("selected");

        // 선택한 도시와 구 가져오기
        var selectedCity = $(this).data("city");
        var selectedDistrict = $(this).data("district");

        // 도시와 구 모두 표시
        console.log('선택한 위치:', selectedCity, selectedDistrict);

        // 폼이나 필요한 곳에 값 설정
        document.getElementById("modalSelectedLocation").value = selectedCity + '/' + selectedDistrict;

        // 모달 닫기
        $("#locationModal").modal('hide');
        $(".locationBtn").text(selectedCity + '/' + selectedDistrict);
    });
</script>

					</div>
				</div>
								
				<div class="modal-footer" style="border:none; height: 30px;">
				</div> 
			</div>
		</div>
	</div>

<c:import url="/WEB-INF/views/include/footer.jsp" />

	<!-- 스크립트 -->
	<script>
    			ClassicEditor
        			.create( document.querySelector( '#editor' ), {
            			toolbar: {
                			items: [
                    			'Heading',
                    			'bold',
                    			'italic',
                    			'link',
                    			'bulletedList',
                			],
            			},
        			} )
        			.then(editor => {
    editor.model.document.on('change:data', () => {
        setTimeout(() => {
            document.getElementById('hiddenEditorContent').value = editor.getData();
            console.log(document.getElementById('hiddenEditorContent').value);
        }, 0);
    });
})
        			.catch( error => {
            			console.error( error );
        			} );
			</script>
	<script>
function handleOtherButtonClicked(event) {
    // 추가 로직을 원한다면 여기에 작성

    // 폼 제출을 막음
    event.preventDefault();
}
</script>


</body>
</html>