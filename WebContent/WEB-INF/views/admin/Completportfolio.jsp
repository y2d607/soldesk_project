<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!doctype html>
<head>
<script src="${root}/script/jquery-3.4.1.min.js"></script>
<script> 
$(document).ready(function() {
   
   <c:forEach var="portfolio" items="${allportfolio}">
    $('#exampleModal_${portfolio.portfolio_id}').on('shown.bs.modal', function () {
        var imageCount = $('#portfolioSlider_${portfolio.portfolio_id} img').length;
        console.log('Number of images in the modal:', imageCount);

        var currentImageIndex = 0;

     // plusDivs 함수 정의
     function plusDivs(n) {
        currentImageIndex += n;
        showDivs(currentImageIndex);
     }

     // showDivs 함수 정의
     function showDivs(n) {
         var slides = $('#portfolioSlider_${portfolio.portfolio_id} img');
         if (slides.length > 0) {
             currentImageIndex = (n + slides.length) % slides.length;
             slides.hide().eq(currentImageIndex).show();
         }
     }
        
        // plusDivs 함수 연결
        $('#portfolioSlider_${portfolio.portfolio_id} .w3-display-left').click(function () {
            plusDivs(-1);
        });

        $('#portfolioSlider_${portfolio.portfolio_id} .w3-display-right').click(function () {
            plusDivs(1);
        });

        // 초기 이미지 표시
        showDivs(currentImageIndex);
    });
</c:forEach>
   
     $('.portDel').click(function() {
       var portfolio_id = $(this).data('id');
       console.log('Delete button clicked for portfolio ID:', portfolio_id); 
       if (confirm("삭제하시겠습니까?")) {
          $.ajax({
              type: "POST",
              url: "${root}/admin/portfolio_Delpro",
              data: { portfolio_id: portfolio_id }, 
              success: function(response) {
                 location.reload();
              },
              error: function() {
                  // 서버와의 통신 중 에러가 발생한 경우 수행할 코드
              }
          });
      }
     });
   
      
}); 

