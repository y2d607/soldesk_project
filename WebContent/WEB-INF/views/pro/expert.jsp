<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>고수페이지</title>
<script src="${root}/script/jquery-3.4.1.min.js"></script>
<script src="${root}/jquery/locdata.js"></script>

<style>
	
	body > div, span, h5, button, h2, p {
		font-family:'Gothic A1' !important;	    
	}
	  
	#comments{
		color: #878787;
	}
	
	.Subtitle{ 
		font-size: 20px;
		font-weight: bold;
		color: #3E3E3E;
		
	}
	
	.Explanation{
		color: #B5B5B5;
		font-size: 16px;
		margin-top: 10px;
		margin-bottom: 10px;
	}
	
	.AfterMD{
		font-size: 13px;
		font-weight: bold;
		color: #85BCEB;
		text-align: right;
	}
	
	.BeforeMD{ 
		font-size: 13px;
		font-weight: bold;
		color: #F97373;
		text-align: right;
	}
	
	.content{
		font-size: 17px;
		color: #3E3E3E;
		text-align: left;
	}
	
	.InvisibleButton {
        background-color: transparent;
        border: none;
        
    }
    /*섹션 스타일*/
    .section-divider {
	    border-bottom: 1px solid #F2F2F2; /* 실선 스타일 및 색상 설정 */
	}
	/*! 아이콘 스타일*/
	.bi.bi-exclamation-circle {
    font-size: 15px;
}

/* 4. 제공서비스 버튼, 숨겨진 상태로 설정 */
    .btn.btn-sm.btn-secondary {
        display: none;
    }
    
    .btn.btn-outline-primary.categoryBtn {
    display: none;
} 

