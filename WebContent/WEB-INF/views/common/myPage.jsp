<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage</title>
<script src="${root}/script/jquery-3.4.1.min.js"></script>
 
 <style>
		#a_comment-board-title:hover{
			color :#fff;
		}
		
		.move{
			color: black;
			text-decoration: none;
		}
 </style>
</head>

<body>
		<!-- 네비부분 -->
<c:import url="/WEB-INF/views/include/header.jsp" />
	<!--여기까지 네비부분-->
	<!--본문-->
	<div class="container mx-auto mt-5 mb-5" style="width:50%;">
		<div class="mb-5">
			<h2>마이페이지</h2>
		</div>
		<ul class="list-group list-group-flush mx-auto">
		 <li class="list-group-item">
           <div class="row mt-3">
               
                  
               <div class="col-sm-2 text-center">
                  <c:choose>
                     <c:when test="${loginProuserBean.prouserLogin == false && loginUserBean.userLogin == true }">
                        <img src="${root }/image/user-solid.svg" style="height: 100px; width: 80px; border-radius: 10px;" />
                     </c:when>
                     <c:when test="${loginProuserBean.prouserLogin == true && loginUserBean.userLogin == false }">
                     <c:if test="${empty profileImgInfo  }">
                     	<img src="${root }/image/user-solid.svg" style="height: 100px; width: 80px; border-radius: 10px;" />
                     </c:if>
                     <c:if test="${not empty profileImgInfo }">
                     	<img src="${root }/upload/${profileImgInfo}" style="height: 100px; width: 80px; border-radius: 10px;">
                     </c:if>
                        
                     </c:when>
                     
                  </c:choose>
                
                  
               </div>
               
               <div class="col-sm-10 mt-3">
                     <div class="row">
                         <div class="col-9 col-sm-6">
                             <c:choose>
                                 <c:when test="${loginProuserBean.prouserLogin == false && loginUserBean.userLogin == true }">
                                     <b>${loginUserBean.user_name }</b>
                                     <br>
                                     <p class=""><a>${loginUserBean.user_email} </a></p>
                                 </c:when>
                                 <c:when test="${loginProuserBean.prouserLogin == true && loginUserBean.userLogin == false }">
                                     <b>${loginProuserBean.pro_name }</b>
                                     <br>
                                     <p class=""><a>${loginProuserBean.pro_email} </a>
                                 </c:when>
                             </c:choose>
                         </div>
         
                         <div class="col-12 col-sm-6 text-center mt-3">
                             <c:choose>
                                 <c:when test="${loginProuserBean.prouserLogin == true && loginUserBean.userLogin == false}">
                                     <button class="btn button-custom" onclick="location.href='${root}/pro/expert?id=${param.id }'">상세프로필</button>
                                 </c:when>
                             </c:choose>
                             <button class="btn button-custom account" onclick="location.href='${root}/common/AccountSetting?id=${param.id }'">계정설정</button>
                         </div>
                     </div>
                 </div>
               
            </div>
        </li>
		  
		   <c:if test="${loginProuserBean.prouserLogin == false}">
		  <li class="list-group-item mt-3"> 
			        <h4><b>일류찾기</b></h4>
			        <div class="mt-3 mb-3" style="font-size: 17px;" onclick="location.href='${root }/common/saved?id=${param.id}'" >
			            <p style="cursor:pointer">찜한 일류</p>
			        </div> 
			</li>
		   </c:if> 
		  <li class="list-group-item mt-3">
			  <h4><b>커뮤니티</b></h4>
			  <div class="mt-3 mb-3" style="font-size: 17px;">
				  <a class="move" href="${root}/common/myPosts">작성글/댓글</a>
			  </div>
		  </li> 
		  <li class="list-group-item mt-3">
			  <h4><b>일정</b></h4>
			  <div class="mt-3 mb-3" style="font-size: 17px;">
				  <a class="move" href="${root}/common/calendar">캘린더</a>
			  </div>
		  </li> 
		</ul>
	</div>
	
	
	<!--여기까지 본문 -->
	<!--푸터-->
<c:import url="/WEB-INF/views/include/footer.jsp" />
	 
	</body>
</html>