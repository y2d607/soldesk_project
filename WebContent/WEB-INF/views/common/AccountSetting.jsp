<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Account Setting</title>
<script src="${root}/script/jquery-3.4.1.min.js"></script>
 
<style>
.img-fluid {
	border-radius: 50%;
}

.profileImg {
	display: flex;
	justify-content: center;
	align-items: center;
}

.account {
	font-size: 25px;
}

.custom-hr {
	border: 1px solid #b4b8c2;
}

#modalOpenButton, #modalCloseButton {
	cursor: pointer;
}

#modalContainer {
	width: 100%;
	height: 100%;
	position: fixed;
	top: 0;
	left: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	background: rgba(0, 0, 0, 0.5); /* 불투명 배경 */
}

#modalContainer.hidden {
	display: none;
}

#modalContent {
	position: absolute;
	background-color: #ffffff;
	width: 20vw;
	height: auto;
	padding: 15px;
}
</style>
</head>
<body>
	<c:import url="/WEB-INF/views/include/header.jsp" />
	<div class="container mt-5 mb-5">
		<div class="row justify-content-center">
			<div class="col-md-6 mt-5">
				<div class="account">
					<strong>계정 설정</strong>
				</div> 
				<c:choose>
					<c:when test="${loginUserBean.userLogin ==true }">
						<div class="">
							<div class="name" style="color: #b4b8c2;">이름(아숨 활동명)</div>
							<span>${AccountModifyCom.user_name }</span>
							<hr class="custom-hr" />
						</div>
						<div class="">
							<div class="name" style="color: #b4b8c2;">이메일</div>
							<span>${AccountModifyCom.user_email }</span>
							<hr class="custom-hr" />
						</div>
						<div class="">
							<div style="color: #b4b8c2;">비밀번호</div>
							<span style="font-size: 10px;">${AccountModifyCom.user_pwd }</span>
							<hr class="custom-hr" />
						</div>

						<div class="d-grid gap-2 d-md-flex justify-content-md-center">
							<button class="btn btn-primary me-md-2" id="modalOpenButton"
								type="button"
								style="margin-top: 5%; color: #b4b8c2; border: 1px solid #b4b8c2; background-color: #ffffff">탈퇴하기</button>
							<button class="btn button-custom" type="button"
								onclick="location.href='${root}/common/AccountModify?id=${param.id }'"
								style="margin-top: 5%; color: #ffffff;">수정하기</button>
						</div>
					</c:when>
					<c:when test="${loginProuserBean.prouserLogin ==true}">
						<div class="">
							<div class="name" style="color: #b4b8c2;">이름(아숨 활동명)</div>
							<span>${ProAccountModifyCom.pro_name }</span>
							<hr class="custom-hr" />
						</div>
						<div class="">
							<div class="name" style="color: #b4b8c2;">이메일</div>
							<span>${ProAccountModifyCom.pro_email }</span>
							<hr class="custom-hr" />
						</div>
						<div class="">
							<div style="color: #b4b8c2;">비밀번호</div>
							<span style="font-size: 10px;">${ProAccountModifyCom.pro_pwd }</span>
							<hr class="custom-hr" />
						</div>

						<div class="d-grid gap-2 d-md-flex justify-content-md-center">
							<button class="btn btn-primary me-md-2" id="modalOpenButton"
								type="button"
								style="margin-top: 5%; color: #b4b8c2; border: 1px solid #b4b8c2; background-color: #ffffff">탈퇴하기</button>
							<button class="btn button-custom" type="button"
								onclick="location.href='${root}/common/AccountModify?id=${param.id }'"
								style="margin-top: 5%; color: #ffffff;">수정하기</button>
						</div>
					</c:when>
				</c:choose>
			</div>
		</div>
	</div>

	<!-- 모달창 -->
	<div id="modalContainer" class="hidden" onclick="closeModal(event)">
		<div id="modalContent">
			<p style="font-size: 24px; text-align: center; padding-top: 10%">
				<strong>정말 아숨을<br> 떠나실 건가요?
				</strong>
			</p>
			<p style="font-size: 14px; text-align: center; padding-bottom: 5%">계정
				탈퇴 시 모든 개인정보가 삭제됩니다</p>
			<div class="d-grid gap-2 d-md-flex justify-content-md-center"
				style="padding-bottom: 10%;">
				<button class="btn btn-primary me-md-2" id="modalCloseButton"
					type="button"
					style="border: 1px solid #6387A6; color: #6387A6; background-color: #fff;"
					onclick="closeModal()">취소</button>
				<button class="btn button-custom" type="button" style="color: #fff;"
				onclick="location.href='${root}/common/AccountSecession">탈퇴</button>
			</div>
		</div>
	</div>

	<c:import url="/WEB-INF/views/include/footer.jsp" />

	<script type="text/javascript">
       function moveToModifyPage(){
    	   window.location.href = '${root}/user/AccountModify';
       }
       
       const modalOpenButton = document.getElementById('modalOpenButton');
       const modalCloseButton = document.getElementById('modalCloseButton');
       const modal = document.getElementById('modalContainer');
	   
       //모달창 열기
       modalOpenButton.addEventListener('click', () => {
         modal.classList.remove('hidden');
       });
	   
       //모달창 닫기
       modalCloseButton.addEventListener('click', () => {
         modal.classList.add('hidden');
       });
       
       //모달창 외부 영역 클릭 시 모달창 닫기
       function closeModal(event) {
           if (event.target === modal) {
    	       modal.classList.add('hidden');
    	   }
       }
   </script>
</body>
</html>