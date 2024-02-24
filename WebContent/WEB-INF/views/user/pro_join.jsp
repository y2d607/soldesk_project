<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
<script src="${root}/script/jquery-3.4.1.min.js"></script> 
 
<script>
 
 $(function() {
	// 비밀번호 일치 여부 확인
	$('#password, #confirmPassword').on('keyup', function() {
		var password = $('#password').val();
		var confirmPassword = $('#confirmPassword').val();
		var message = $('#message');

		// 사용자가 입력한 password 값이 비어있거나 confirmPassword 값이 비어있으면 메시지를 표시하지 않음
		if (!password || !confirmPassword) {
			message.html('');
			return;
		}

		if (password === confirmPassword) {
			message.html('비밀번호가 일치합니다.').css('color', 'green');
		} else {
			message.html('비밀번호가 일치하지 않습니다.').css('color', 'red');
		}
	});

//카테고리 선택 최대 3개  
    var maxCheckboxes = 3;

    $('.activeSel').on('change', function () {
        var checkedCheckboxes = $('.activeSel:checked');

        if (checkedCheckboxes.length > maxCheckboxes) {
            $(this).prop('checked', false);
            window.alert('최대 3개까지 선택할 수 있습니다.');
        }
        var selectedValues = checkedCheckboxes.map(function () {
            return $(this).val();
        }).get();

        console.log('Selected values:', selectedValues);
    }); 
 });
 $(function() {
	  // 시/도와 군/구 데이터
	    var cityData = {
	        seoul: ['강남구', '강동구', '강북구', '강서구', '관악구', '광진구', '구로구', '금천구', '노원구', '도봉구', '동대문구', '동작구', '마포구', '서대문구', '서초구', '성동구', '성북구', '송파구', '양천구', '영등포구', '용산구', '은평구', '종로구', '중구', '중랑구'],
	        busan: ['강서구', '금정구', '남구', '동구', '동래구', '부산진구', '북구', '사상구', '사하구', '서구', '수영구', '연제구', '영도구', '중구', '해운대구'],
	        incheon: ['계양구', '남동구', '동구', '미추홀구', '부평구', '서구', '연수구', '중구'],
	        daejun: ['대덕구', '동구', '서구', '유성구', '중구'],
	        daegu: ['남구', '달서구', '달서군', '동구', '북구', '서구', '수성구', '중구'],
	        ulsan: ['남구', '동구', '북구', '중구', '울주군'],
	        kwangju: ['광산구', '남구', '동구', '북구', '서구'],
	        jeju: ['서귀포시', '제주시'],
	        sejong: ['세종특별자치시'],
	        Gyeonggi_do: ['고양시', '과천시', '광명시', '광주시', '구리시', '군포시', '김포시', '남양주시', '동두천시', '부천시', '성남시', '수원시', '시흥시', '안산시', '안성시', '안양시', '양주시', '여주시', '오산시', '용인시', '의왕시', '의정부시', '이천시', '파주시', '평택시', '포천시', '하남시', '화성시', '가평군', '양평군', '연천군'],
	        Gangwon: ['강릉시', '동해시', '삼척시', '속초시', '원주시', '춘천시', '태백시', '고성군', '양구군', '양양군', '영월군', '인제군', '정선군', '철원군', '평창군', '홍천군', '화천군', '횡성군'],
	        Chungcheongbuk: ['제천시', '청주시', '충주시', '괴산군', '단양군', '보은군', '영동군', '옥천군', '음성군', '증평군', '진천군'],
	        Chungcheongnam: ['계룡시', '공주시', '논산시', '당진시', '보령시', '서산시', '아산시', '천안시', '금산군', '부여군', '서천군', '예산군', '청양군', '태안군', '홍성군'],
	        Gyeongsangbuk: ['경산시', '경주시', '구미시', '김천시', '문경시', '상주시', '안동시', '영주시', '영천시', '포항시', '고령군', '군위군', '봉화군', '성주군', '영덕군', '영양군', '예천군', '울릉군', '울진군', '의성군', '청도군', '청송군', '칠곡군'],
	        Gyeongsangnam: ['거제시', '김해시', '밀양시', '사천시', '양산시', '진주시', '창원시', '통영시', '거창군', '고성군', '남해군', '산청군', '의령군', '창녕군', '하동군', '함안군', '함양군', '합천군'],
	        Jeollabuk: ['군산시', '김제시', '남원시', '익산시', '전주시', '정읍시', '고창군', '무주군', '부안군', '순창군', '완주군', '임실군', '장수군', '진안군'],
	        Jeollanam: ['광양시', '나주시', '목포시', '순천시', '여수시', '강진군', '고흥군', '곡성군', '구례군', '담양군', '무안군', '보성군', '신안군', '영광군', '영암군', '완도군', '장성군', '장흥군', '진도군', '함평군', '해남군', '화순군']
	    }; 


	    // 시/도 선택 시 해당 시/도에 맞는 군/구 목록을 동적으로 추가
	    $('#selectProvince').on('change', function () {
	        var selectedProvince = $(this).val();
	        var cities = cityData[selectedProvince];
	        
	        // 기존의 군/구 목록을 비움
	        $('#selectCity').empty();
	        
	        // 선택한 시/도에 따른 군/구 목록을 추가
	        if (cities) {
	            for (var i = 0; i < cities.length; i++) {
	                $('#selectCity').append('<option value="' + cities[i] + '">' + cities[i] + '</option>');
	            }
	        }
	    }); 
		$('#selectCity').on('change', function () {
			var selectedCity = $('#selectCity').val();
			var selectedProvince =  $('#selectProvince').val();
		    var cities = cityData[selectedProvince]; 
		    console.log("선택한 지역:",selectedProvince); 
		    console.log("선택한 구:",selectedCity); 
		    // 선택한 시/도에 따른 군/구 목록을 추가
		    if (cities) {
		        for (var i = 0; i < cities.length; i++) {
		            $('#selectCity').append('<option value="' + cities[i] + '">' + cities[i] + '</option>');
		        } 
		    } 
		}); 

		// 페이지 로드 시 초기 시/도 선택 상자의 change 이벤트를 수동으로 트리거
	     $('#selectProvince').val('seoul').trigger('change');
});
</script>
<script>
function checkProuserEmailExist(){
	
	var pro_email = $("#pro_email").val()
	console.log("pro_email",pro_email);
	if(pro_email.length == 0){
		alert('이메일을 입력해주세요')
		return
	}//이메일을 입력하지 않았을 때
	
	$.ajax({
	    url: '${root}/user/checkProuserEmailExist/' + encodeURIComponent(pro_email),
	    type: 'get',
	    dataType: 'text',
	    success: function (result) {
	        if (result.trim() == 'true') {
	            alert('사용할 수 있는 이메일입니다');
	            $("#ProuserEmailExist").val('true');
	        } else if (result.trim() == 'false') {
	            alert('사용할 수 없는 이메일입니다');
	            $("#ProuserEmailExist").val('false');
	        } else {
	            alert('서버에서 올바른 응답을 받지 못했습니다');
	        }
	    },
	    error: function () {
	        alert('서버 통신 중 오류가 발생했습니다');
	    }
	});
}
function resetUserIdExist(){
	
	$("#ProuserEmailExist").val('false')
	
}//사용자 아이디란에 입력 시 UserIdExist의 값을 false 주입ㄴ

