<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Question</title>
<script src="${root}/script/jquery-3.4.1.min.js"></script>
	<style>
		#a_comment-board-title:hover {
			color: #fff;
		}

		.star {
			color: #FFE500;
		}

		.lig {
			color: grey;
		}

		.profileimage {
			width: 70px;
			height: 90px;
		}
		.progress-container {
		    background-color: #ddd;
		    border-radius: 4px;
		    position: fixed; /* 수정된 부분: 화면에 고정 */
		    top: 12%; /* 수정된 부분: 화면 위에 고정 */
		    left: 50%; /* 수정된 부분: 가운데 정렬을 위해 50% 위치로 이동 */
		    transform: translateX(-50%); /* 수정된 부분: 가운데 정렬 */
		    z-index: 1000; /* 수정된 부분: 다른 요소들 위에 표시되도록 설정 */
		} 	
		.progress-bar-empty {
		    width: 100%;
		    height: 15px;
		    background-color: lightgray; /*게이지바 테두리 바 여기서 설정해주세요*/
		    border-radius: 4px; /* 둥근 모서리 설정 */
		}
		
		.progress-bar-fill {
		    width: 0%; /*초기값은 0으로 설정하기 */
		    height: 15px;
		    background-color: #6387A6; /*게이지 색깔은 여기서 정해주세요*/
		    text-align: center;
		    line-height: 30px;
		    color: white;
		    position: absolute;
		    top: 0;
		    left: 0;
		    border-radius: 4px;
		    transition: width 2s ease;
		}
		
		#progress-text {
		    position: absolute;
		    right: 5px;
		    color: black;
		}
		
		.question-container {
            width: 200px;
            background-color: white;
            padding: 2em;
            border-top-left-radius: 5px;
            border-top-right-radius: 15px;
            border-bottom-left-radius: 15px;
            border-bottom-right-radius: 15px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            margin: auto;
            position: relative;
            margin-top: 30px;
            display: none;
            font-size: 20px;
            left:-40px;
        }
        
          /* 추가한 스타일 */
        .question {
            margin-top: 40px;
        }

        .question-form {
            width: 400px;
            background-color: white;
            padding: 2em;
            border-top-left-radius: 5px;
            border-top-right-radius: 15px;
            border-bottom-left-radius: 15px;
            border-bottom-right-radius: 15px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            margin: auto;
            position: relative;
            left: -360px;
        }

        .question-title {
            margin-bottom: 1em;
            font-size: 20px;
        }

        .radio-label {
            display: block;
            position: relative;
            padding-left: 35px;
            margin-bottom: 12px;
            font-size: 20px;
        }

        .radio-input {
            position: absolute;
            cursor: pointer;
            margin-left: -27px;
            margin-top: 4px;
        }

        .submit-button {
            width: 100%;
            padding: 15px;
            background-color: #606060;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        
		.answer-form {
		    width: 200px;
		    background-color: white;
		    padding: 2em;
		    border-top-left-radius: 15px;
		    border-top-right-radius: 5px;
		    border-bottom-left-radius: 15px;
		    border-bottom-right-radius: 15px;
		    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
		    margin: auto; 
		    position: relative;
		   	left:699px;
		    font-size: 20px;
		}
		
		#header-container{
			position: fixed;
			top: 0;
			width: 100%;
			background-color: white;
			z-index: 1000;
		}
	
	</style>
</head>