.colllll{
      border: 1px solid #C2C2C2;
       border-radius: 10px;
       width: 55px !important; 
       height: 52 !important;
       display: flex;
       align-items: center;
       justify-content: center;
       margin-right: 15px;
       margin-top: 22px;
       margin-bottom: 22px;
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
	
</style>
<!-- style="background-color: palegreen" -->

<script src="${root }/jquery/address.js"></script> <!-- 도로주소명API 불러오기 -->

<script> 
//상세설명 수정과 삽입....
$(document).ready(function() {
    // 수정 버튼 클릭 시
    $("#editBtn2").click(function() {
       
        // 이전에 저장된 상세설명 가져오기
        var savedDetailText = $("#descriptionContent").text();
        
     // 콘솔에 출력
        console.log("이전에 저장된 상세설명:", savedDetailText);
     
        $("#editTextArea2").val(savedDetailText);
    });

    // 저장 버튼 클릭 시
    $("#saveBtn2").click(function() {
        // 편집 중인 텍스트 내용 가져오기
        var detailText = $("#editTextArea2").val();
         
        // Ajax를 사용하여 서버로 데이터 전송
        $.ajax({
            type: "POST",
            url: "${root}/pro/expert_introductionModify/",
            contentType: "application/json",
            data: JSON.stringify({ pro_detailed_introduction: detailText }), // 데이터를 JSON 문자열로 변환
            success: function(response) {
                // 성공 시 서버 응답에 대한 처리
                console.log(response);
            },
            error: function(error) {
                // 오류 시 처리
                console.error("오류:", error);
            }
        });
    });
});



//가격
$(document).ready(function () {
    // 저장 버튼 클릭 시
    $("#saveBtn3").click(function () {
        // 편집 중인 텍스트 내용을 가져오기
        var editedPrice = $("#editTextArea3").val();

        // Ajax를 사용하여 서버로 데이터 전송
        $.ajax({
            type: "POST",
            url: "${root}/pro/expert_modify/",  // 수정이 필요한 엔드포인트로 변경
            contentType: "application/json",
            data: JSON.stringify({ price: editedPrice }),  // 데이터를 JSON 문자열로 변환
            success: function (response) {
                // 성공 시 서버 응답에 대한 처리
                console.log(response);
                // 수정된 내용을 화면에 업데이트
                $("#priceContent").text(editedPrice);
                // 편집 영역 감추기, 보여주기 등 필요한 로직 추가
            },
            error: function (error) {
                // 오류 시 처리
                console.error("Error:", error);
            }
        });
    });
});

//숨고 활동명
$(document).ready(function() {
    // 수정 버튼 클릭 시
    $("#editBtn1").click(function() {
        // 이전에 저장된 활동명 가져오기
        var savedActivityName = $("#descriptionContainer1 .content").text().trim();
        
        // 콘솔에 출력
        console.log("이전에 저장된 활동명:", savedActivityName);

    });

    $("#saveBtn1").click(function() {
        // 편집 중인 텍스트 내용 가져오기
        var activityName = $("#editTextArea1").val();

        // 데이터를 JSON 문자열로 변환
        var jsonData = JSON.stringify({ pro_name: activityName,
        								pro_id:"${param.id}"});

        // 콘솔에 전송하는 데이터 출력
        console.log("전송하는 데이터:", jsonData);

        // Ajax를 사용하여 서버로 데이터 전송
        $.ajax({
            type: "POST",
            url: "${root}/pro/expert_modifyName",
            contentType: "application/json", // 컨텐츠 타입을 application/json으로 설정
            data: jsonData, // 데이터를 JSON 문자열로 변환한 변수 전달
            success: function(response) {
                console.log(response);
            },
            error: function(error) {
                console.error("Error:", error);
            }
        });
    });
});  
 
//4. 카테고리 수정...

 $(function () {
        var maxServices = 4; // 최대 추가 가능한 서비스 개수

        // selectCategoryBtn 버튼에 대한 클릭 이벤트 핸들러 추가
        $("#selectCategoryBtn").click(function () {
            // 현재 추가된 서비스의 개수 확인
            var currentServices = $(".list-group-provided-services li").length;

            // 최대 서비스 개수보다 적은 경우에만 추가 로직 수행
            if (currentServices < maxServices) {
                var selectedCategory = $(".list-group-item.selected").text();

                if (selectedCategory) {
                    console.log('선택된 카테고리:', selectedCategory);
                    $("#exampleModal").modal('hide');

                    var newItem = $("<li class='list-group-item d-flex justify-content-between align-items-center' id='providedServiceItem'>" + selectedCategory + "<button class='btn btn-sm btn-secondary ml-auto' onclick='removeService(this)' style='display: inline-block;'>삭제</button></li>");

                    newItem.find("button").click(function () {
                        newItem.remove();
                    });

                    $(".list-group-provided-services").append(newItem);
                } else {
                    console.log('카테고리를 선택하세요.');
                }
            } else {
                alert('서비스는 최대 ' + (maxServices-1) + '개까지만 추가할 수 있습니다.');
            }
        });

        // list-group 아이템에 대한 클릭 이벤트 핸들러 추가하여 "selected" 클래스를 토글함
        $(".list-group-item").click(function () {
            // 모든 항목에서 "selected" 클래스 제거
            $(".list-group-item").removeClass("selected");

            // 클릭된 항목에 "selected" 클래스 추가
            $(this).addClass("selected");
        });

        // 수정 버튼 클릭 시 처리
        $("#editBtn4").click(function () {
            // 수정 버튼 클릭 시 처리
            $(this).addClass("d-none");
            $("#saveBtn4").removeClass("d-none");
            $(".deleteBtn").addClass("d-none");
            // 수정 모드일 때 입력창 나타남
            $(".list-group-provided-services .btn-secondary").attr("disabled", false).show();
            // 서비스 추가 버튼 나타남
            $(".list-group-item .categoryBtn").show();
        });

        // 저장 버튼 클릭 시 처리
        $("#saveBtn4").click(function () {
            // 저장 버튼 클릭 시 처리
            $("#editBtn4").removeClass("d-none");
            $(this).addClass("d-none");
            $(".deleteBtn").removeClass("d-none");
            // 저장 모드일 때 입력창 사라짐
            $(".list-group-provided-services .btn-secondary").attr("disabled", true).hide();
            // 서비스 추가 버튼 사라짐
            $(".list-group-item .categoryBtn").hide();
        });

        // 서비스 삭제 버튼 클릭 시 처리
        $(".deleteBtn").click(function () {
        	
            $(this).closest("li").remove();
        });
    });

    // 제공 서비스 섹션에서 삭제 버튼 클릭 시 해당 li 제거
    //function removeService(button) {
    //    $(button).closest("li").remove();
    //}
    
    
 // 선택된 값이 클릭되었을 때 호출되는 함수
  var active_detailcategory1, active_detailcategory2, active_detailcategory3;
   function selectCategory(selectedValue) {
       // 변수에 값이 할당되어 있지 않으면 할당
       if (!active_detailcategory1) {
       	active_detailcategory1 = selectedValue;
       } else if (!active_detailcategory2) {
       	active_detailcategory2 = selectedValue;
       } else if (!active_detailcategory3) {
       	active_detailcategory3 = selectedValue;
       }

   }
 $(document).ready(function () {
	 
    $("#saveBtn4").click(function () {
        // 콘솔에 선택된 카테고리 목록 출력
        console.log("선택된 카테고리1:", active_detailcategory1);
        console.log("선택된 카테고리2:", active_detailcategory2);
        console.log("선택된 카테고리3:", active_detailcategory3);

        // 기존 카테고리 정보 가져오기
        //var cate1 = "${cate1}";  // 기존의 카테고리 정보를 서버에서 받아오는 방식으로 수정
        //var cate2 = "${cate2}";
        //var cate3 = "${cate3}";
        
        //console.log("가져온 카테고리들들들:", cate1, cate2, cate3);

        // JSON 형식으로 변환
        var jsonData = JSON.stringify({
            active_detailcategory1: active_detailcategory1,
            active_detailcategory2: active_detailcategory2,
            active_detailcategory3: active_detailcategory3,   
            pro_id: "${param.id}"
        });

        // Ajax를 사용하여 서버에 업데이트 요청 보내기
        $.ajax({
            type: "POST",
            url: "${root}/pro/expert_modifyCategory",
            contentType: "application/json",
            data: jsonData,
            success: function (response) {
                console.log("업데이트 성공:", response);
                // 성공적으로 업데이트되면 원하는 동작을 수행할 수 있습니다.
            },
            error: function (error) {
                console.error("업데이트 실패:", error);
                // 업데이트 실패 시 에러 처리 로직을 추가할 수 있습니다.
            }
        });

        // 선택된 카테고리 배열 초기화
       // selectedCategories = [];
    });
}); 
 
    
    
//카테고리 삭제 버튼....

$(document).ready(function () {
    $(".removeBtn1").on("click", function () {
        var listItem = $(this).closest("li"); // 클릭한 버튼의 부모 <li> 요소 찾기
        var categoryId = listItem.attr("id"); // 부모 <li> 요소의 ID 가져오기
        handleRemoveBtn1(categoryId, listItem); // 함수명 수정
    });
});

function handleRemoveBtn1(categoryId, buttonElement) {
    // AJAX POST 요청 보내기
    $.ajax({
        type: "POST",
        url: "${root}/pro/expert_remove_category1", // 실제 서버 엔드포인트로 교체
        data: JSON.stringify({
            categoryId: categoryId,
            pro_id: "${param.id}"
        }), // 오류 수정: 오브젝트를 제대로 닫음
        contentType: "application/json", // 추가: 서버에게 JSON 데이터를 보내고 있다고 알려줌
        success: function (response) {
            // 성공적인 응답 처리
            console.log("카테고리가 성공적으로 삭제되었습니다");

            // li 요소 찾기
            var listItem = $(buttonElement).closest("li");

            // li 요소 제거
            listItem.remove();

            // 여기에서 UI를 업데이트하거나 다른 작업을 수행할 수 있습니다
        },
        error: function (error) {
            // 오류 응답 처리
            console.error("카테고리 삭제 오류:", error);
        }
    });
}

//2번
$(document).ready(function () {
    $(".removeBtn2").on("click", function () {
        var listItem = $(this).closest("li"); // 클릭한 버튼의 부모 <li> 요소 찾기
        var categoryId = listItem.attr("id"); // 부모 <li> 요소의 ID 가져오기
        handleRemoveBtn1(categoryId, listItem); // 함수명 수정
    });
});

function handleRemoveBtn2(categoryId, buttonElement) {
    // AJAX POST 요청 보내기
    $.ajax({
        type: "POST",
        url: "${root}/pro/expert_remove_category2", // 실제 서버 엔드포인트로 교체
        data: JSON.stringify({
            categoryId: categoryId,
            pro_id: "${param.id}"
        }), // 오류 수정: 오브젝트를 제대로 닫음
        contentType: "application/json", // 추가: 서버에게 JSON 데이터를 보내고 있다고 알려줌
        success: function (response) {
            // 성공적인 응답 처리
            console.log("카테고리가 성공적으로 삭제되었습니다");

            // li 요소 찾기
            var listItem = $(buttonElement).closest("li");

            // li 요소 제거
            listItem.remove();

            // 여기에서 UI를 업데이트하거나 다른 작업을 수행할 수 있습니다
        },
        error: function (error) {
            // 오류 응답 처리
            console.error("카테고리 삭제 오류:", error);
        }
    });
}

//3번
$(document).ready(function () {
    $(".removeBtn3").on("click", function () {
        var listItem = $(this).closest("li"); // 클릭한 버튼의 부모 <li> 요소 찾기
        var categoryId = listItem.attr("id"); // 부모 <li> 요소의 ID 가져오기
        handleRemoveBtn1(categoryId, listItem); // 함수명 수정
    });
});

function handleRemoveBtn3(categoryId, buttonElement) {
    // AJAX POST 요청 보내기
    $.ajax({
        type: "POST",
        url: "${root}/pro/expert_remove_category3", // 실제 서버 엔드포인트로 교체
        data: JSON.stringify({
            categoryId: categoryId,
            pro_id: "${param.id}"
        }), // 오류 수정: 오브젝트를 제대로 닫음
        contentType: "application/json", // 추가: 서버에게 JSON 데이터를 보내고 있다고 알려줌
        success: function (response) {
            // 성공적인 응답 처리
            console.log("카테고리가 성공적으로 삭제되었습니다");

            // li 요소 찾기
            var listItem = $(buttonElement).closest("li");

            // li 요소 제거
            listItem.remove();

            // 여기에서 UI를 업데이트하거나 다른 작업을 수행할 수 있습니다
        },
        error: function (error) {
            // 오류 응답 처리
            console.error("카테고리 삭제 오류:", error);
        }
    });
}

//활동 지역(head쪽 script)
$(document).ready(function () {
//저장 버튼 클릭 시
   $("#saveBtn5").click(function() {
       // 활동 지역 정보 가져오기
       var selectedLocation = $("#locationContent").text();
   
       // AJAX 요청을 사용하여 서버로 데이터 전송
       $.ajax({
           type: "POST",
           url: "${root}/pro/expert_modify2/",
           contentType: "application/json",
           data: JSON.stringify({ active_location: selectedLocation, pro_id:"${param.id}" }),
           success: function(response) {
               // 성공 시 서버 응답 처리
               console.log(response);
           },
           error: function(error) {
               // 오류 시 처리
               console.error("오류:", error);
           }
       });
   });
});

//일류 지역 수정.....
$(document).ready(function() {
    // 페이지가 로드될 때 데이터를 가져오는 함수 호출

function loadData() {
    $.ajax({
        url: '${root}/pro/expert/events', // 위에서 설정한 엔드포인트로 요청을 보냅니다.
        method: 'GET',
        dataType: 'json',
        success: function(data) {
            // 성공적으로 데이터를 받아왔을 때의 처리
            console.log('데이터:', data); // 데이터를 콘솔에 출력
            
         // pro_detailed_introduction 값을 콘솔에 출력
             console.log('pro_detailed_introduction:', data[0].pro_detailed_introduction);
            console.log('pro_id: ' + data[0].pro_id);

            // 여기서 data를 사용하여 각 부분에 데이터를 채웁니다.
            // 활동 지역
            $('#locationContent').text(data[0].active_location);
            //$('#sample6_address').val(data.active_location);
            //$('#sample6_extraAddress').val(data.activityArea.extraAddress);

            // 나머지 부분들도 유사한 방식으로 데이터를 채워 넣어주면 됩니다.

            // 예시: 이동 가능 거리
            $('.content').text(data.movable_distance);

            // 자격증 및 기타 서류 등록 정보 - 여기에 자유롭게 추가

            // 고수 서비스 상세설명
             $('#descriptionContent').html(data[0].pro_detailed_introduction);

            // 가격
            $('#priceContent').text(data[0].price);
            
           
        },
        error: function(err) {
            console.error('데이터 로딩 중 오류 발생:', err);
        }
    });
}
    
loadData();
});


$(document).ready(function() {
    // 페이지가 로드될 때 데이터를 가져오는 함수 호출

function loadData() {
    $.ajax({
        url: '${root}/pro/expert/events', // 위에서 설정한 엔드포인트로 요청을 보냅니다.
        method: 'GET',
        dataType: 'json',
        success: function(data) {
            // 성공적으로 데이터를 받아왔을 때의 처리
            console.log('데이터:', data); // 데이터를 콘솔에 출력
            
         // pro_detailed_introduction 값을 콘솔에 출력
             console.log('pro_detailed_introduction:', data[0].pro_detailed_introduction);
            console.log('pro_id: ' + data[0].pro_id);

            // 여기서 data를 사용하여 각 부분에 데이터를 채웁니다.
            // 활동 지역
            $('#sample6_address').val(data.activity_region);
            //$('#sample6_extraAddress').val(data.activityArea.extraAddress);

            // 나머지 부분들도 유사한 방식으로 데이터를 채워 넣어주면 됩니다.

            // 예시: 이동 가능 거리
            $('.content').text(data.movable_distance);

            // 자격증 및 기타 서류 등록 정보 - 여기에 자유롭게 추가

            // 고수 서비스 상세설명
          	$('#descriptionContent').html(data[0].pro_detailed_introduction);

            // 가격
            $('#priceContent').text(data[0].price);
            
           
        },
        error: function(err) {
            console.error('데이터 로딩 중 오류 발생:', err);
        }
    });
}
    
loadData();
});


</script>

</head>
<!-- -->
<body>
<c:import url="/WEB-INF/views/include/header.jsp" />
    
    <div class="container mt-5"> <!-- 0.완성도 -->
        <div class="row justify-content-center">
            <div class="col-md-6 section-divider">
				<!-- <div class="row">
					<div class="col-md-2 Subtitle">완성도</div>
    				<div class="col-md-10" style="font-size: 20px; font-weight: bold; color: #85BCEB; ">15%</div>
				</div> -->
				<div class="row">
	               <!--  <div class="progress" role="progressbar" aria-label="Basic example" aria-valuenow="0"
	                     aria-valuemin="0" aria-valuemax="100" style="padding: 0;">
	                    <div class="progress-bar" style="width: 15%; border-radius: 10px; background-color: #85BCEB;"></div>
	                </div> -->
	            </div>
	            <p></p>
	            <p></p>
	            <p></p>
			</div>
		</div>
	</div>
	
	<div class="container mt-3 d-flex justify-content-center"> <!-- 1.프로필 -->
	    <div class="col-md-6">
	        <div class="row">
	            <div class="col-md-4">
	                <form:form action="${root }/pro/profileImg_pro" method="post" modelAttribute="profileImgExpertBean" enctype="multipart/form-data">
                  <form:hidden path="pro_id" />
                  <div class="profilecontainer"
                     style="margin-top: 8%; margin-bottom: 8%; position: relative;">
                     
                     <c:choose>
                        <c:when test="${profileImgInfo == null }">
                           <img class="uploaded-image" id="profile-image"
                              src="../image/user-solid.svg" alt="프로필 이미지"
                              style="width: 200px; height: 200px; border-radius: 30px; position: relative; border: 1px solid #F3F3F3; padding: 15px;3">
                        </c:when>
                        <c:otherwise>
                           <img class="uploaded-image" id="profile-image"
                              src="${root }/upload/${profileImgInfo}" alt="프로필 이미지"
                              style="width: 200px; height: 200px; border-radius: 30px; position: relative; border: 1px solid #F3F3F3;">
                        </c:otherwise>
                     </c:choose>
                     
                     
                     <form:hidden path="certification_documents_images" />
                     <label id="profile-btn" for="certification_documents_images"
                        style="width: 40px; height: 40px; border: 1px solid #F3F3F3; position: absolute; margin-left:160px; margin-top: -40px; border-top-left-radius: 20px; border-bottom-right-radius: 20px; background-color: #d2d2d2; padding: 5px;">
                        <i class="bi bi-camera fs-5"></i>
                     </label>
                     <form:input path="upload_file" type="file" name="profile-myfile"
                        id="profile-myfile" accept="image/*" style="display: none;" />
                  </div>
                  <form:button class="ms-3 btn btn-light" style="width:170px;" >프로필 이미지 수정</form:button>
               </form:form>
	            </div>
	            
               </div>
			</div>
		</div>
	</div>
	
	<div class="container mt-5 d-flex justify-content-center"> <!-- 2.아숨 활동명 -->
	    <div class="col-md-6 section-divider">
	        <div class="row">
	            <span class="col Subtitle">아숨 활동명</span>
	            <div class="col text-end">
	                <button type="button" class="InvisibleButton AfterMD" id="editBtn1">수정</button>
	                <button type="button" class="d-none InvisibleButton BeforeMD" id="saveBtn1">저장</button>
	            </div>
	        </div>
	        <p></p>
	        <div id="descriptionContainer1">
	            <p class="content" id="name_content">${pro_name}</p>
	        </div>
	        <div id="editContainer1" class="d-none">
                <div class="d-flex justify-content-between">
                    <label class="AfterMD" for="editTextArea1">이름 또는 업체명을 입력해주세요</label>
                    <div class="text-muted charCount" style="color: #B5B5B5; font-size: 14px;">
                        <span id="charCount1" style="color: #85BCEB;">0&nbsp;</span>/30자
                    </div>
                </div>
                <input class="form-control" maxlength="30" id="editTextArea1" rows="1"
                    placeholder="이름 또는 업체명을 입력해주세요" oninput="countChars('editTextArea1', 'charCount1')"></input>
	        <p></p>
	        <p></p>
			</div>
		</div>
	</div>
	
	<div class="container mt-3 d-flex justify-content-center"> <!-- 4.제공 서비스 -->
		<div class="col-md-6 section-divider">
			<div class="row">
				<span class="col Subtitle">제공 서비스</span>
				<div class="col text-end">
	                <button type="button" class="InvisibleButton AfterMD" id="editBtn4">수정</button>
	                <button type="button" class="d-none InvisibleButton BeforeMD" id="saveBtn4">저장</button>
	            </div>
			</div>
			<p></p>
			<div>
			    <ul class="list-group list-group-provided-services" id="providedServicesList">
				    <!-- 서비스 추가 버튼은 무조건 첫 번째로 나오도록 유지 -->
				    <li class="list-group-item d-flex justify-content-between align-items-center">
				        <button type="button" class="btn btn-outline-primary categoryBtn"
				                data-bs-toggle="modal" data-bs-target="#exampleModal">서비스 추가</button>
				    </li>
				
				    <!-- 각 서비스 항목에는 삭제 버튼이 따라오도록 수정 -->
				    <c:if test="${not empty cate1}">
                    <li class="list-group-item d-flex justify-content-between align-items-center cate" id="selectCategory1">
                        ${cate1 }
                        <button class="btn btn-sm btn-secondary removeBtn1" onclick="handleRemoveBtn1('selectCategory1', this)">삭제</button>
                    </li>
                </c:if>

                <c:if test="${not empty cate2}">
                    <li class="list-group-item d-flex justify-content-between align-items-center cate" id="selectCategory2">
                        ${cate2 }
                        <button class="btn btn-sm btn-secondary removeBtn2" onclick="handleRemoveBtn2('selectCategory2', this)">삭제</button>
                    </li>
                </c:if>

                <c:if test="${not empty cate3}">
                    <li class="list-group-item d-flex justify-content-between align-items-center cate" id="selectCategory3">
                        ${cate3 }
                        <button class="btn btn-sm btn-secondary removeBtn3" onclick="handleRemoveBtn3('selectCategory3', this)">삭제</button>
                    </li>
                </c:if>
				</ul>
			</div>

			<p></p>
		</div>
	</div>
	
	<!-- 카테고리 모달 -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-scrollable">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">서비스 추가</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="accordion" id="categoryAccordion">
					<script> 
					    $.each(categoryData, function(cate, districts) {
					        document.write('<div class="accordion-item">');
					        document.write('<h2 class="accordion-header">');
					        document.write('<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#' + cate + '">' + cate + '</button>');
					        document.write('</h2>');
					        document.write('<div id="' + cate + '" class="accordion-collapse collapse" data-bs-parent="#categoryAccordion">');
					        document.write('<ul class="list-group">');
					        $.each(districts, function(index, district) {
					        	document.write('<button type="button" class="list-group-item list-group-item-action selectedd" onclick="selectCategory(\'' + district + '\')">' + district + '</button>');
					        });
					        document.write('</ul></div></div>');
					    });
					 
					</script>

						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
						<button type="button" class="btn btn-primary" data-bs-dismiss="modal" id="selectCategoryBtn">선택</button>
					</div>
				</div>
			</div>
		</div>
	
	<div class="container mt-3 d-flex justify-content-center">   <!-- 5.활동 지역 -->
          <div class="col-md-6 section-divider">
              <div class="row">
                  <span class="col Subtitle">활동 지역</span>
                  <div class="col text-end">
                      <button type="button" class="InvisibleButton AfterMD" id="editBtn5">수정</button>
                      <button type="button" class="d-none InvisibleButton BeforeMD" id="saveBtn5">저장</button>
                  </div>
              </div>
              <p></p>
              <p id="locationContent">${location }</p>
              <p></p>
          </div>
      </div>
      
      <!-- 지역 모달 -->
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

	
	

	<div class="container mt-3 d-flex justify-content-center"> <!-- 8. 고수 서비스 상세설명 -->
	    <div class="col-md-6 section-divider">
	        <div class="row">
	            <span class="col Subtitle">일류 서비스 상세설명</span>
	            <div class="col text-end">
	                <button type="button" class="InvisibleButton AfterMD" id="editBtn2">수정</button>
	                <button type="button" class="d-none InvisibleButton BeforeMD" id="saveBtn2">저장</button>
	            </div>
	        </div>
	        <p></p>
	        <div id="descriptionContainer2">
	            <p class="content" id="descriptionContent"></p>
	        </div>
	        <div id="editContainer2" class="d-none">
	            <div class="d-flex justify-content-between">
	                <label class="AfterMD" for="editTextArea2">고수님의 서비스에 대한 상세설명을 입력해주세요</label>
	                <div class="text-muted charCount" style="color: #B5B5B5; font-size: 14px;">
						<span id="charCount2" style="color: #85BCEB;">0&nbsp;</span>/100 자
					</div>
	            </div>
	            <textarea class="form-control" maxlength="100" id="editTextArea2" rows="3" placeholder="고수님의 장점과 함께 서비스 특징, 서비스 제공 방법, 준비사항을 자세히 적어주세요!"></textarea>
	        </div>
	        <p></p>
	    </div>
	</div>
	
	<div class="container mt-3 d-flex justify-content-center"> <!-- 9. 가격 -->
	    <div class="col-md-6 section-divider">
	        <div class="row">
	            <span class="col Subtitle">가격</span>
	            <div class="col text-end">
	                <button type="button" class="InvisibleButton AfterMD" id="editBtn3">수정</button>
	                <button type="button" class="d-none InvisibleButton BeforeMD" id="saveBtn3">저장</button>
	            </div>
	        </div>
	        <p></p>
	        <div id="descriptionContainer3">
	            <p id="priceContent" class="content"></p>
	        </div>
	        <div id="editContainer3" class="d-none">
	            <div class="d-flex justify-content-between">
	                <label class="AfterMD" for="editTextArea3">고수님의 서비스에 대한 합당한 가격을 적어주세요</label>
	                <div class="text-muted charCount" style="color: #B5B5B5; font-size: 14px;">
	                    <span id="charCount3" style="color: #85BCEB;">0&nbsp;</span>/100 자
	                </div>
	            </div>
	            <textarea class="form-control" maxlength="100" id="editTextArea3" rows="3" placeholder="고객이 알아야 할 가격 정책을 입력해 주세요	예) 예약금 10,000원, 환불정책 등"></textarea>
	        </div>
	        <p></p>
	    </div>
	</div>
	
	<div class="container mt-3 d-flex justify-content-center"> <!-- 7.자격증 및 기타 서류 등록 -->
          <div class="col-md-6 section-divider">
         <div class="row">
            <span class="col Subtitle">자격증 및 기타 서류 등록</span>
            <div class="review_textExplain Explanation">자격증 및 기타 서류(최대 5장까지 가능합니다.)</div>
         </div>
         <div class="rounded-3 p-3 border" style="background-color: #D2D2D2; text-align: center;">
            <i class="bi bi-exclamation-circle">&nbsp;개인/민감 정보를 삭제 후 등록해야 하며, 허위정보에 대한 모든 책임은 본인에게 있습니다.</i>
         </div>

         <div class="commnuity-select" style="display: flex; align-items: center;"> 
            <form:form id="uploadForm" action="${root }/pro/image_pro" method="post" modelAttribute="imageExpertBean" enctype="multipart/form-data" style="width: 100%;">     
                <form:hidden path="pro_id"/> 
               <div style="width: 100%; display: flex; flex-direction: row; justify-content: space-between;">
                  <div style="display: flex; flex-direction: row;">
                     <div class="colllll"> 
                        <input type="file" class="form-control col-2"
                           id="inputGroupFile04" name="uploadFiles" style="display: none;"
                           accept="image/*" multiple="true" /> 
                        <form:label path="pro_profile_image" for="inputGroupFile04" class="form-control col-2 btn">
                           <i class="bi bi-camera-fill"></i> <!-- 카메라 아이콘(사진 첨부) -->
                        </form:label>
                     </div>
                     <div class="selected-image" style="display: flex; flex-direction: row;">
                     
	                     <c:if test="${imageInfo != null }">
	                        <c:forEach var="image" items="${fn:split(imageInfo, ',') }" varStatus="loop">
	                           <img src="${root }/upload/${image}" style="width: 60px; height: 60px; border-radius: 10px; margin-right: 10px; border: 1px solid lightgray;"/>
	                        </c:forEach>
	                     </c:if>
                     </div> 
                  </div> 
                  <div>
                     <form:button type="submit" class="InvisibleButton AfterMD" style="margin-top: 22px;">
                     등록
                        </form:button>
                  </div>
               </div>
            </form:form> 
         </div>
      </div>
   </div>
	
	<div class="container mt-3 d-flex justify-content-center"> <!-- 10.경력 -->
		<div class="col-md-6 section-divider">
			<div class="row">
				<span class="col Subtitle">경력</span>
				<div class="col text-end">
					<button type="button" class="InvisibleButton AfterMD" onclick="location.href='${root}/pro/career'">등록</button>
				</div>
			</div>
			
			<c:forEach var="career" items="${careerList}">
				<div class="content mt-3">
					<div class="period mb-3">
					 	총경력 ${career.total_experience_period  }년
					</div>
					<div class="row">
						<div class="col career_title fw-bold"> 
							${career.career_title } 
						</div>
						<div class="col text-end">
							<a href="${root }/pro/career_modify?career_id=${career.career_id}" style="text-decoration: none; font-size: 13px;"> 수정</a>
							<a href="${root }/pro/career_delete?career_id=${career.career_id}" style="text-decoration: none; font-size: 13px; color: red;"> 삭제</a>
						</div>
					</div>
					
					<div class="career_time" style="font-size: 13px;">
						${career.startYear }년 ${career.startMonth }월 - ${career.endYear }년 ${career.endMonth }월
					</div>
					<div class="career_content" style="color: gray;">
						${career.detailed_introduction }
					</div>
					<hr />
				</div>
			</c:forEach>
			
		</div>
	</div>
	
	<div class="container mt-3 d-flex justify-content-center"> <!-- 11.학력 -->
		<div class="col-md-6 section-divider">
			<div class="row">
				<span class="col Subtitle">학력</span>
				<div class="col text-end">
					<button type="button" class="InvisibleButton BeforeMD" onclick="location.href='${root}/pro/Education'">등록하기</button>
				</div>
			</div>
			
			<div class="content mt-3 row">
			    <c:forEach var="education" items="${educationList}">
			        <div class="col-8 float">
			            <div class="schoolname fw-bold mt-3">
			                ${education.school_name}
			            </div>
			            <div class="school-time" style="font-size: 13px;">
			                ${education.admissionYear}년 ${education.admissionMonth}월 - ${education.graduationYear}년 ${education.graduationMonth}월
			            </div>
			            <div class="schoolmajor" style="color: gray;">
			                ${education.major_name}
			            </div>
			        </div>
			        <div class="ms-auto col-4 text-center">
			            <img src="${root}/eduUpload/${education.evidence_image}" class="feed-img" style="width: 80px; height: 80px; border-radius: 8px;" alt="이미지"/>
			        </div>
			        
			        <div class="mt-2">
		                <div class="col text-end">
							<a href="${root }/pro/education_modify?education_id=${education.education_id}" style="text-decoration: none; font-size: 13px;" class="me-2"> 수정</a>
							<a href="${root }/pro/education_delete?education_id=${education.education_id}" style="text-decoration: none; font-size: 13px; color: red;"> 삭제</a>
						</div>
		               
		            </div>
		            
			        <hr />
			    </c:forEach>
			</div>
			
			
			
			<p></p>
		</div>
	</div>
	
	<div class="container mt-3 d-flex justify-content-center"> <!-- 12.포트폴리오 -->
		<div class="col-md-6 section-divider">
			<div class="row">
				<span class="col Subtitle">포트폴리오</span>
				<div class="col text-end">
					<button class="InvisibleButton BeforeMD" onclick="location.href='${root}/pro/Portfolio?id=${param.id }'">등록하기</button>
				</div>
			</div>
			<p></p> 
			<c:forEach var="obj" items="${portfoliList }"> 
				 <c:if test="${obj.inspectionNY ==1 }">
					<hr>
					<div class="portfolio-feed" style="cursor:pointer ;" >
						<div class="row">
							<div class="col-10"> 
								<div class="col">
									<div class="row-3">
										서비스 종류:${obj.service_type } 
									</div>
									<div class="row-3">
										제목: ${obj.portfolio_title }  
									</div>
									<div class="row-3 detailed-content">
										상세 내용:${obj.detailed_introduction }
									</div>
								</div> 
							</div>
							  <c:if test="${obj.detailed_images != null}">
								<c:forEach var="portfolio_img" items="${fn:split(obj.detailed_images, ',')}" varStatus="loop">
									<c:if test="${loop.index == 0}"> 
										<div class="col-2"> 
	  										<img src="${root}/portfolio/${portfolio_img}" class="feed-img" style="width: 100px; height: 100px; border-radius: 8px;" alt="이미지">
										</div>
									</c:if> 
								</c:forEach>
							</c:if>	  		
							<button type="button" class="InvisibleButton AfterMD" onclick="location.href='${root}/pro/Portfolio_modify?portfolio_id=${obj.portfolio_id }'">수정</button>
						</div>
					</div> 
				</c:if> 
			</c:forEach>
			<p></p>
		</div>
	</div>
	
	
	
	

<c:import url="/WEB-INF/views/include/footer.jsp" /> <!-- 푸터-->

<!-- -----script 영역------ -->


<!-- 프로필 섹션 스크립트 -->
<script>
    /* window.onload = function () {
        document.getElementById('profile-image').src = '../image/1.png';
    }; */

    document.getElementById('profile-btn').addEventListener('click', function () {
        document.getElementById('profile-myfile').click();
    });

    document.getElementById('profile-myfile').addEventListener('change', function () {
        var reader = new FileReader();
        reader.onload = function (e) {
            document.getElementById('profile-image').src = e.target.result;
        };
        reader.readAsDataURL(this.files[0]);
    });
</script>

<!--도로주소명API-->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
	
<!-- 서류 섹션 스크립트 -->
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

                /* const removeButton = $('<button>').text('삭제').addClass('remove-button');
                removeButton.on('click', function () {
                    img.remove();
                    removeButton.remove();
                }); 

                img.after(removeButton);*/
            };

            reader.readAsDataURL(file);
        }
    });
});
</script>

 <script> // 2. 아숨 활동명
        // input 글자수 세기
        function countChars(textAreaId, charCountId) {
            var textarea = document.getElementById(textAreaId);
            var charCountSpan = document.getElementById(charCountId);
            var charCount = textarea.value.length;
            charCountSpan.textContent = charCount;
        }

        // 이벤트 리스너 등록
        document.getElementById('editBtn1').addEventListener('click', function () {
            // "수정" 버튼 클릭 시 처리
            document.getElementById('descriptionContainer1').classList.add('d-none');
            document.getElementById('editContainer1').classList.remove('d-none');
            document.getElementById('editTextArea1').value = document.getElementById('descriptionContainer1').innerText.trim();
            document.getElementById('editTextArea1').focus();
            document.getElementById('editBtn1').classList.add('d-none');
            document.getElementById('saveBtn1').classList.remove('d-none');
            countChars('editTextArea1', 'charCount1');
        });

        document.getElementById('saveBtn1').addEventListener('click', function () {
            // "저장" 버튼 클릭 시 처리
            var editedText = document.getElementById('editTextArea1').value;
            document.getElementById('descriptionContainer1').classList.remove('d-none');
            document.getElementById('editContainer1').classList.add('d-none');
            document.getElementById('descriptionContainer1').getElementsByTagName('p')[0].innerText = editedText;
            document.getElementById('editBtn1').classList.remove('d-none');
            document.getElementById('saveBtn1').classList.add('d-none');

            // 최대 글자 수 초과 시 입력 막기
            var maxLength = parseInt(document.getElementById('editTextArea1').getAttribute('maxlength'));
            if (editedText.length > maxLength) {
                document.getElementById('editTextArea1').value = editedText.substring(0, maxLength);
            } 
            countChars('editTextArea1', 'charCount1');
        });

        document.addEventListener('DOMContentLoaded', function () {
            // 초기에 텍스트 길이를 가져와서 표시
            var initialText = document.getElementById('descriptionContainer1').innerText.trim();
            var maxLength = parseInt(document.getElementById('editTextArea1').getAttribute('maxlength'));
            var initialCharCount = initialText.length;
            document.getElementById('charCount1').innerText = initialCharCount + '/' + maxLength + ' 자';

            document.getElementById('editTextArea1').addEventListener('input', function () {
                countChars('editTextArea1', 'charCount1');
            });
        });
