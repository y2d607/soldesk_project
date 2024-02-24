<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>     
<c:set var="root" value="${pageContext.request.contextPath }"/> 
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Join</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>

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
<script>
function checkUserEmailExist(){
	var user_email = $("#user_email").val()
	console.log("user_email",user_email);
	if(user_email.length == 0){
		alert('이메일을 입력해주세요')
		return
	}//이메일을 입력하지 않았을 때
	
	$.ajax({
		url: '${root}/user/checkUserEmailExist/' + encodeURIComponent(user_email),
		type : 'get',
		dataType : 'text',
		success: function(result){
			if(result.trim()=='true'){
				alert('사용할 수 있는 이메일입니다')
				$("#userEmailExist").val('true')
			}else if(result.trim()=='false'){
				alert('사용할 수 없는 이메일입니다')
				$("#userEmailExist").val('false')
			}
		}
	})
}
function resetUserIdExist(){
	
	$("#userEmailExist").val('false')
	
}//사용자 아이디란에 입력 시 UserIdExist의 값을 false 주입ㄴ

</script>

<style>
#username, #email, #password, #confirmPassword {
	font-size: 18px;
}

.card-body {
	background-color: #C6D7E0;
}

body, div, span, h5, button, h2, p {
	font-family: 'Gothic A1' !important;
}
</style>
</head>
 
<body>
    <c:import url="/WEB-INF/views/include/header.jsp" />

    <div class="container mt-5 mb-5">
        <div class="row justify-content-center">
            <div class="col-md-5">
                <h2 class="card-title text-center mb-5 mt-5 fw-bold">
                    아숨에 오신 것을 환영합니다!
                </h2>
                <div class="card">
                    <div class="card-body" style="padding: 30px; font-size: 20px;">
                        <!-- form 태그 추가 -->
                        <form:form action="${root }/user/join_user" method="post" modelAttribute="joinUserBean">
                        	<form:hidden path="userEmailExist"/>
                            <div class="mb-3">
                                <form:label path="user_name">이름</form:label>
                                <form:input path="user_name"  autocomplete='off'   type="text" class="form-control" placeholder="사용자 이름을 입력하세요" />
                            </div>
                            <div class="mb-3 form-group">
                                <form:label path="user_email">이메일</form:label>
                                <div class="input-group">
	                                <form:input  path="user_email"  autocomplete='off'   class="form-control" placeholder="이메일 주소를 입력하세요" onkeypress="resetUserIdExist()" />
	                                <div class="input-group-append">
										<button type="button" class="btn button-custom" onclick='checkUserEmailExist()'>
											중복확인
										</button>
									</div>
								</div>
								<form:errors path="user_email" style="color:red" />
                            </div>
                            <div class="mb-3">
                                <form:label path="user_pwd">비밀번호</form:label>
								<form:password path="user_pwd" autocomplete="new-password" class="form-control" id="password" onkeyup="checkPasswordMatch()"/>
							</div>
                            <div class="mb-3">
                                <form:label path="confirmPassword">비밀번호 확인</form:label>
								<form:password path="confirmPassword" class="form-control" id="confirmPassword" onkeyup="checkPasswordMatch()"/>
								<div class="invalid-feedback">비밀번호가 일치하지 않습니다.</div>
                            </div>
                            <!-- 추가된 부분 -->
                            <div id="message"></div>

                            <div class="d-grid gap-2 mt-5">
                                <form:button class="btn button-custom py-2 fs-5" style="color: white;">가입하기</form:button>
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