</script>



<style>
#username, #email, #password, #confirmPassword {
   font-size: 18px;
}

.card-body {
   background-color: #C6D7E0;
}


</style>
</head>

<body>
   <c:import url="/WEB-INF/views/include/header.jsp" />

   <div class="w-75 mx-auto">
      <div class="row justify-content-center mx-auto">
         <div class="col-md-5" style="width: 35%;">
            <h2 class="card-title text-center mb-5 mt-5 fw-bold">아숨에 오신 것을
               환영합니다!</h2>
            <div class="card">
               <div class="card-body" style="padding: 30px; font-size: 20px;">
                  <form:form action="${root }/user/join_Prouser" method="post"
                     modelAttribute="joinProuserBean">
                     <form:hidden path="ProuserEmailExist" />
                      <div class="form-group mb-3">
                       <form:label path="pro_name">이름</form:label>
                       <form:input path="pro_name"  autocomplete='off' type="text" class="form-control" placeholder="사용자 이름을 입력하세요" />
                       <form:errors path="pro_name" style="color:red" />
                   </div>
                   
                      <div class="mb-3 form-group">
                          <form:label path="pro_email">이메일</form:label>
                          <div class="input-group">
                              <form:input type="email"  autocomplete='off'    path="pro_email" class="form-control" placeholder="이메일 주소를 입력하세요" onkeypress="resetUserIdExist()" />
                              <div class="input-group-append">
                                  <button type="button" class="btn button-custom" onclick='checkProuserEmailExist()'>중복확인</button>
                              </div>
                          </div>
                          <form:errors path="pro_email" style="color:red" />
                      </div> 
                      <div class="form-group mb-3">
                          <form:label path="pro_pwd">비밀번호</form:label>
                          <form:password path="pro_pwd" autocomplete="new-password" class="form-control" id="password" />
                          <form:errors path="pro_pwd" style="color:red" />
                      </div>
                      
                      <div class="form-group mb-3">
                          <form:label path="confirmPassword">비밀번호 확인</form:label>
                          <form:password path="confirmPassword" class="form-control" id="confirmPassword" />
                          <div class="invalid-feedback">비밀번호가 일치하지 않습니다.</div>
                      </div>
                     <!-- 추가된 부분 비밀번호 메시지-->
                     <div id="message"></div>
                     <!-- "남, 여" 라디오 버튼 부분 추가 -->
                     <div class="form-group mb-3 qjdiflqjdi">
                        <label for="male" class="form-label">성별</label>
                        <div class="form-check">
                           <form:radiobutton path="pro_gender" class="form-check-input"
                              id="male" value="남" checked="true" />
                           <form:label path="pro_gender" class="form-check-label" for="male">남</form:label>
                        </div>
                        <div class="form-check">
                           <form:radiobutton path="pro_gender" class="form-check-input"
                              id="female" value="여" />
                           <form:label path="pro_gender" class="form-check-label" for="female">여</form:label>
                        </div>
                     </div>
                     
                     <div class="mt-3">
                        <label for="servicecategory" class="form-label"> 활동 분야를
                           선택해주세요</label>
                     </div> 
                     <div class="accordion" id="category">
					    <div class="accordion-item"> 
					        <c:forEach var="category" items="${service_category_name}" varStatus="loop" >
					            <h2 class="accordion-header"> 
					                <button class="accordion-button" type="button"
					                        data-bs-toggle="collapse" data-bs-target="#${category}" >
					                    ${category} 
					                </button>
					            </h2>
					            <div id="${category}" class="accordion-collapse collapse "
					                 data-bs-parent="#category">
					                <div class="accordion-body ">
					                    <ul class="list-group">
					                        <c:forEach var="detailCategory" items="${detailCategoryList[loop.index]}">
					                            <li class="list-group-item">
					                                <form:checkbox path="active_detailcategory" class="form-check-input me-1 activeSel"  value="${detailCategory.detail_category_name}" id="${detailCategory.detail_category_name}"/>
					                                <form:label path="active_detailcategory" class="form-check-label stretched-link" for="${detailCategory.detail_category_name}">${detailCategory.detail_category_name}</form:label>
					                            </li> <!--야호-->
					                        </c:forEach>
					                    </ul>
					                </div> 
					            </div>
					        </c:forEach>
					    </div>
					</div> 
                     <div class="container mt-4">
                        <label for="locationselect" class="form-label">활동 지역를
                           선택해주세요</label>
                        <div class="form-group">
                           <label for="selectProvince">시/도</label>
                           <select class="form-control" id="selectProvince">
                              <!-- 시/도 목록 -->
                              <option value="seoul" selected>서울</option>
                              <option value="busan">부산</option>
                              <option value="incheon">인천</option>
                              <option value="daejun">대전</option>
                              <option value="daegu">대구</option>
                              <option value="ulsan">울산</option>
                              <option value="kwangju">광주</option>
                              <option value="jeju">제주</option>
                              <option value="sejong">세종</option>
                              <option value="Gyeonggi_do">경기</option>
                              <option value="Gangwon">강원</option>
                              <option value="Chungcheongbuk">충북</option>
                              <option value="Chungcheongnam">충남</option>
                              <option value="Gyeongsangbuk">경북</option>
                              <option value="Gyeongsangnam">경남</option>
                              <option value="Jeollabuk">전북</option>
                              <option value="Jeollanam">전남</option>
                           </select>
                        </div>
                        <div class="form-group">
                           <form:label path="active_location" for="selectCity">군/구</form:label>
                           <form:select path="active_location" class="form-control"
                              id="selectCity">
                              <!-- 선택한 시/도에 따른 군/구 목록은 JavaScript로 동적으로 추가됩니다. -->
                           </form:select>
                        </div>
                     </div> 
                     <div class=" form-group d-grid gap-2 mt-5">
                        <form:button type="submit" class="btn button-custom py-2 fs-5"
                           id="joinButton" style="color: white;">가입하기</form:button>
                     </div>
                  </form:form>
               </div>
            </div>
         </div>
      </div>
   </div>

   <c:import url="/WEB-INF/views/include/footer.jsp" />

</body>



</html>