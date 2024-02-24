<%@page import="kr.co.softsoldesk.beans.ReportBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>report</title>
<script src="${root}/script/jquery-3.4.1.min.js"></script> 
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>
	
	
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<!-- jQuery CDN 추가 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 부트스트랩 JavaScript 추가 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<script>
$(document).ready(function() {
	
	<c:forEach var="portfolio" items="${portfolioList}">
    $('#exampleModal_${portfolio.portfolio_id}').on('shown.bs.modal', function () {
        var imageCount = $('#portfolioSlider_${portfolio.portfolio_id} img').length;
        console.log('Number of images in the modal:', imageCount);

        // 현재 표시되는 이미지의 인덱스를 추적하는 변수
        var currentImageIndex = 0;

        // plusDivs 함수 정의
        function plusDivs(n) {
            showDivs(currentImageIndex += n);
        }

        // showDivs 함수 정의
        function showDivs(n) {
            var i;
            var slides = $('#portfolioSlider_${portfolio.portfolio_id} img');
            if (n >= slides.length) { currentImageIndex = 0 }
            if (n < 0) { currentImageIndex = slides.length - 1 }
            for (i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            slides[currentImageIndex].style.display = "block";
        }

        // 초기 이미지 표시
        showDivs(currentImageIndex);

        // 좌우 버튼에 plusDivs 함수 연결
        $('#portfolioSlider_${portfolio.portfolio_id} .w3-display-left').click(function() {
            plusDivs(-1);
        });

        $('#portfolioSlider_${portfolio.portfolio_id} .w3-display-right').click(function() {
            plusDivs(1);
        });
    });
</c:forEach>
</script>

<style>
    
    #rejectButton {
    	border:none;
    	background-color: #4775F6;
    	border-radius: 2.5px;
    	color: white;
    	margin-right: 15px;
    	padding: 5px 11px;
    }
    .reportDelete{
    	border:none;
    	background-color: #D63A26;
    	border-radius: 2.5px;
    	color: white;
    	padding: 5px 11px;
    }
    
    /* 추가적인 스타일링을 위한 CSS */
        #rejectButton:disabled {
            background-color: gray; /* 비활성화된 버튼 배경 색상 설정 */
            color: white; /* 비활성화된 버튼 텍스트 색상 설정 */
        }
</style>
<body>
	<c:import url="/WEB-INF/views/admin/header.jsp" />
	
	 <div id="right-panel" class="right-panel">

        

        <div class="breadcrumbs">
            <div class="breadcrumbs-inner">
                <div class="row m-0">
                    <div class="col-sm-4">
                        <div class="page-header float-left">
                            <div class="page-title">
                                <h1>신고 관리</h1>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="content">
            <div class="animated fadeIn">
                <div class="row"> 
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <strong class="card-title">게시글 신고 목록</strong>
                            </div>
                            <div class="card-body">
                                <table id="bootstrap-data-table" class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <th style="text-align: center;">제목</th>
                                            <th style="text-align: center;">작성자</th>
                                            <th style="text-align: center;">신고일</th>
                                            <th style="text-align: center; width: 70px;">신고 누적 수</th>
                                            <th style="text-align: center;">신고 사유</th>
                                            <th style="text-align: center;">게시글</th>
                                            <th style="text-align: center;">처리</th>
                                        </tr>
                                    </thead>
                                    <tbody>
	                                    <c:forEach var="report" items="${allReportBean }" varStatus="num">
										    <tr>
										    
										        <td>${report.title}</td> <!-- 제목 -->
												
												<td>
													<c:if test="${report.pro_id != null}">
														${report.pro_writer_name}
													</c:if>
													<c:if test="${report.user_id != null}">
														${report.user_writer_name}
													</c:if>
												</td>


												<td>${report.report_date}</td> <!-- 신고일 -->
										        
										        <c:choose>
										        	<c:when test="${report.pro_id != null }">
										        		<td>${report.pro_reportcnt }</td>
										        	</c:when>
										        	<c:when test="${report.user_id != null }">
										        		<td>${report.user_reportcnt }</td>
										        	</c:when>
										        </c:choose>	
										        
										        <td>${report.report_msg}</td> <!-- 신고 사유 -->
										        <td style="text-align: center;"><button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal_${report.board_id }" style="background-color: #69C368; border:none;">
  													자세히 보기
												</button></td>
										        <td style="text-align: center;"><button id="rejectButton" onclick="deleteReport('${report.board_id}')">신고 반려</button><button class="reportDelete" onclick="deletePost('${report.board_id}', '${report.user_id}', '${report.pro_id}')">게시글 삭제</button></td>
										   
										    </tr>

											<!-- Modal -->
											<div class="modal fade" id="exampleModal_${report.board_id }" tabindex="-1"
												aria-labelledby="exampleModalLabel" aria-hidden="true">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header"
															style="display: flex; align-items: center;">
															<h1 class="modal-title fs-5" id="exampleModalLabel">(제목)${report.title }</h1>
															<button type="button" class="btn-close"
																data-bs-dismiss="modal" aria-label="Close"></button>
														</div>
														<div class="modal-body">
															(내용)${report.content }
															
															<c:if test="${report.photos != null }">
																(사진)
																<div class="w3-content w3-display-container portfolio-slider" id="portfolioSlider_${portfolio.portfolio_id}">
											   						<c:forEach var="photo" items="${fn:split(report.photos, ',')}" varStatus="loop">
											        					<img src="${root}/portfolio/${photo}" alt="pic" style="width: 468px; height: 480px;">
											    					</c:forEach>
											    					<button class="w3-button w3-black w3-display-left" onclick="plusDivs(-1)">&#10094;</button>
											    					<button class="w3-button w3-black w3-display-right" onclick="plusDivs(+1)">&#10095;</button>
																</div>
																<div>${photo}</div>
															</c:if>
															
														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-secondary"
																data-bs-dismiss="modal">닫기</button>
														</div>
													</div>
												</div>
											</div>
										</c:forEach>
                                    </tbody> 
                                </table>
                            </div>
                        </div>
                    </div>


                </div>
            </div><!-- .animated -->
        </div><!-- .content -->

		

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

    </div><!-- /#right-panel -->

    <!-- Right Panel -->

    <script type="text/javascript">
        $(document).ready(function() {
          //$('#bootstrap-data-table-export').DataTable();
      } );
  </script>
  
  <script>
  function deleteReport(boardId) {
      var isConfirmed = confirm('해당 글의 신고를 반려하시겠습니까?');
      
      if (isConfirmed) {
          $.ajax({
              url: '${root}/admin/rejectReport',
              contentType: "application/json",
              type: 'POST',
              data: JSON.stringify({ board_id: boardId }),
              success: function(response) {
                  alert('신고가 반려 처리되었습니다');
                  
                  // 댓글이 성공적으로 삭제된 후에 updateReplyList 함수 호출
                  //updateReviewList();
                  //updateReviewCount();
                  location.reload();
              },
              error: function(error) {
                  console.log(error);
                  alert('반려 처리를 실패했습니다');
              }
          });
      }
  }
  

  
  </script>
  
 <script>
  function deletePost(boardId, userId, proId) {
      var isConfirmed = confirm('게시글을 삭제하시겠습니까?');
      
      if (isConfirmed) {
          $.ajax({
              url: '${root}/admin/approveReport',
              contentType: "application/json",
              type: 'POST',
              data: JSON.stringify({ board_id: boardId, user_id: userId, pro_id: proId }),
              success: function(response) {
                  alert('게시글이 삭제되었습니다');
                  
 
                  location.reload();
              },
              error: function(error) {
                  console.log(error);
                  alert('게시글 삭제를 실패했습니다');
              }
          });
      }
  }
  
  </script>
  

  
  <%-- <%
    // Get reportList from the model
    List<ReportBean> reportList = (List<ReportBean>) request.getAttribute("reportList");
%>
  
<script>
    $(document).ready(function () {
        // Your Ajax code to handle the updateReportCount request
        $("#deleteButton").on("click", function () {
        	<% for (ReportBean report : reportList) { %>
            var userId = '<%= report.getUser_id() %>';
            var proId = '<%= report.getPro_id() %>';
            var userReportCnt = '<%= report.getUser_reportcnt() %>';
            var proReportCnt = '<%= report.getPro_reportcnt() %>';
            <% } %>

            $.ajax({
                type: "POST",
                url: "/admin/updateReportCount",
                data: {
                    userId: userId,
                    proId: proId,
                    userReportCnt: userReportCnt,
                    proReportCnt: proReportCnt
                },
                success: function (response) {
                    if (response === "success") {
                        // Handle success, e.g., update UI
                        console.log("Report count updated successfully.");
                    } else {
                        // Handle failure
                        console.error("Failed to update report count.");
                    }
                },
                error: function () {
                    // Handle error
                    console.error("Error during Ajax request.");
                }
            });
        });
    });
</script> --%>

	
</body>
</html>