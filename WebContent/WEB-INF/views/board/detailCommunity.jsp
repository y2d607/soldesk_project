<%@page import="kr.co.softsoldesk.beans.PostBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 글 페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script src="${root}/script/jquery-3.4.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
	
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1.6.1/dist/sockjs.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/stompjs/lib/stomp.min.js"></script>
<script>

$(document).ready(function() {
    // 댓글 추가 함수
    $("#submitReply").click(function() {
        var replyText = $("#replyText").val();
        if (replyText.trim() === '') {
            alert('댓글을 입력해주세요.');
            return;
        }
        $.ajax({
            url: '${root}/comment',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({
                comment_content: replyText, 
                board_id: ${board_id} 
            }),
            success: function(response) {
                if (response.comment_content==null) { 
                    alert('로그인을 해주세요');
                    window.location.href = '${root}/user/login';
                } else {
                    var replyHtml = '<div class="card mt-2"><div class="card-body">' +
                                    '<p class="card-text">' + response.comment_content + '</p>' +
                                    '</div></div>';
                    $("#replySection").append(replyHtml);
                    $("#replyText").val(''); 
                    alert('댓글이 성공적으로 추가되었습니다.'); 

                    // 댓글 개수 조회
                    updateCommentCount();
                    
                    // 댓글 목록 조회
                    updateReplyList();
                    
                    // 댓글 알림 보내기 
                    sendNotification();
                }
            },
            error: function(error) {
                console.log(error);
                alert('댓글 추가에 실패했습니다.'); 
            }
        });
    });

    // 댓글 개수 조회 함수
    function updateCommentCount() {
    $.ajax({
        url: '${root}/commentCnt',
        type: 'GET',
        data: { board_id: ${board_id} },
        success: function(response) {
            if (response === 0) {
                $("#replySection").hide(); // 댓글이 없는 경우 댓글 영역 숨기기
            } else {
                $("#replySection").show(); // 댓글이 있는 경우 댓글 영역 보이기
            }
            $("#commentCount").text(response);
        },
        error: function(error) {
            console.log(error);
        }
    });
}


    // 댓글 목록 조회 함수
    function updateReplyList() {
        $.ajax({
            url: '${root}/comments?board_id=${board_id}',
            type: 'GET',
            dataType: 'json',
            success: function(response) {
                $("#replySection").empty(); 
                $.each(response, function(index, comment) {
                    var replyHtml = '<hr><div style="margin-bottom: 20px;">' + 
                                    '<div style="display:flex; flex-direction:row; justify-content: space-between; align-items:center;">' +
                                    '<div style="display:flex; flex-direction: row;">';
                                    
                    if(comment.user_id == null){ //pro_user가 댓글 작성
                        replyHtml += '<div><img src="${root}/upload/' + comment.certification_documents_images + '" style="width: 45px; height: 45px; border-radius: 50%; margin-right: 8px;"></div>' + 
                                     '<div style="display:flex; flex-direction:column">';
                        
                    } 
                    
                    if(comment.pro_id == null){
                        replyHtml += '<div><img src="../image/profile.png" style="width: 45px; margin-right: 8px;"></div>' + 
                        			 '<div style="display:flex; flex-direction:column">';
                        
                    }
                                    
                    
                    if(comment.user_id == null){
                        replyHtml += '<div>' + comment.comment_prowriter_name + '</div>';
                        
                    } 
                    
                    if(comment.pro_id == null){
                        replyHtml += '<div>' + comment.comment_writer_name + '</div>';
                        
                    }
                    
                    var date = new Date(comment.comment_date);
                    var now = new Date();

                    // 시간 차이 계산
                    var timeDifference = now - date;

                    // 밀리초(ms)를 분, 시간 등으로 변환
                    var seconds = Math.floor(timeDifference / 1000);
                    var minutes = Math.floor(seconds / 60);
                    var hours = Math.floor(minutes / 60);
                    var days = Math.floor(hours / 24);

                    var formattedDate;

                    if (days > 7) {
                        formattedDate = date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate();
                    } else if (days > 0) {
                        formattedDate = days + '일 전';
                    } else if (hours > 0) {
                        formattedDate = hours + '시간 전';
                    } else if (minutes > 0) {
                        formattedDate = minutes + '분 전';
                    } else {
                        formattedDate = '방금 전';
                    }

                    
                   	if(comment.pro_id != null){
                   		replyHtml += '<div style="color: gray; font-size:14px; margin-bottom: 10px;">일류</div></div></div>' +
                   					 '<button style="background-color: #6387A6; border:none; border-radius: 8px; color: #fff; height: 40px;">견적요청</button></div>' +
                   					'<div style="margin-left:53px; margin-bottom: 10px;" class="comment-content" id="commentContent_' +comment.comment_id + '">' + comment.comment_content + '</div>' + 
                                    '<div style="display:flex; flex-direction: row; justify-content:space-between; align-items:center;" ><div class="time" style="margin-left: 53px; color: gray;">' + formattedDate + '</div>'
                   	} else{
                   		replyHtml += '<br><div style="margin-bottom: 10px;" class="comment-content" id="commentContent_' +comment.comment_id + '">' + comment.comment_content + '</div>' + 
                        			 '<div style="display:flex; flex-direction: row; justify-content:space-between; align-items:center;" ><div class="time" style="color: gray;">' + formattedDate + '</div>'
                   	}
                   	
                   	
                           
                    if(comment.comment_prowriter_name == null){
                         if(comment.user_id == ${loginUserBean.user_id}){

						 	replyHtml += '<div style="display:flex; flex-direction: row; height: 100%;">' +
                           			 	 '<button style="margin-right: 8px; margin-left: 900px; border: 1px solid gray; color: gray; background-color: #fff; border-radius: 8px;" onclick="editComment(' + comment.comment_id + 
                           			 	 ')">수정</button>' + '<button style="border: 1px solid gray; color: gray; background-color: #fff; border-radius: 8px;" id="deleteBtn' + comment.comment_id +
                   					 	 '" onclick="deleteComment(' + comment.comment_id + ')"' + 
                   					  	 '>삭제</button></div></div></div>';
                         }
                    }else if(comment.comment_writer_name == null){
                    	if(comment.pro_id == ${loginProuserBean.pro_id}){
                    		replyHtml += '<div style="display:flex; flex-direction: row">' +
               			 '<button style="margin-right: 8px; border: 1px solid gray; color: gray; background-color: #fff; border-radius: 8px;" onclick="editComment(' + comment.comment_id + 
               			 ')">수정</button>' + '<button style="border: 1px solid gray; color: gray; background-color: #fff; border-radius: 8px;" id="deleteBtn' + comment.comment_id +
       					 '" onclick="deleteComment(' + comment.comment_id + ')"' + 
       					 '>삭제</button></div></div></div>';
                    	}
                    } 
                    
      	

          
                                
                    
                    $("#replySection").append(replyHtml); 
                });
            },
            error: function(error) {
                console.log(error);
            }
        });
    }

    // 댓글 삭제 함수
    function deleteComment(commentId) {
        var isConfirmed = confirm('정말로 이 댓글을 삭제하시겠습니까?');

        if (isConfirmed) {
            $.ajax({
                url: '${root}/deleteComment',
                type: 'GET',
                data: { comment_id: commentId },
                success: function(response) {
                    alert('댓글이 성공적으로 삭제되었습니다.');
                    
                    // 댓글이 성공적으로 삭제된 후에 updateReplyList 함수 호출
                    updateReplyList();
                    updateCommentCount();
                },
                error: function(error) {
                    console.log(error);
                    alert('댓글 삭제에 실패했습니다.');
                }
            });
        }
    }

    // 댓글 수정 함수
    function editComment(commentId) {
        // 댓글 내용 가져오기
        var currentContent = $("#commentContent_" + commentId).text();

        // 수정을 위한 input 태그로 교체
        var inputElement = $('<input type="text" class="edit-comment-input" value="' + currentContent + '">');
        $("#commentContent_" + commentId).replaceWith(inputElement);

        // 수정 완료 시 업데이트 처리
        inputElement.blur(function() {
            var editedText = inputElement.val();
            updateComment(commentId, editedText);
        });

        // 포커스 주기
        inputElement.focus();
    }

    // 댓글 업데이트 함수
    function updateComment(commentId, editedText) {
        $.ajax({
            url: '${root}/modifyComment',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({
                comment_id: commentId,
                comment_content: editedText
            }),
            success: function(response) {
                alert('댓글이 성공적으로 수정되었습니다.');
                updateReplyList();
            },
            error: function(error) {
                console.log(error);
                alert('댓글 수정에 실패했습니다.');
            }
        });
    }

    // 초기 로딩 시 댓글 개수와 목록 업데이트
    updateCommentCount();
    updateReplyList();
    
    window.deleteComment = deleteComment;
    window.editComment = editComment;
});