function initializeSlider(reportId) {
    var slider = $('#portfolioSlider_' + reportId);
    //var images = slider.find('img');
    var images = slider.find('img');
   
}
// 슬라이더 컨트롤 함수
$('.portfolio-slider').each(function () {
    var reportId = $(this).attr('id').split('_')[1];
    console.log('이미지 개수222:', images.length);
    $(this).find('.w3-display-left, .w3-display-right').on('click', function () {
        // 이미지 전환 로직 추가
        // ...
        // 이미지 개수 콘솔에 출력
        initializeSlider(reportId);
    });
});
</script>
</head>
<body>
	<c:import url="/WEB-INF/views/admin/header.jsp" />
	<div id="right-panel" class="right-panel">
		<div class="breadcrumbs">
			<div class="breadcrumbs-inner">
				<div class="row m-0">
					<div class="col-sm-4">
						<div class="page-header float-left">
							<div class="page-title">
								<h1>검수 완료된 포트폴리오</h1>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		 <div class="content">
         <div class="animated fadeIn">
            <div class="row">
               <c:forEach var="portfolio" items="${allportfolio }" varStatus="num">
                  <c:if test="${portfolio.inspectionNY==1 }">
                     <div class="col-md-4 ">
                        <div class="card">
                           <c:if test="${portfolio.detailed_images != null}">
                              <c:forEach var="portfolio_img"
                                 items="${fn:split(portfolio.detailed_images, ',')}"
                                 varStatus="loop">
                                 <c:if test="${loop.index == 0}">
                                    <img src="${root}/portfolio/${portfolio_img}"
                                       class="card-img-top" style="width:508px; height:300px;">
                                 </c:if>
                              </c:forEach>
                           </c:if>
                           <div class="card-body">
                              <div class="row">
                                 <div class="col-8">
                                    <h4 class="card-title mb-3">작성자
                                       :${Portfolioallnames[num.index]}</h4>
                                    <p class="card-text detailed">제목:
                                       ${portfolio.portfolio_title }</p>
                                 </div>
                                 <div class="col-4">
                                    <button type="button" class="btn btn-info mt-3"
                                       data-toggle="modal"
                                       data-target="#exampleModal_${portfolio.portfolio_id}">
                                       자세히 보기</button>
                                 </div>
                              </div>
                           </div>
                           <!-- 모달창 -->
                           <div class="modal fade"
                              id="exampleModal_${portfolio.portfolio_id}" tabindex="-1"
                              role="dialog" aria-labelledby="exampleModalLabel"
                              aria-hidden="true">
                              <div class="modal-dialog modal-dialog-scrollable modal-lg">
                                 <div class="modal-content">
                                    <div class="modal-header">
                                       <h5 class="modal-title" id="exampleModalLabel">자세히 보기
                                          모달창</h5>
                                       <button type="button" class="close" data-dismiss="modal"
                                          aria-label="Close">
                                          <span aria-hidden="true">&times;</span>
                                       </button>
                                    </div>
                                    <div class="modal-body">
                                       <table class="table">
                                          <tbody>
                                             <tr>
                                                <th>서비스 종류</th>
                                                <td>${portfolio.service_type}</td>
                                             </tr>
                                             <tr>
                                                <th>포트폴리오 제목</th>
                                                <td>${portfolio.portfolio_title}</td>
                                             </tr>
                                             <tr>
                                                <th>지역정보</th>
                                                <td>${portfolio.location_info}</td>
                                             </tr>
                                             <tr>
                                                <th>최종 금액</th>
                                                <td>${portfolio.final_amount}</td>
                                             </tr>
                                             <tr>
                                                <th>작업 연도</th>
                                                <td>${portfolio.work_year}</td>
                                             </tr>
                                             <tr>
                                                <th>작업 소요기간</th>
                                                <td>${portfolio.work_period}</td>
                                             </tr>
                                             <tr>
                                                <th>상세 설명</th>
                                                <td>${portfolio.detailed_introduction}</td>
                                             </tr>
                                             <tr>
                                                <th>상세이미지</th>
                                                <td><c:if
                                                      test="${portfolio.detailed_images != null}">
                                                      <!-- 슬라이더 -->
                                                <div class="w3-content w3-display-container portfolio-slider" id="portfolioSlider_${portfolio.portfolio_id}" style="width: 468px;">
                                                      <c:forEach var="photo" items="${fn:split(portfolio.detailed_images, ',')}" varStatus="loop">
                                                        <img src="${root}/portfolio/${photo}" alt="pic" style="width: 468px; height: 480px;">
                                                    </c:forEach>
                                                    <button class="w3-button w3-black w3-display-left" onclick="plusDivs(-1)">&#10094;</button>
                                                    <button class="w3-button w3-black w3-display-right" onclick="plusDivs(+1)">&#10095;</button>
                                                </div>
                                                   </c:if></td>
                                             </tr>
                                          </tbody>
                                       </table>
                                    </div>
                                    <div class="modal-footer">
                                       <button type="button" class="btn btn-danger portDel"
                                          data-bs-dismiss="modal"
                                          data-id="${portfolio.portfolio_id}">삭제</button> 
                                          <button type="button" class="btn btn-primary portComp"
                                          data-bs-dismiss="modal"
                                          data-id="${portfolio.portfolio_id}">검수 완료</button>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </c:if>
               </c:forEach>
            </div>
         </div> 
			<!-- .animated -->
		</div>
		<!-- .content -->

		<div class="clearfix"></div>

		<footer class="site-footer">
			<div class="footer-inner bg-white">
				<div class="row">
					<div class="col-sm-6">Copyright &copy; 2018 Ela Admin</div>
					<div class="col-sm-6 text-right">
						Designed by <a href="https://colorlib.com">Colorlib</a>
					</div>
				</div>
			</div>
		</footer>


	</div>
	<!-- /#right-panel -->


</body>
</html>