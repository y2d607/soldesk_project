<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Chatting List</title>
    <script src="${root}/script/jquery-3.4.1.min.js"></script>
    <style>
        .account {
            font-size: 25px;
        }

        .chats {
        	display:flex;
        	justify-content: center;
        	align-items: center;
        	flex-direction: row;
        }
        
        .chat {
        	border: none;
        	background-color: #fff;
        }
	
	 	.provider_profile {
	 		display: flex;
	 		flex-direction: row;
	 	}
	 
		.chat_content {
			display: flex;
	 		flex-direction: row;
		}
		
		.chatInfo {
			display: flex;
	 		flex-direction: row;
		}
		
		.provider_profileInfo {
			display: flex;
	 		flex-direction: row;
		}
		
		.provider_profile {
			display: flex;
			justify-content: space-between;
		}
		
		.chat_content {
			display: flex;
			justify-content: space-between;
		}
		
		.krw {
			display: flex;
	 		flex-direction: row;
		}

		.krwIcon {
			display: flex;
			justify-content: center;
			align-items: center;
		}
		
		.chatInfo {
			display: flex;
			justify-content: space-between;
		}
		
		.form-check-input:checked {
    		background-color: #6387A6 !important; /* !important를 추가하여 우선순위를 높입니다. */
    		border-color: #6387A6 !important;
    		color: white !important;
    		outline: none;
		}
        
    </style>
    <script>
    $(function(){
      $(".header").load("header.html");
      $(".footer").load("footer.html");
    });
  </script>
