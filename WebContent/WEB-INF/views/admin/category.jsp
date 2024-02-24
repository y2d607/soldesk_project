<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
   <script src="${root}/script/jquery-3.4.1.min.js"></script> 
   <link href="https://cdn.jsdelivr.net/npm/weathericons@2.1.0/css/weather-icons.css" rel="stylesheet" />
  
</head>
<style>
.selected-image {
		display: flex;
		flex-wrap: wrap;
		align-items: center;
		width: 100px;
		height: 100px;
	}

	.selected-image-item {
		position: relative;
		margin: 5px;
		width: 100px;
		height: 100px;
		border-radius: 10px;
	}

	.remove-button {
		position: absolute;
		right: 17.2%;
		height: 30%;
		background: #D9E8F5;
		color: #6387A6;;
		border: none;
		padding: 5px;
		cursor: pointer;
		width: 70px;
    	border-radius: 8px;
	}
	
	.form-group .form-control-file {
        display: none;
    }

    .form-group .form-control-label {
        width: 100%;
        color: red;
        display: flex;
        align-items: center;
        justify-content: center;
        border: 1px solid gray; /* 아이콘 테두리에 선 추가 */
        border-radius: 10px;
        cursor: pointer;
        margin-right: 40px;
        background: gray;
    }

    .form-group .form-control-label i {
        color: red;
    }

   
</style>
<script>
$(function() {
    $('#categoryImage').on('change', function (event) {
        const selectedImageDiv = $('.selected-image');

        // Count only images, not remove buttons
        if (selectedImageDiv.find('.selected-image-item:not(.remove-button)').length >= 5) {
            alert('최대 1개의 이미지까지만 선택할 수 있습니다.');
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
<body>
  <c:import url="/WEB-INF/views/admin/header.jsp" />
     
  <div id="right-panel" class="right-panel">
                    <div class="card" style="width: 100%">
                        <div class="card-header">
                            <strong class="card-title">카테고리</strong>
                        </div>
                        <div class="card-body text-center">
                            <table class="table">
                                <thead class="thead-dark">
                                    <tr>
                                      <th scope="col">#</th>
                                      <th scope="col">서비스 카테고리</th>
                                      <th scope="col">상세 카테고리</th>
                                      
                                  </tr>
                              </thead>
                              <tbody>
                               <c:forEach var="cate" items="${getDetailList}" varStatus="num">
							        <tr>
							            <th scope="row">${num.index+1 }</th>
							            <td>${cate.service_category_name}</td>
							            <td>${cate.detail_category_name}</td>
							        </tr>
							    </c:forEach>
                            </tbody>
                        </table>

                    </div>
                </div>
                
                <div class="card mb-5" style="width: 100%">
                        <div class="card-header">
                            <strong class="card-title">카테고리 추가</strong>
                        </div>
                        <div class="card-body">
                            <form:form action="${root}/admin/category_pro" method="post" modelAttribute="addCategoryBean" enctype="multipart/form-data">
			                    
			                    <!-- 옵션 -->
			                    <div class="form-group">
								    <label for="servicectg">서비스 카테고리</label>
								    <form:select path="service_category_name" class="form-control" id="serviceCategory">
								        <!-- 서비스 카테고리 옵션을 동적으로 추가 -->
								        <form:options items="${getServiceCategoryName}" itemValue="service_category_name" itemLabel="service_category_name" />
								    </form:select>
								    
								</div>
			                    
			                    <!-- 선택한 옵션을 출력할 영역 -->
								<!-- <div id="selectedOption"></div> -->
			                    
			                    <!-- 카테고리 작성 -->
			                    <div class="form-group">
							        <label for="detail_category_name">상세 카테고리</label>
							        <form:input type="text" class="form-control" id="detailCategory" path="detail_category_name" required="required" />
							    </div>
							    
							    <!-- 이미지 -->
							    <div class="row text-start">
				                    <div class="form-group mb-5 col-1 mt-5 ms-1">
				                    	<form:input type="file" path="upload_file" class="form-control-file " id="categoryImage" name="file_name" accept="image/*" multiple="true" style="display: none;" ></form:input>
				                        
				                        <form:label path="file_name" for="categoryImage" class="form-control btn col-6 ms-5 text-center" style="width: 100px; color: black; border: 1px solid black; ">
				                        	<i class="bi bi-camera-fill" style="color: gray; width: 100%"></i>
				                        </form:label>
				                    </div>
				                    
				                    <div class="selected-image col-10"></div>
			                    </div>
			                    
			                    <div class="text-center mt-3">
			                   		<form:button type="submit" class="btn btn-primary" id="addButton">추가</form:button>
			                    </div>
			                    
			                </form:form>
					
                    </div>
                </div>
          
 </div>
               

   
<div class="clearfix"></div>
    <footer class="site-footer">
        <div class="footer-inner bg-white">
            <div class="row">
                <div class="col-sm-6">
                    Copyright &copy; 2018 Ela Admin
                </div>
                <div class="col-sm-6 text-right">
                    Designed by <a href="https://colorlib.com">Colorlib</a>
                </div>
            </div>
        </div> 
    </footer>


    <script>
    // 문서가 로드된 후 실행되는 함수
    $(document).ready(function () {
        // 서비스 카테고리 선택이 변경될 때 실행되는 함수
        $('#serviceCategory').change(function () {
            // 선택한 서비스 카테고리의 값 가져오기
            var selectedCategory = $(this).val();
            
            // 콘솔에 선택한 카테고리 출력
            console.log("Selected Category: " + selectedCategory);
            
            // 선택한 카테고리를 화면에 출력할 영역에 추가 (예: #selectedOption)
            $('#selectedOption').text("Selected Category: " + selectedCategory);
        });
    });
    
    // 등록하기 버튼 클릭 시
    $('#addButton').click(function() {
        // 등록 여부 확인
        var confirmation = confirm('추가하시겠습니까?');
        if (confirmation) {
            // 폼 제출
            $('#addCategoryBean').submit();
        } else {
             return false; // 폼 제출 막기
        }
    });
</script>
</body>
</html>