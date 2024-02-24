<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>block</title>
<script src="${root}/script/jquery-3.4.1.min.js"></script>
<script>
	
</script> 
</head>

<body>
	<c:import url="/WEB-INF/views/include/header.jsp" />
	<!--여기까지 네비부분-->
	<!--본문-->
<div class="container">
	<center>
		<h2 style="margin-top:70px;"><strong>차단된 회원</strong></h2>
		<br />
		<input class="form-control" placeholder="이름(초성), 아이디 검색" style="width: 60%;"></input>
		
	</center>
 	<div class="container mx-auto mt-3" style="width:90%;">
			<ul class="list-group">
				<li class="list-group-item ">

					<div class="row justify-content-between mt-3">
						<div class="col-4">
							<div class="row"  >
								<div class="col-3">
									<img src="../image/logo4.png" style="height: 100px; width: 80px;" />
								</div>
								<div class="col-7  mt-3">
									<b>이름</b>
									<p><a>아이디</a></p>
								</div>
							</div>
						</div>
						<div class="col-4 ms-5  mt-3 text-end">
								<button type="button" class="btn button-custom" data-bs-toggle="modal" data-bs-target="#modals">관리</button>
						</div>
 
					</div>
 
				</li>
				<li class="list-group-item">
					
					<div class="row justify-content-between mt-3">
						<div class="col-4">
							<div class="row"  >
								<div class="col-3">
									<img src="../image/logo4.png" style="height: 100px; width: 80px;" />
								</div>
								<div class="col-7  mt-3">
									<b>이름</b>
									<p><a>아이디</a></p>
								</div>
							</div>
						</div>
						<div class="col-4 ms-5  mt-3 text-end">
								<button type="button" class="btn button-custom" data-bs-toggle="modal" data-bs-target="#modals">관리</button>
						</div>
 
					</div>
					
				</li>
				<li class="list-group-item">
					
					<div class="row justify-content-between mt-3">
						<div class="col-4">
							<div class="row"  >
								<div class="col-3">
									<img src="../image/logo4.png" style="height: 100px; width: 80px;" />
								</div>
								<div class="col-7  mt-3">
									<b>이름</b>
									<p><a>아이디</a></p>
								</div>
							</div>
						</div>
						<div class="col-4 ms-5  mt-3 text-end">
								<button type="button" class="btn button-custom" data-bs-toggle="modal" data-bs-target="#modals">관리</button>
						</div>
 
					</div>
					
				</li>
				<li class="list-group-item">
					
					<div class="row justify-content-between mt-3">
						<div class="col-4">
							<div class="row"  >
								<div class="col-3">
									<img src="../image/logo4.png" style="height: 100px; width: 80px;" />
								</div>
								<div class="col-7  mt-3">
									<b>이름</b>
									<p><a>아이디</a></p>
								</div>
							</div>
						</div>
						<div class="col-4 ms-5  mt-3 text-end">
								<button type="button" class="btn button-custom" data-bs-toggle="modal" data-bs-target="#modals">관리</button>
						</div>
 
					</div>
					
				</li>
				<li class="list-group-item">
					
					<div class="row justify-content-between mt-3">
						<div class="col-4">
							<div class="row"  >
								<div class="col-3">
									<img src="../image/logo4.png" style="height: 100px; width: 80px;" />
								</div>
								<div class="col-7  mt-3">
									<b>이름</b>
									<p><a>아이디</a></p>
								</div>
							</div>
						</div>
						<div class="col-4 ms-5  mt-3 text-end">
								<button type="button" class="btn button-custom" data-bs-toggle="modal" data-bs-target="#modals">관리</button>
						</div>
 
					</div>
					
				</li>
			</ul>
		</div>

</div>


<!-- Modal -->
<div class="modal fade" id="modals" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header mb-5">
       
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body text-center">
        <h4>차단을 해제하시겠습니까?</h4>
        
          <div class=" text-center mt-5 ">
	        <button type="button" class="btn btn-secondary " data-bs-dismiss="modal">취소</button>
	        <button type="button" class="btn button-custom" style="color: white;">해제</button>
	      </div>
	      
      </div>
    </div>
  </div>
</div>

	
<!--여기까지 본문 -->
<c:import url="/WEB-INF/views/include/footer.jsp" />

</body>

</html>