</script>

<script> //제공 서비스
   
</script>

<script> // 활동 지역(아래쪽 script)
$(function () {
    // 수정 버튼 클릭 시 처리
    $("#editBtn5").click(function () {
        // 수정 버튼 클릭 시 처리
        $(this).addClass("d-none");
        $("#saveBtn5").removeClass("d-none");
        // 수정 모드일 때 입력창 나타남
        $("#locationModal").modal('show');
    });

    // 저장 버튼 클릭 시 처리
    $("#saveBtn5").click(function () {
        // 저장 버튼 클릭 시 처리
        $("#editBtn5").removeClass("d-none");
        $(this).addClass("d-none");
        // 저장 모드일 때 입력창 사라짐
        $("#locationContent").show();
    });

    // list-group 아이템에 대한 클릭 이벤트 핸들러 추가하여 "selected" 클래스를 토글함
    $(".list-group-item").click(function () {
        // 모든 항목에서 "selected" 클래스 제거
        $(".list-group-item").removeClass("selected");

        // 클릭된 항목에 "selected" 클래스 추가
        $(this).addClass("selected");
    });

    // selectLocationBtn 버튼에 대한 클릭 이벤트 핸들러 추가
    $("#selectLocationBtn").click(function () {
        // 선택된 리스트 항목의 텍스트 내용 가져오기
        var selectedLocation = $(".list-group-item.selected").text();

        // 활동 지역이 선택되었는지 확인
        if (selectedLocation) {
            console.log('선택된 활동 지역:', selectedLocation);
            // 모달 닫기
            $("#locationModal").modal('hide');

            // 선택된 활동 지역을 페이지에 표시
            $("#locationContent").text(selectedLocation);
        } else {
            console.log('활동 지역을 선택하세요.');
        }
    });
});

