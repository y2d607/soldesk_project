<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>     

<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Account Modify</title>
<script src="${root}/script/jquery-3.4.1.min.js"></script>
<script>
	
</script>
<style>
.profileContainer {
	display: flex;
	justify-content: center;
	align-items: center;
}

.profilecontainer {
	width: 100px;
	height: 100px;
	position: relative;
}

.account {
	font-size: 25px;
}

.custom-hr {
	border: 1px solid #b4b8c2;
}

#upload-btn-wrapper {
	position: relative;
	overflow: hidden;
	display: inline-block;
}

#btn {
	color: gray;
	background-color: white;
	border-radius: 50%;
	font-size: 20px;
	font-weight: bold;
	position: absolute;
	bottom: 0;
	right: 0;
	width: 32px;
	height: 32px;
}

#upload-btn-wrapper input[type=file] {
	font-size: 100px;
	position: absolute;
	left: 0;
	top: 0;
	opacity: 0;
}

#uploaded-image {
	max-width: 100%;
	height: auto;
	margin-top: 10px;
	display: block;
	position: relative;
}
</style>
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
}); 
function checkPasswordMatch() {
    var password = $("#password").val();
    var confirmPassword = $("#confirmPassword").val();

    if (password != confirmPassword) {
        $("#confirmPassword")[0].setCustomValidity("비밀번호가 일치하지 않습니다.");
    } else {
        $("#confirmPassword")[0].setCustomValidity("");
    }
}
</script>
</head>
<body>
<c:import url="/WEB-INF/views/include/header.jsp" />
	<div class="container mt-5 mb-5">
		<div class="row justify-content-center">
			<div class="col-md-6 mt-5" >
				<div class="account">
					<strong>계정 설정</strong>
				</div> 
		<c:choose> 
			<c:when test="${loginUserBean.userLogin ==true }">
				<!-- 이름 수정 공간 -->
				<form:form action="${root }/common/AccountModify_user" method="post" modelAttribute="AccountModifyCom">
					<form:label path="user_name" style="color: #b4b8c2;">이름(아숨 활동명)</form:label>
					<div class="input-group mb-3 mt-1">
						<form:input path="user_name" class="form-control" id="nameInput" name="name"
							placeholder="OOO" value="${AccountModifyCom.user_name }"/>
					</div>
					<hr class="custom-hr" /> 
				<!-- 이메일 수정 공간 -->
				<form:label type="email" path="user_email" style="color: #b4b8c2;">이메일</form:label> 
					<div class="input-group mb-3 mt-1"> 
						<form:input type="email" path="user_email" class="form-control" id="emailInput"
							name="email" placeholder="O@examile.com" value="${AccountModifyCom.user_email }" readonly='true'/>
					</div>
					<hr class="custom-hr" />
				<!-- 비밀번호 수정 공간 -->
					<%-- 
					<div class="input-group mb-3 mt-1">
						<form:label path="user_pwd"  style="color: #b4b8c2;">기존 비밀번호</form:label>
						<form:password path="user_pwd" autocomplete="new-password" class="form-control" name="existingPass"
							id="password" onkeyup="checkPasswordMatch()" placeholder="현재 비밀번호를 입력해주세요"/>
					</div> --%> 
					<form:label path="user_pwd"  style="color: #b4b8c2;">새로운 비밀번호</form:label>
					<div class="input-group mb-3 mt-1">
						<form:password path="user_pwd" class="form-control" autocomplete="new-password" id="password" onkeyup="checkPasswordMatch()"
							placeholder="영문 + 숫자 조합 8자리 이상 입력해주세요"/>
					</div>  
					<form:label path="confirmPassword" style="color: #b4b8c2;">새로운 비밀번호 확인</form:label>
					<div class="input-group mb-3 mt-1">
						<form:password path="confirmPassword" class="form-control"  id="confirmPassword" onkeyup="checkPasswordMatch()" name="newPassCheck"
							placeholder="비밀번호를 한번 더 입력해주세요"/>
						<div class="invalid-feedback">비밀번호가 일치하지 않습니다.</div>
					</div>
					<!-- 추가된 부분 -->
                        <div id="message"></div>
					<hr class="custom-hr" /> 
				<!-- 수정 완료 버튼 -->
				<div class="d-grid gap-2 d-md-flex justify-content-md-center">
					<form:button class="btn button-custom" 
						style="margin-top: 5%; color: #ffffff;">수정 완료</form:button>
				</div>
			</form:form>
			</c:when>
			<c:when test="${loginProuserBean.prouserLogin ==true  }">
				<!-- 이름 수정 공간 -->
					<form:form action="${root }/common/AccountModify_Pro" method="post" modelAttribute="ProAccountModifyCom">
						<form:label path="pro_name" style="color: #b4b8c2;">이름(아숨 활동명)</form:label>
						<div class="input-group mb-3 mt-1">
							<form:input path="pro_name" class="form-control" id="nameInput" name="name"
								placeholder="OOO" value="${ProAccountModifyCom.pro_name }"/>
						</div>
						<hr class="custom-hr" /> 
					<!-- 이메일 수정 공간 -->
					<form:label path="pro_email" style="color: #b4b8c2;">이메일</form:label> 
						<div class="input-group mb-3 mt-1"> 
							<form:input path="pro_email" class="form-control" id="emailInput"
								  placeholder="O@examile.com" value="${ProAccountModifyCom.pro_email }" readonly='true'/>
						</div>
						<hr class="custom-hr" />
					<!-- 비밀번호 수정 공간 -->
						<form:label path="pro_pwd"  style="color: #b4b8c2;">새로운 비밀번호</form:label>
						<div class="input-group mb-3 mt-1">
							<form:password path="pro_pwd" class="form-control" autocomplete="new-password" id="password" onkeyup="checkPasswordMatch()"
								placeholder="영문 + 숫자 조합 8자리 이상 입력해주세요"/>
						</div>  
						<form:label path="confirmPassword" style="color: #b4b8c2;">새로운 비밀번호 확인</form:label>
						<div class="input-group mb-3 mt-1">
							<form:password path="confirmPassword" class="form-control"  id="confirmPassword" onkeyup="checkPasswordMatch()" name="newPassCheck"
								placeholder="비밀번호를 한번 더 입력해주세요"/>
							<div class="invalid-feedback">비밀번호가 일치하지 않습니다.</div>
						</div>
						<!-- 추가된 부분 -->
	                        <div id="message"></div>
						<hr class="custom-hr" /> 
					<!-- 수정 완료 버튼 -->
					<div class="d-grid gap-2 d-md-flex justify-content-md-center">
						<form:button class="btn button-custom" 
							style="margin-top: 5%; color: #ffffff;">수정 완료</form:button>
					</div>
				</form:form>
			</c:when>
		</c:choose>
			</div>
		</div> 
</div>
	<script>
		// 페이지 로딩 시에 기본 이미지 설정
		window.onload = function() {
			document.getElementById('uploaded-image').src = '../image/1.png';
		};

		document.getElementById('btn').addEventListener('click', function() {
			document.getElementById('myfile').click();
		});

		//프로필 이미지 변경
		document
				.getElementById('myfile')
				.addEventListener(
						'change',
						function() {
							var reader = new FileReader();
							reader.onload = function(e) {
								document.getElementById('uploaded-image').src = e.target.result;
							};
							reader.readAsDataURL(this.files[0]);
						});

	 
	</script>
</body>
</html>
