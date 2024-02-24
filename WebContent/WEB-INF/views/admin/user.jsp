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
    $(".deleteMemberButton").click(function(){ 
        var userId = $(this).data("user-id");
        console.log("userId :"+userId);
        // 삭제 확인 메시지를 띄우기
        if (confirm("삭제하시겠습니까?")) {
            $.ajax({
                type: "POST",
                url: "${root}/admin/deleteUsers",
                data: { user_id: userId }, 
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
</script>
<body>
<c:import url="/WEB-INF/views/admin/header.jsp" />
    
    <!-- /#left-panel -->
    <div id="right-panel" class="right-panel">
         
        <!-- /#header -->
        <div class="orders" style="width: 127vw;">
                    <div class="row">
                        <div class="col-xl-8">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="box-title">회원명단 </h4>
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
                                            <c:forEach var="users" items="${allusers }">
                                                <tr>
                                                    <td class="serial">${users.user_id }</td>
                                                    <td class="avatar">${users.user_name }</td>
                                                    <td class="email"> ${users.user_email } </td>
                                                    <td><span class="name">${users.reportCnt }</span> </td> 
                                                    <td><span class="count">${users.postCount}</span></td> 
                                                    <td>
                                                       <button class="btn badge badge-complete deleteMemberButton" data-user-id="${users.user_id }">회원삭제</button>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div> <!-- /.table-stats -->
                                </div>
                            </div> <!-- /.card -->
                        </div>  
                    </div>
                </div>
        <!-- /.content -->
        <div class="clearfix"></div>
        <!-- Footer -->
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
        <!-- /.site-footer -->
    </div>
    
</body>
</html>