</script>
    
<script> // 5. 고수 서비스 상세설명
    // textarea 글자수 세기
    function countChars(textAreaId, charCountId) {
        var textarea = document.getElementById(textAreaId);
        var charCountSpan = document.getElementById(charCountId);
        var charCount = textarea.value.length;
        charCountSpan.textContent = charCount;
    }

    // 이벤트 리스너 등록
    document.getElementById('editBtn2').addEventListener('click', function () {
        // "수정" 버튼 클릭 시 처리
        document.getElementById('descriptionContainer2').classList.add('d-none');
        document.getElementById('editContainer2').classList.remove('d-none');
        document.getElementById('editTextArea2').value = document.getElementById('descriptionContainer2').innerText.trim();
        document.getElementById('editTextArea2').focus();
        document.getElementById('editBtn2').classList.add('d-none');
        document.getElementById('saveBtn2').classList.remove('d-none');
        countChars('editTextArea2', 'charCount2');
    });

    document.getElementById('saveBtn2').addEventListener('click', function () {
        // "저장" 버튼 클릭 시 처리
        var editedText = document.getElementById('editTextArea2').value;
        document.getElementById('descriptionContainer2').classList.remove('d-none');
        document.getElementById('editContainer2').classList.add('d-none');
        document.getElementById('descriptionContainer2').getElementsByTagName('p')[0].innerText = editedText;
        document.getElementById('editBtn2').classList.remove('d-none');
        document.getElementById('saveBtn2').classList.add('d-none');

        // 최대 글자 수 초과 시 입력 막기
        var maxLength = parseInt(document.getElementById('editTextArea2').getAttribute('maxlength'));
        if (editedText.length > maxLength) {
            document.getElementById('editTextArea2').value = editedText.substring(0, maxLength);
        }

        countChars('editTextArea2', 'charCount2');
    });

    document.addEventListener('DOMContentLoaded', function () {
        // 초기에 텍스트 길이를 가져와서 표시
        var initialText = document.getElementById('descriptionContainer2').innerText.trim();
        var maxLength = parseInt(document.getElementById('editTextArea2').getAttribute('maxlength'));
        var initialCharCount = initialText.length;
        document.getElementById('charCount2').innerText = initialCharCount + '/' + maxLength + ' 자';

        document.getElementById('editTextArea2').addEventListener('input', function () {
            countChars('editTextArea2', 'charCount2');
        });
    });
