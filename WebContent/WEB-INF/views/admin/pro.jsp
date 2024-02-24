<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!doctype html> 
<head>
  <script src="${root}/script/jquery-3.4.1.min.js"></script> 
</head>
<script>
$(document).ready(function(){
    $(".deleteProButton").click(function(){ 
        var proId = $(this).data("pro-id");
        console.log("proId :"+ proId);
        // 삭제 확인 메시지를 띄우기
        if (confirm("삭제하시겠습니까?")) {
            $.ajax({
                type: "POST",
                url: "${root}/admin/deletePros",
                data: { pro_id: proId }, 
                success: function(response) {
                	location.reload();
                },
                error: function() {
                    // 서버와의 통신 중 에러가 발생한 경우 수행할 코드
                    console.log(error)
                }
            });
        }
    });
});
</script>

<body>
	<c:import url="/WEB-INF/views/admin/header.jsp" />
	<div id="right-panel" class="right-panel ">
		<div class="orders" style="width: 98%;">
			<div class="row">
				<div class="col">
					<div class="card">
						<div class="card-body">
							<h4 class="box-title">일류명단</h4>
						</div>
						<div class="card-body--">
							<div class="table-stats order-table ov-h">
								<table class="table ">
									<thead>
										<tr>
											<th class="serial">#</th>
											<th>이름</th>
											<th>이메일</th>
											<th>신고횟수</th>
											<th>게시글 수</th>
											<th>회원삭제</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="pros" items="${allpros }">
                                              <tr>
                                                  <td class="serial">${pros.pro_id }</td>
                                                  <td class="avatar">${pros.pro_name }</td>
                                                  <td> ${pros.pro_email } </td>
                                                  <td>  <span class="name">${pros.reportCnt }</span> </td> 
                                                  <td><span class="count">${pros.postCount}</span></td> 
                                                  <td>
                                                     <button class="btn badge badge-complete deleteProButton" data-pro-id="${pros.pro_id }">일류삭제</button>
                                                  </td>
                                              </tr>
                                          </c:forEach>				
									</tbody>
								</table>
							</div>
							<!-- /.table-stats -->
						</div>
					</div>
					<!-- /.card -->
				</div>
				<!-- /.col-lg-8 -->
			</div>
		</div>
		<!-- /.content -->
		<div class="clearfix"></div>
		<!-- Footer -->
		<footer class="site-footer">
			<div class="footer-inner bg-white" style="width: 98%">
				<div class="row" >
					<div class="col-sm-6">Copyright &copy; 2018 Ela Admin</div>
					<div class="col-sm-6 text-right">
						Designed by <a href="https://colorlib.com">Colorlib</a>
					</div>
				</div>
			</div>
		</footer>
		<!-- /.site-footer -->
	</div>
	<!-- /#right-panel -->

</body>
</html>