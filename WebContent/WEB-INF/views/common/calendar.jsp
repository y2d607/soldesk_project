<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<!-- 화면 해상도에 따라 글자 크기 대응(모바일 대응) -->

<!-- jquery CDN -->

<script src="${root}/script/jquery-3.4.1.min.js"></script>

<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<!-- jquery CDN -->

<!-- jQuery UI 라이브러리 -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- fullcalendar CDN -->
<link
	href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css'
	rel='stylesheet' />

<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<!-- fullcalendar 언어 CDN -->
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>


<script>
	var jq = $.noConflict();
</script>
<style>
/* body 스타일 */
html, body {
	font-size: 14px;
	overflow-y: auto;
}

/* 캘린더 위의 해더 스타일(날짜가 있는 부분) */
.fc-header-toolbar {
	padding-top: 1em;
	padding-left: 1em;
	padding-right: 1em;
}

/* 모달 스타일 */
#customModal {
	display: none;
	max-width: 500px; /* 모달 최대 너비 설정 */
	background-color: white;
}

.fc-col-header-cell-cushion {
	color: black;
	text-decoration: none;
}

.fc-daygrid-day-number {
	text-decoration: none;
	color: black;
}
</style>
</head>
<body>

	<!-- calendar 태그 -->

	<c:import url="/WEB-INF/views/include/header.jsp" />
	<div class="container mt-5">
		<div id='calendar'></div>
	</div>
	<c:import url="/WEB-INF/views/include/footer.jsp" />

	<!--모달-->
	<!--모달-->
	<div id="customModal" title="일정추가"
		style="display: none; width: auto; max-width: 100%;">
		<form:form action="${root}/mypage/calendar_pro" method="post"
			id="calendarForm">
			<!-- 일정 내용 입력란 -->
			<label for="eventTitle"
				style="display: block; margin-bottom: 5px; font-size: 18px;">일정을
				추가하세요</label>
			<textarea type="text" id="eventTitle" name="calendar_memo"
				style="width: 100%; height: 300px; padding: 5px; margin-bottom: 10px; box-sizing: border-box; font-size: 18px;"></textarea>

			
		</form:form>
	</div>
	
	

	<script>
		var calendar; // calendar 객체를 전역 변수로 선언
		var calendar_Id;

		function loadEventsFromServer() {
			 jq.ajax({
			        type: "GET",
			        url: "${root}/common/calendar_events",
			        dataType: "json",
			        //data: {
			            // 일반 회원인 경우
			         //   user_id: ${loginUserBean.isUserLogin() ? loginUserBean.user_id : null},
			            // 일류 회원인 경우
			        //    pro_id: ${loginProuserBean.isProuserLogin() ? loginProuserBean.pro_id : null}
			       // },
			        success: function (data) {
			            // data에는 서버에서 반환한 JSON 데이터가 들어있음
			            // 이를 활용하여 로직을 구현
			            successCallback(data);
			        },
			        error: function (error) {
			            console.error("서버에서 이벤트 로드 중 오류 발생:", error);
			        }
			    });
		}

		function successCallback(response) {
			//console.log("서버 응답:", response);

			// 서버에서 받아온 데이터를 캘린더의 events 배열에 추가
			response.forEach(function(eventData) {
				console.log("Fetched calendar_id from server:", eventData.calendar_Id);
				
				calendar_Id = eventData.calendar_Id;
				calendar.addEvent({
					id: eventData.calendar_Id, // 서버에서 받아온 calendar_id 사용
					title: eventData.calendar_memo,
		            start: convertTimestampToISO(eventData.start_date),
		            end: eventData.end_date ? convertTimestampToISO(eventData.end_date) : null
		           
				});
			});
			
			console.log("calendar_id after loading events:", calendar_Id);

			console.log("Events loaded successfully from the server.");

			console.log("서버에서 이벤트 성공적으로 로드됨.");

			// 캘린더를 그립니다.
			calendar.render();
		}

		function parseDate(dateString) {
		    // dateString이 문자열이 아닌 경우 빈 문자열 반환
		    if (typeof dateString !== 'string') {
		        return '';
		    }

		    // dateString을 파싱하여 Date 객체 반환
		    var parts = dateString.split(' ');

		    // 필요한 예외 처리 등을 추가할 수 있음
		    if (parts.length !== 2) {
		        console.error('Invalid date format:', dateString);
		        return '';
		    }

		    var dateParts = parts[0].split('/');
		    var timeParts = parts[1].split(':');

		    var year = parseInt(dateParts[2], 10) + 2000; // Assuming years in 2000s
		    var month = parseInt(dateParts[1], 10) - 1; // Months are zero-based
		    var day = parseInt(dateParts[0], 10);
		    var hours = parseInt(timeParts[0], 10);
		    var minutes = parseInt(timeParts[1], 10);
		    var seconds = parseInt(timeParts[2], 10);

		    var parsedDate = new Date(year, month, day, hours, minutes, seconds);

		    // 유효한 Date 객체인지 확인 후, ISO 형식으로 반환
		    if (!isNaN(parsedDate.getTime())) {
		    	
		        return parsedDate.toISOString();
		        
		    } else {
		        console.error('Invalid date:', dateString);
		        return '';
		    }
		}
		
		function convertTimestampToISO(timestamp) {
		    // 타임스탬프가 밀리초 단위로 제공된다고 가정
		    var date = new Date(timestamp);

		    // ISO 형식으로 변환하여 반환
		    return date.toISOString();
		}

		// 예제 사용
		//var timestamp = 1708182000000;
		//var isoDateString = convertTimestampToISO(timestamp);

		// 결과 출력
		//console.log("time: " + isoDateString);


		jq(function() {
			// calendar element 취득
			var calendarEl = jq('#calendar')[0];
			// full-calendar 생성하기
			calendar = new FullCalendar.Calendar(calendarEl, {
				height : '700px', // calendar 높이 설정
				expandRows : true, // 화면에 맞게 높이 재설정
				slotMinTime: '00:00',
			    slotMaxTime: '00:00', // Day 캘린더에서 종료 시간
				// 해더에 표시할 툴바
				headerToolbar : {
					left : 'prev,next today',
					center : 'title',
					right : 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
				},
				initialView: 'dayGridMonth',
				 displayEventTime: false,
			    navLinks: true,
			    editable: true,
			    selectable: true,
			    nowIndicator: true,
			    dayMaxEvents: true,
			    
				locale : 'ko', // 한국어 설정
				eventTimeFormat: { hour: 'numeric', minute: '2-digit', meridiem: false },
				select : function(arg) {
					// 드래그로 이벤트를 생성할 때 모달 창 열기
					openCustomModal(arg.start, arg.end, arg.allDay);

				},

				eventClick: function(info) {
					var eventId = info.event.id;
					console.log("Selected calendar event ID:", eventId);
					    
				    var startDate = info.event.start.toLocaleDateString();
				    var endDate = info.event.end ? info.event.end.toLocaleDateString() : startDate;
				    openCustomModal(startDate, endDate, info.event.allDay, info.event.title, info.event);
				},
				eventAdd : function(obj) { // 이벤트가 추가되면 발생하는 이벤트
					//console.log(obj);

				},

				eventChange : function(obj) { // 이벤트가 수정되면 발생하는 이벤트
					console.log(obj);
				},

				eventRemove : function(obj) { // 이벤트가 삭제되면 발생하는 이벤트
					console.log(obj);
				}
			});

			// 사용자에게 입력을 받을 모달 창을 열기 위한 함수
			function openCustomModal(start, end, allDay, title, event, memo,
					arg) {
				jq("#eventTitle").val(title || "");

				jq("#customModal").dialog(
						{
							modal : true,
							buttons : {
								"저장": function () {
				                    if (event) {
				                        // 이벤트가 전달되면 기존 이벤트 수정
				                        saveEvent(start, end, allDay, jq("#eventTitle").val(), event);
				                        sendUpdatedEventToServer(event);  // 수정된 이벤트 정보를 서버에 전송
				                        location.reload();
				                    } else {
				                        // 이벤트가 전달되지 않으면 새 이벤트 추가
				                        saveEvent(start, end, allDay, jq("#eventTitle").val());
				                        sendSelectedDateToServer(start);  // 새로 추가된 이벤트 정보를 서버에 전송
				                        location.reload();
				                    }
				                    jq(this).dialog("close");
				                },
								"삭제" : function() {
									removeEvent(event);  // 이벤트 삭제
				                    sendDeletedEventToServer(event);  // 삭제된 이벤트 정보를 서버에 전송
				                    jq(this).dialog("close");
				                    location.reload();
								},
								"취소" : function() {
									jq(this).dialog("close");
								}
							},
							close : function() {
								jq("#eventTitle").val("");
							}
						});
				calendar.render();
			}

			function saveEvent(start, end, allDay, title, event) {
				if (start) {
					if (event) {
						event.setProp('title', title);
						event.setStart(start);
						event.setEnd(end);
						event.setAllDay(allDay);
					} else {
						calendar.addEvent({
							title : title,
							start : start,
							end : end,
							allDay : allDay
						});
					}
					calendar.unselect();
				}
			}
			function sendSelectedDateToServer(selectedDate) {

				var formattedDate = formatDate(selectedDate);
				
				// 시작 시간에 2시간 추가해서 종료 시간 설정
			    var endDate = new Date(selectedDate);
			    endDate.setHours(endDate.getHours() + 2);
			    var formattedEndDate = formatDate(endDate);

				// 메모 값을 가져오기
				var memo = jq("#eventTitle").val();
				console.log("Memo value:", memo);
				
				// 콘솔에 현재 로그인한 사용자의 ID 찍어보기
			    console.log("Current login user ID:", ${loginUserBean.isUserLogin()});
			    console.log("Current login user ProID:", ${loginProuserBean.isProuserLogin()});

				console.log("Sending selected date and memo:", formattedDate,
						memo);
				console.log("Memo value:", memo);
				
				 // 회원의 종류에 따라 ID 설정
			    var userId;
			    var proId;

			    if (${loginUserBean.isUserLogin()} !== false) { // 널이 아니라면 
			        userId = ${loginUserBean.user_id};
			        proId = null;  // 회원의 종류가 일반 회원인 경우
			    } else if (${loginProuserBean.pro_id} !== false) {
			        userId = null;  // 회원의 종류가 일류 회원인 경우
			        proId = ${loginProuserBean.pro_id};
			    }

				jq.ajax({
					type : "POST",
					url : "${root}/common/calendar_pro",
					data : {
						start_date : formattedDate,
						end_date: formattedEndDate,
						calendar_memo : memo,
						user_id: userId,  // 로그인한 사용자의 ID를 전송
			            pro_id: proId  // 로그인한 프로 회원의 ID를 전송
					// 메모 정보를 추가
					},
					success : function(response) {
						console.log("Server response:", response);
						console.log(
								"Selected date and memo sent successfully:",
								response);
					},
					error : function(error) {
						console.error("Error sending selected date and memo:",
								error);
					}
				});
			}
			
			function sendUpdatedEventToServer(event) {
				var formattedStartDate = formatDate(event.start);

				 var formattedEndDate = formatDate(event.end);

				// 수정된 메모 값을 가져오기
			    var updatedMemo = jq("#eventTitle").val();
			    console.log("Updated Memo value:", updatedMemo);

		        console.log("Sending updated event info to server:", updatedMemo);
		        console.log("Sending updated event info to server with calendar_id:", event.id);
		        console.log("formattedStartDate:", formattedStartDate);
		        console.log("formattedEndDate:", formattedEndDate);

		        jq.ajax({
		            type: "POST",
		            url: "${root}/common/calendar_modify/" + event.id,
		            data: {
		                id: event.id,  // 기존 이벤트의 ID를 전송
		                start_date: formattedStartDate,
		                end_date: formattedEndDate,
		                calendar_memo: updatedMemo,
		                user_id: ${loginUserBean.user_id},  // 로그인한 사용자의 ID를 전송
			            pro_id: ${loginProuserBean.pro_id} 
		            },
		            success: function (response) {
		            	console.log("Server response:", response);
						console.log(
								"Selected date and memo sent successfully update:",
								response);
		            },
		            error: function (error) {
		                console.error("Error sending updated event info:", error);
		            }
		        });
		    }

			// Date 객체를 'yyyy-mm-dd hh:mm:ss' 형식의 문자열로 변환하는 함수
			function formatDate(date) {
				 if (!date) {
				        return null; // date가 null이면 null 반환
				    }
				
				var year = date.getFullYear();
			    var month = (date.getMonth() + 1).toString().padStart(2, '0');
			    var day = date.getDate().toString().padStart(2, '0');
			    var hours = date.getHours().toString().padStart(2, '0');
			    var minutes = date.getMinutes().toString().padStart(2, '0');
			    var seconds = date.getSeconds().toString().padStart(2, '0');
			    return year + '-' + month + '-' + day + ' ' + hours + ':' + minutes + ':' + seconds;
			}
			

			function removeEvent(event) {
				if (event) {
					event.remove();
				}
				calendar.unselect();
			}
			
			function sendDeletedEventToServer(event) {
		        if (event) {
		            var calendar_Id = event.id;
		            console.log("Sending delete event info to server with calendar_id:", calendar_Id);
		            jq.ajax({
		                type: "POST",
		                url: "${root}/common/calendar_delete/" + calendar_Id,
		                success: function (response) {
		                    console.log("Server response:", response);
		                    console.log("Deleted event successfully:", response);
		                },
		                error: function (error) {
		                    console.error("Error deleting event:", error);
		                }
		            });
		        }
		    }

			loadEventsFromServer();

			//calendar.render();

		});
	</script>

</body>
</html>