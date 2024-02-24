<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>completion</title>
<script src="${root}/script/jquery-3.4.1.min.js"></script>
<script>
	$(function() {
		
	})
</script>
<style>
#a_comment-board-title:hover {
	color: #fff;
}

.completed {
	color: red;
	font-size: 20px;
}

.process {
	color: blue;
	font-size: 20px;
}

table {
	width: 900px;
	border-collapse: collapse;
	margin-left: auto;
	margin-right: auto;
	background-color: #E2E2E2;
	color: gray;
}

th {
	padding: 8px;
	text-align: left;
	padding-left: 150px;
}

.arrow {
	font-size: 29px;
}
</style>
</head>

<body>
	<!-- 네비부분 -->

<c:import url="/WEB-INF/views/include/header.jsp" />
	<!--여기까지 네비부분-->
	<!--본문-->
	<center>
		<div>
			<h1 style="margin-top: 70px;">완료 내역</h1>
			<br />

			<table class="tableeee">
				<tr>
					<th>방문 건수</th>
					<th>12건</th>
				</tr>
				<tr>
					<th>보낸 건수</th>
					<th>3건</th>
				</tr>
				<tr>
					<th>완료 건수</th>
					<th>10건</th>
				</tr>
			</table>
		</div>
		<br />

		<div
			style="display: flex; justify-content: center; align-items: center;">
			<i class="bi bi-arrow-left-square me-3 arrow"></i> <span
				style="font-size: 24px;">1월</span> <i
				class="bi bi-arrow-right-square ms-3 arrow"></i>

		</div>

	</center>


	<div class="container mx-auto mt-5" style="width: 50%;">
		<ul class="list-group list-group-flush">
			<li class="list-group-item">
				<div class="row justify-content-between mt-3">
					<div class="col-8">
						<span><b style="font-size: 20px;">받은 견적</b></span>
						<div class="w-100"></div>
						<a style="color: lightgray;">12월 21일 수요일</a>
					</div>
					<div class="col-2 text-end">
						<b class="completed">완료</b>
					</div>
				</div>
			</li>
			<li class="list-group-item">
				<div class="row justify-content-between mt-3">
					<div class="col-8">
						<span><b style="font-size: 20px;">받은 견적</b></span>
						<div class="w-100"></div>
						<a style="color: lightgray;">12월 21일 수요일</a>
					</div>
					<div class="col-2 text-end">
						<b class="completed ">완료</b>
					</div>
				</div>
			</li>
			<li class="list-group-item">
				<div class="row justify-content-between mt-3">
					<div class="col-8">
						<span><b style="font-size: 20px;">받은 견적</b></span>
						<div class="w-100"></div>
						<a style="color: lightgray;">12월 21일 수요일</a>
					</div>
					<div class="col-2 text-end">
						<b class="process">진행중</b>
					</div>
				</div>
			</li>
			<li class="list-group-item">
				<div class="row justify-content-between mt-3">
					<div class="col-8">
						<span><b style="font-size: 20px;">받은 견적</b></span>
						<div class="w-100"></div>
						<a style="color: lightgray;">12월 21일 수요일</a>
					</div>
					<div class="col-2 text-end">
						<b class="completed">완료</b>
					</div>
				</div>
			</li>
			<li class="list-group-item">
				<div class="row justify-content-between mt-3">
					<div class="col-8">
						<span><b style="font-size: 20px;">받은 견적</b></span>
						<div class="w-100"></div>
						<a style="color: lightgray;">12월 21일 수요일</a>
					</div>
					<div class="col-2 text-end">
						<b class="completed">완료</b>
					</div>
				</div>
			</li>
		</ul>

	</div>

	<!--여기까지 본문 -->
	<!--푸터-->
<c:import url="/WEB-INF/views/include/footer.jsp" />
</body>

</html>