</script>
<script>
	$(function() {

		$(".co-comment").click(function() {
			// 현재 클릭된 대댓글 부모 요소에 대해서만 가시성 토글
			$(this).closest('.parent-comment').find('.sho-comm').toggle();
		});

	});
</script>

<style>
.t-color {
	color: #B8B2B2;
}

.bi-three-dots-vertical {
	font-size: 30px;
	float: right;
}

.pageBtn {
	background-color: #fff;
	border: 1px solid #B8B2B2;
	border-radius: 8px;
	color: #B8B2B2;
	font-size: 14px;
}
</style>
</head>
<body>
	<c:import url="/WEB-INF/views/include/header.jsp" />
	<div class="container mt-5" style="width: 60%;">
		<div class="post-header mt-5">
			<div class="category t-color">${readPostBean.category }</div>
			<div class="post-title">
				<h2>${readPostBean.title }</h2>
				<!-- 제목 -->
			</div>
			<div class="post-location t-color">${readPostBean.location }</div>

			<div class="writeTop">
				<div class="writeTopfirst">
					<div class="writer"
						style="display: flex; justify-content: space-between;">
						<div style="display: flex; flex-direction: row;">
							<img src="../image/profile.png"
								style="width: 45px; margin-right: 10px;">
							<div class="writerInfo"
								style="display: flex; flex-direction: column">
								<c:choose>
		                           <c:when test="${not empty readPostBean.pro_id}">
		                              <span>${readPostBean.prowriter_name }</span>
		                           </c:when>
		                           <c:otherwise>
		                              <span>${readPostBean.writer_name }</span>
		                           </c:otherwise>
		                        </c:choose>
								<div class="time">${readPostBean.board_date }</div>
								<!-- 조회수도 같이 하기 -->
							</div>
						</div>


						<!-- 신고모달 -->
						<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">신고하기</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <form:form action="${root}/board/detail_reportPro" method="post" modelAttribute="writeReportBean"
                id="reportForm">
                <div class="modal-body">
                    <form:hidden path="board_id" />
                    <div class="singo form-floating">
                        <form:textarea path="report_msg" class="form-control" placeholder="상세사유를 입력해 주세요"
                            id="floatingTextarea2" style="height: 300px" oninput="validateTextarea()"></form:textarea>
                        <div id="error-message" style="color: red;"></div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                    <form:button type="submit" class="btn btn-primary" id="submitBtn" disabled="disabled">신고하기</form:button>
                </div>
            </form:form>

            <script>
                function validateTextarea() {
                    var textareaValue = document.getElementById("floatingTextarea2").value;
                    var submitBtn = document.getElementById("submitBtn");
                    var errorMessage = document.getElementById("error-message");

                    if (textareaValue.trim() === "") {
                        submitBtn.disabled = true;
                        errorMessage.innerHTML = "신고 사유를 입력해 주세요.";
                    } else {
                        submitBtn.disabled = false;
                        errorMessage.innerHTML = "";
                    }
                }

                document.getElementById("reportForm").addEventListener("submit", function (event) {
                    validateTextarea();

                    // 폼 제출 시에도 한번 더 검사
                    if (document.getElementById("submitBtn").disabled) {
                        event.preventDefault();
                    } else {
                        // 폼 제출이 성공하면 모달 닫기
                        $('#exampleModal').modal('hide');
                    }
                });
            </script>
        </div>
    </div>