<body style="background-color: #EEEEEE;">

		<div id="header-container">
			<c:import url="/WEB-INF/views/include/header.jsp" />
	
			<div class="progress-container" style="margin: 20px auto; width: 50%;">
				<div class="progress-bar-empty"></div>
				<div class="progress-bar-fill" id="myProgressBar">
					<span id="progress-text">0%</span>
				</div>
			</div>
		</div>
    
    
    <div class="question-container questionname" style="left:-456px; margin-top: 190px;">
        ${param.detail_category_name}
    </div> 
	   <div class="form-container">
        <div class="firstformset" id="questionForm">
           <c:forEach var="question" items="${requestScope[serviceCategoryname]}">
               <div class="question-form questionform mt-5 mb-5" data-question="${question.key}">
                   <div class="question-title">${question.key}</div>
                   <c:forEach var="value" items="${question.value}">
                       <label class="radio-label">
                           <input type="radio" name="answer" value="${value}" class="radio-input" style="margin-top: 6px;">
                           ${value}
                       </label>
                   </c:forEach> 
           		<input type="button" value="확인" class="submit-button submitbtn">
               </div> 
           </c:forEach> 
        </div>
		 <div class="firstanswer">
		    <div class="question answerrr" style="margin-top: 40px;">
		        <div class="answer-form answerform me-5" style="display: none;">
		          <!-- 여기에 사용자가 선택한 질문이 위치하는 코드 --> 
		        </div>
		    </div>
		</div>
	</div>
 <script>
        $(document).ready(function () {

            // 선택된 값들을 저장할 배열
			var selectedAnswers = [];

			selectedAnswers.push($(".firstformset .question-form:first").fadeIn(400));
            setTimeout(function () {
                $(".questionname").fadeIn(400);
            }, 1000);
            
            	$(".firstformset .questionform").hide(); // 모든 질문 숨김
            	
            setTimeout(function () { 
            	$(".firstformset .question-form:first").fadeIn(400); // 첫 번째 질문을 페이드 인
            }, 1500);

            /* 프로그레스바 */
          	var totalQuestions = $(".firstformset .questionform").length; // 질문의 총 개수
			var progressBar = document.getElementById("myProgressBar");
			var currentProgress = 0;
			
			function updateProgressBar() {
			    currentProgress = (currentQuestionIndex / totalQuestions) * 100;
			    currentProgress = isNaN(currentProgress) ? 0 : currentProgress; // 만약 NaN이면 0으로 설정
			    currentProgress = currentProgress > 100 ? 100 : currentProgress;
			    progressBar.style.width = currentProgress + '%';
			    document.getElementById("progress-text").innerText = currentProgress.toFixed(2) + '%';
			}

			// 초기 상태에서 0%로 설정
			updateProgressBar();
 
        	var currentQuestionIndex = 0;
            var questions = $(".firstformset .questionform");
            //questions.css('margin-top', '90px');
            var answersContainer = $(".firstanswer");
            /* 확인버튼을 누르면 */
            
            $(document).on('click', '.submitbtn', function () {
                var selectedAnswer = $("input[name='answer']:checked").val();

                console.log("사용자가선택한 값", selectedAnswer); 
                if (selectedAnswer) {
                    var questionForm = questions.eq(currentQuestionIndex);
                    var answerForm = $("<div class='answer-form answerform'></div>"); 
                    // 선택된 값들을 배열에 추가 
                 	// 기존 질문과 답변을 유지하면서 새로운 질문에 대한 컨테이너를 생성
                    //answerForm.html("<div class='user-message message'>" + selectedAnswer + "</div>").hide();
                    // 만약 "기타"를 선택한 경우 textarea 값을 가져와서 추가 
                    if (selectedAnswer === "기타" || selectedAnswer==="작성") {
                        var textareaValue = questionForm.find('.user-textarea').val();
                        console.log("작성한 글",textareaValue);
                        questionForm.append(answerForm);
                        answerForm.append(textareaValue);
                        selectedAnswers.push(textareaValue);
                    } else {
                    	 // 선택한 대답을 추가
                        selectedAnswers.push(selectedAnswer);
                        // 선택한 대답을 추가
                    	questionForm.append(answerForm);
                    	answerForm.append(selectedAnswer);
                    }
                    answerForm.css('float', 'right');   
                    answerForm.fadeIn(400);
                    currentQuestionIndex++;

                    if (currentQuestionIndex < questions.length) {
                        // 다음 질문이 있으면 해당 질문을 보여줌
                        var nextQuestionForm = questions.eq(currentQuestionIndex);
                        questionForm.find('.radio-label').hide(); // 현재 질문의 보기 숨기기
                        nextQuestionForm.fadeIn(400); 
                        // 다음 질문에 대한 답변 컨테이너를 생성
                        var nextAnswerForm = $("<div class='answer-form answerform'></div>").hide();
                        answerForm.append(nextAnswerForm); 
                        
                        // 스크롤을 다음 질문에 대한 답변 컨테이너로 이동
                        $('html, body').animate({
                            scrollTop: answerForm.offset().top
                        }, 400); 
                        
                    }  else {
                    	  // 마지막 질문인 경우 선택된 값들을 파라미터에 추가하여 URL 생성
                        //selectedAnswers.push(selectedAnswer); // 선택된 값 배열에 추가

                        // 선택된 값들을 URL의 쿼리 문자열로 변환
                        var queryString = '';
                        for (var i = 0; i < selectedAnswers.length; i++) {
                            if (queryString !== '') {
                                queryString += '&';
                            }
                            queryString += 'selectedAnswers=' + encodeURIComponent(selectedAnswers[i]);
                        }

                        // 새로운 URL 생성
                        var selected = queryString;
 
                        // 마지막 질문일 경우 특정 페이지로 이동
                        window.location.href = '${root}/received_quotation?s=${param.service_category_id}&reco=${param.detail_category_name}&select='+selected; 
                    } 
                    updateProgressBar(); // 프로그레스바 업데이트
                }else { 
                    alert("값을 선택해 주세요");
                }
            });
            
            // 라디오 버튼이 변경될 때 이벤트 리스너 추가
            $('.radio-input').on('change', function () {
                var selectedValue = $(this).val();
                console.log("선택한 값", selectedValue);

                // 이전에 생성된 textarea가 있다면 숨기기
                $('.user-textarea').hide();

                if (selectedValue === "기타" || selectedValue==="작성") {
                    // "기타"를 선택한 경우 textarea 추가
                    var textarea = $("<textarea class='user-textarea' style='width:100%'></textarea>");
                    // 현재 라디오 버튼 바로 다음에 textarea를 추가
                    $(this).parent().append(textarea);
                }
            });

        });
 		</script>
	</body>
</html>