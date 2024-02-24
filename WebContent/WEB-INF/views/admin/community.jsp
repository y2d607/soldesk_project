<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>   
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head> 

  <script src="${root}/script/jquery-3.4.1.min.js"></script>  
</head>
<script> //!!! 게시글 삭제 !!!
	$(document).ready(function() {
	    $(".delete-btn").click(function() {   
	        var boardId = $(this).data("board-id"); // data-board-id 속성에서 boardId를 가져옵니다.
	        console.log("board_id : " + boardId);
	        // 삭제 확인 메시지를 띄우기
	        if(confirm("삭제하시겠습니까?")){
	            $.ajax({
	                type: "POST",
	                url: "${root}/admin/deletePost",
	                data: { board_id: boardId },
	                success: function(data) {
	                    location.reload();
	                },
	                error: function() {
	                    alert("게시글 삭제 실패");
	                }
	            });
	        }
	    });
	});
</script>
<body>
  <c:import url="/WEB-INF/views/admin/header.jsp" />

    <div id="right-panel" class="right-panel">

        <!-- Header-->
       
           
        <!-- /header -->
        <!-- Header-->

        <div class="breadcrumbs">
            <div class="breadcrumbs-inner">
                <div class="row m-0">
                    <div class="col-sm-4">
                        <div class="page-header float-left">
                            <div class="page-title">
                                <h1>Dashboard</h1>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <div class="page-header float-right">
                            <div class="page-title">
                                <ol class="breadcrumb text-right">
                                    <li><a href="#">Dashboard</a></li>
                                    <li><a href="#">Table</a></li>
                                    <li class="active">Data table</li>
                                </ol>
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
                                <strong class="card-title">Data Table</strong>
                            </div>
                            <div class="card-body">
                                <table id="bootstrap-data-table" class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <th>제목</th>
                                            <th>내용</th>
                                            <th>작성자</th>
                                            <th>조회수</th>
                                            <th>작성일</th>
                                            <th>댓글수</th>
                                            <th>신고여부</th>
                                            <th>관리</th>
                                        </tr>
                                    </thead>
                                    <tbody>
	                                    <c:forEach var="boards" items="${boardAll }" varStatus="num">
										    <tr>
										        <td>${boards.title}</td>
										        <td>${boards.content}</td> 
										        <td>${allnames[num.index]}</td>   
										        <td>${boards.viewCnt}</td>
										        <td>${boards.board_date}</td>
										        <!-- 댓글 수를 나타내는 적절한 변수로 변경 -->
										        <td>${boards.commentCnt}</td>
										        <td>${boards.reportedPostSt}</td>
										        <td>
												  <button class="btn btn-danger delete-btn" data-board-id="${boards.board_id}">삭제</button>
												</td>
												
 
										    </tr>
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

    <!-- <script type="text/javascript">
        $(document).ready(function() {
          $('#bootstrap-data-table-export').DataTable();
      } );
  </script> -->


</body>
</html>