</div>

 




					</div>
				</div>  
					<div style="display: flex; justify-content: end; align-items: center;">
					    <button class="pageBtn" onclick="location.href='${root}/board/community'" style="margin-right: 8px;">목록</button>
					    
					    <c:choose>
					        <c:when test="${loginUserBean.getUser_id() == readPostBean.user_id || loginProuserBean.getPro_id() == readPostBean.pro_id}">
					            <div>
					                <button class="pageBtn" onclick="location.href='${root}/board/modifyPost?board_id=${board_id}'">수정</button>
					                <button class="pageBtn" onclick="location.href='${root}/board/delete?board_id=${board_id}'">삭제</button>
					            </div>
					        </c:when>
					        <c:otherwise>
					            <div>
					                <i class="bi bi-three-dots-vertical" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown"></i>
					                <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
					                    <li>
					                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" style="width: 100%; border-radius: 0px; background-color: #6387A6; border: 1px solid #6387A6;" data-bs-target="#exampleModal">게시글 신고</button>
					                    </li>
					                </ul>
					            </div>
					        </c:otherwise>
					    </c:choose>
					</div> 
			</div>
			<hr />
		</div>
		<div class="post-body-container">
			<span>${readPostBean.content }</span>
			<c:if test="${readPostBean.photos != null }">
				<div id="categoryphoto" class="carousel mt-4"
					style="width: 100%; margin: auto;">
					<!-- 캐러셀 부분-->
					<div class="carousel-inner">
  						<c:forEach var="photo" items="${fn:split(readPostBean.photos, ',')}" varStatus="loop">
    						<div class="carousel-item ${loop.index == 0 ? 'active' : ''}">
      							<img src="${root}/upload/${photo}" class="d-block w-100" style="height: 500px;" alt="pic">
      							
    						</div>
  						</c:forEach>
					</div>

					<button class="carousel-control-prev" type="button"
						data-bs-target="#categoryphoto" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#categoryphoto" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
			</c:if>

		</div>
		<hr />


		<div class="post-comment-count mt-4" style="display:flex; flex-direction: row; margin-rigth: 8px; align-items:center;">
			<i class="bi bi-chat-right-text" style="margin-right: 4px;"></i>댓글&nbsp;<div id="commentCount"></div>
		</div>

		<!-- 댓글작성 -->
		<div class="post-comments-container">


			<div class="comment-input-box input-group mb-4 mt-4">
				<input id="replyText" type="text" class="form-control" data-html-escape="false"
					placeholder="댓글을 남겨주세요" aria-label="Recipient's username"
					aria-describedby="button-addon2" />
				<button class="btn btn-outline-secondary" type="button"
					id="submitReply" disabled="disabled">등록</button>
			</div>

			<!-- 등록된 댓글1 -->
			<div class="reply-section">
				<div id="replySection"></div>
			</div>
			
			<script>
				$(document).ready(function() {
					var button = $('#submitReply');

					// Disable the button initially
					button.prop('disabled', true);

					// Enable/disable button based on input content
					$('#replyText').on('input', function() {
						var isEmpty = $(this).val().trim() === '';
						button.prop('disabled', isEmpty);

						// Change button background color when active
						if (!isEmpty) {
							button.css('background-color', '#6387A6');
							button.css('color', '#fff');
						} else {
							button.css('background-color', ''); // Reset to default color
							button.css('color', '');
						}
					});
				});
			</script>

		</div>





	</div>





	<c:import url="/WEB-INF/views/include/footer.jsp" />
	
	
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			var timeElements = document.querySelectorAll('.time');

			timeElements.forEach(function(timeElement) {
				var boardDate = moment(timeElement.textContent);
				var now = moment(); // 현재 시간
				var diffInMinutes = now.diff(boardDate, 'minutes');
				var diffInHours = now.diff(boardDate, 'hours');
				var diffInDays = now.diff(boardDate, 'days');

				var relativeTime;
				if (diffInMinutes < 1) {
					relativeTime = '방금 전';
				} else if (diffInHours < 1) {
					relativeTime = diffInMinutes + '분 전';
				} else if (diffInHours < 24) {
					relativeTime = diffInHours + '시간 전';
				} else if (diffInDays < 7) {
					relativeTime = diffInDays + '일 전';
				} else {
					relativeTime = boardDate.format('YYYY-MM-DD');
				}

				timeElement.textContent = relativeTime;
			});
		});
	</script>
	 <script>
      var stompClient = null;
      
      function connect() {
          var socket = new SockJS('/ws');
          stompClient = Stomp.over(socket);
      
         
      }
      
      
      
      // 페이지 로드 시 연결
      window.onload = function() {
          connect();
      }; 
      </script>
 	
	
	
	<script>


	// 페이지 로드 시 WebSocket 연결을 초기화
		function sendNotification() {
		    if(stompClient) {
		        stompClient.send("/app/board/newPost", {}, JSON.stringify({}));
		    } else {
		        console.log("WebSocket 연결이 없습니다.");
		    }
		}

	</script>

</body>
</html>