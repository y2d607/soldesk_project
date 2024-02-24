<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="root" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>received_quotation</title>
<script src="${root}/script/jquery-3.4.1.min.js"></script>

<style>
#a_comment-board-title:hover {
	color: #fff;
}

.btnss {
	background-color: lightgray;
	border-radius: 5px;
	border: none;
	width: auto;
	height: 35px;
}
</style>
<script>
$(document).ready(function() {
    var selectedAnswers = []; // selectedAnswers 값을 설정합니다.
    <c:forEach var="obj" items="${paramValues.selectedAnswers}">
        selectedAnswers.push('${obj}');
    </c:forEach>
    
    $('.send-quote-btn').click(function() {
        // 배열을 문자열로 변환
        var selectedAnswersStr = selectedAnswers.join(',');
        console.log('selectedAnswersStr:', selectedAnswersStr);
        
        var pro_id = $(this).data('pro-id');
        var pro_name = $(this).data('id');
        var user_id = '${loginUserBean.getUser_id()}';
        console.log('pro_id:', pro_id);
        console.log('user_id:', user_id);
        console.log('pro_name:', pro_name);
        //console.log('selectedAnswers:', selectedAnswers);
        
        // 클라이언트 측에서 서버로 보낼 데이터 확인 후 서버로 전송
        if (confirm('전송하시겠습니까?')) {
            $.ajax({
                type: 'POST',
                url: '${root}/sendQuote',
                data: JSON.stringify({
                    received_quote: selectedAnswersStr,
                    pro_id: pro_id,
                    user_id: user_id, 
                    service_category_id :'${param.s}'
                }),
                contentType: 'application/json',
                success: function(response) {
                    console.log('성공',response);
                    location.href = '${root}/chatting?pro_id=' + pro_id +'&pro_name='+pro_name;
                },
                error: function(error) {
                    console.log(error);
                }
            });
        }
    });
});

</script>


</head>

<body>
	<!-- 네비부분 -->
	<c:import url="/WEB-INF/views/include/header.jsp" /> 

	<div class="container mt-5 mb-5" style="width: 50%">
		<h2>
			<strong>'${param.reco }' 에서 활동하는 일류들</strong>
		</h2>
		<ul class="list-group list-group-flush mb-5 mt-5">
			<c:forEach var="obj" items="${recoProUsers}" varStatus="loop">
				<li class="list-group-item mb-3">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title fw-bold mb-3 mt-4">${obj}일류님</h4>
							<div class="btn-group mt-3" role="group" aria-label="카테고리">
								<button type="button" class="btnss me-3">${cate1List[loop.index]}</button>
								<button type="button" class="btnss me-3">${cate2List[loop.index]}</button>
								<button type="button" class="btnss">${cate3List[loop.index]}</button>
							</div>
							<hr>
							<div class="row text-center">
								<div class="col-6 fw-bold" style="cursor: pointer;"
									onclick="location.href='${root}/review/Review?pro_id=${proIds[loop.index]}'">프로필
									보기</div>
								<div class="col-6 fw-bold send-quote-btn"
							    style="color: #00CDFF; cursor: pointer;"
							    data-pro-id="${proIds[loop.index]}"
							    data-id="${obj}"
							    >견적보내기</div> 
							</div>
						</div>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div> 
	<!--여기까지 본문 -->
	<!--푸터-->
	<c:import url="/WEB-INF/views/include/footer.jsp" />

</body>

</html>