</head>
<body>
<c:import url="/WEB-INF/views/include/header.jsp" />
   <div class="container mt-5 mb-5">
        <div class="row justify-content-center">
            <div class="col-md-10">
                <div class="account"><strong>채팅</strong></div>
                <div class="chats" style="border: 1px solid rgb(242, 242, 242); border-radius: 10px; margin-top: 2%;">
                	<button class="chat" style="width: 95%;">
                	
                		<div class="provider_profile" style="width: 100%; padding-top: 20px; margin-bottom: 16px;">
                			<div class="provider_profileInfo">
                        		<img src="../image/1.png" style="width: 52px; height: 52px; border-radius: 25%; border: 1px solid #F3F3F3; margin-right: 6%">
                        		<div class="profileInfo" style="margin-top: 2.5%;">
                            		<div class="provider_name" style="font-size: 16px; width: max-content;"><strong>심리상담사 OOO</strong></div>
                            		<div class="service_name" style="font-size: 14px; color: #737373;">성인 심리상담</div>
                        		</div>
                        	</div>
                        	<div class="form-check">
  								<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" onchange="updateButtonColor()" style="width: 20px; height: 20px;">
  								<label class="form-check-label" for="flexCheckChecked"></label>
							</div>
                    	</div>
                    	
                    	<div class="chat_content">
                    		<p style="font-size: 14px;">OOO 고객님, 안녕하세요. 예상 금액 보내드립니다.</p>
                    		<span class="start-100  badge rounded-pill bg-danger" style="height: 20px; width: 25px;">
    							2<span class="visually-hidden">unread messages</span>
 						 	</span>
 						</div>
 						
 						<hr style="margin-top: -1%; margin-bottom: 1%; border: 1px solid #B5B5B5;">
 						
 						<div class="chatInfo" style="padding-bottom: 20px;">
 							<div class="cost">
 								<div class="krw" style="width: 110%;">
 									<div class="krwIcon" style="border: 1px solid gray; border-radius: 5px; height: 20px; width: 20px; margin-right: 3.5%; font-size: 14px;">₩</div>
 									<div style="font-size: 14px;">시간 당 330,000원</div>
 								</div>
 							</div>
 							<div class="date" style="font-size: 14px; color: #B5B5B5;">
 								2023. 11. 23
 							</div>
 						</div>
                    </button>
                </div>
                
                <div class="chats" style="border: 1px solid rgb(242, 242, 242); border-radius: 10px; margin-top: 2%;">
                	<button class="chat" style="width: 95%;">
                	
                		<div class="provider_profile" style="width: 100%; padding-top: 20px; margin-bottom: 16px;">
                			<div class="provider_profileInfo">
                        		<img src="../image/1.png" style="width: 52px; height: 52px; border-radius: 25%; border: 1px solid #F3F3F3; margin-right: 6%">
                        		<div class="profileInfo" style="margin-top: 2.5%;">
                            		<div class="provider_name" style="font-size: 16px; width: max-content;"><strong>심리상담사 OOO</strong></div>
                            		<div class="service_name" style="font-size: 14px; color: #737373;">성인 심리상담</div>
                        		</div>
                        	</div>
                        	<div class="form-check">
  								<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" onchange="updateButtonColor()" style="width: 20px; height: 20px;">
  								<label class="form-check-label" for="flexCheckChecked"></label>
							</div>
                    	</div>
                    	
                    	<div class="chat_content">
                    		<p style="font-size: 14px;">OOO 고객님, 안녕하세요. 예상 금액 보내드립니다.</p>
                    		<span class="start-100  badge rounded-pill bg-danger" style="height: 20px; width: 25px;">
    							2<span class="visually-hidden">unread messages</span>
 						 	</span>
 						</div>
 						
 						<hr style="margin-top: -1%; margin-bottom: 1%; border: 1px solid #B5B5B5;">
 						
 						<div class="chatInfo" style="padding-bottom: 20px;">
 							<div class="cost">
 								<div class="krw" style="width: 110%;">
 									<div class="krwIcon" style="border: 1px solid gray; border-radius: 5px; height: 20px; width: 20px; margin-right: 3.5%; font-size: 14px;">₩</div>
 									<div style="font-size: 14px;">시간 당 230,000원</div>
 								</div>
 							</div>
 							<div class="date" style="font-size: 14px; color: #B5B5B5;">
 								2023. 11. 23
 							</div>
 						</div>
                    </button>
                </div>
                
                <div class="chats" style="border: 1px solid rgb(242, 242, 242); border-radius: 10px; margin-top: 2%; margin-bottom: 4%">
                	<button class="chat" style="width: 95%;">
                	
                		<div class="provider_profile" style="width: 100%; padding-top: 20px; margin-bottom: 16px;">
                			<div class="provider_profileInfo">
                        		<img src="../image/1.png" style="width: 52px; height: 52px; border-radius: 25%; border: 1px solid #F3F3F3; margin-right: 6%">
                        		<div class="profileInfo" style="margin-top: 2.5%;">
                            		<div class="provider_name" style="font-size: 16px; width: max-content;"><strong>심리상담사 OOO</strong></div>
                            		<div class="service_name" style="font-size: 14px; color: #737373;">성인 심리상담</div>
                        		</div>
                        	</div>
                        	<div class="form-check">
  								<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" onchange="updateButtonColor()" style="width: 20px; height: 20px;">
  								<label class="form-check-label" for="flexCheckChecked"></label>
							</div>
                    	</div>
                    	
                    	<div class="chat_content">
                    		<p style="font-size: 14px;">OOO 고객님, 안녕하세요. 예상 금액 보내드립니다.</p>
                    		<span class="start-100  badge rounded-pill bg-danger" style="height: 20px; width: 25px;">
    							2<span class="visually-hidden">unread messages</span>
 						 	</span>
 						</div>
 						
 						<hr style="margin-top: -1%; margin-bottom: 1%; border: 1px solid #B5B5B5;">
 						
 						<div class="chatInfo" style="padding-bottom: 20px;">
 							<div class="cost">
 								<div class="krw" style="width: 110%;">
 									<div class="krwIcon" style="border: 1px solid gray; border-radius: 5px; height: 20px; width: 20px; margin-right: 3.5%; font-size: 14px;">₩</div>
 									<div style="font-size: 14px;">시간 당 130,000원</div>
 								</div>
 							</div>
 							<div class="date" style="font-size: 14px; color: #B5B5B5;">
 								2023. 11. 23
 							</div>
 						</div>
                    </button>
                </div>
            </div>
            <div class="fixed-bottom" style="width: 100%; background-color:#fff; display:flex; justify-content: center;align-items: center;">
                <div class="d-grid gap-2 col-3 mx-auto mb-3" style="background-color: white;">
  					<button id="exitButton" class="btn btn-primary" type="button" style="height: 110%; border: 1px solid #B5B5B5; background-color: #B5B5B5;">나가기</button>
				</div>
			</div>
			 
        </div>
   </div>
  
  
   <script type="text/javascript">
   function updateButtonColor() {
	    // 체크된 체크박스 개수 확인
	    var checkedCheckboxes = document.querySelectorAll('input[type="checkbox"]:checked');
	    
	    // 나가기 버튼 가져오기
	    var exitButton = document.getElementById('exitButton');

	    // 하나 이상의 체크박스가 선택되었는지 확인하고 버튼의 색상을 변경
	    if (checkedCheckboxes.length > 0) {
	      exitButton.style.backgroundColor = '#6387A6';
	    } else {
	      exitButton.style.backgroundColor = '#B5B5B5';
	    }
	  }
   
  
   </script>
</body>
</html>