</script>

<script> // 8. 가격
    // textarea 글자수 세기
    function countChars(textAreaId, charCountId) {
        var textarea = document.getElementById(textAreaId);
        var charCountSpan = document.getElementById(charCountId);
        var charCount = textarea.value.length;
        charCountSpan.textContent = charCount;
    }

    // 이벤트 리스너 등록
    document.getElementById('editBtn3').addEventListener('click', function () {
        // "수정" 버튼 클릭 시 처리
        document.getElementById('descriptionContainer3').classList.add('d-none');
        document.getElementById('editContainer3').classList.remove('d-none');
        document.getElementById('editTextArea3').value = document.getElementById('descriptionContainer3').innerText.trim();
        document.getElementById('editTextArea3').focus();
        document.getElementById('editBtn3').classList.add('d-none');
        document.getElementById('saveBtn3').classList.remove('d-none');
        countChars('editTextArea3', 'charCount3');
    });

    document.getElementById('saveBtn3').addEventListener('click', function () {
        // "저장" 버튼 클릭 시 처리
        var editedText = document.getElementById('editTextArea3').value;
        document.getElementById('descriptionContainer3').classList.remove('d-none');
        document.getElementById('editContainer3').classList.add('d-none');
        document.getElementById('descriptionContainer3').getElementsByTagName('p')[0].innerText = editedText;
        document.getElementById('editBtn3').classList.remove('d-none');
        document.getElementById('saveBtn3').classList.add('d-none');

        // 최대 글자 수 초과 시 입력 막기
        var maxLength = parseInt(document.getElementById('editTextArea3').getAttribute('maxlength'));
        if (editedText.length > maxLength) {
            document.getElementById('editTextArea3').value = editedText.substring(0, maxLength);
        }

        countChars('editTextArea3', 'charCount3');
    });

    document.addEventListener('DOMContentLoaded', function () {
        // 초기에 텍스트 길이를 가져와서 표시
        var initialText = document.getElementById('descriptionContainer3').innerText.trim();
        var maxLength = parseInt(document.getElementById('editTextArea3').getAttribute('maxlength'));
        var initialCharCount = initialText.length;
        document.getElementById('charCount3').innerText = initialCharCount + '/' + maxLength + ' 자';

        document.getElementById('editTextArea3').addEventListener('input', function () {
            countChars('editTextArea3', 'charCount3');
        });
    });
</script>

 

</body>
</html>