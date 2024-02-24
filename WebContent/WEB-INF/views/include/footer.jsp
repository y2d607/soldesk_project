<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<c:set var="root" value="${pageContext.request.contextPath }"/>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>footer</title>

<script src="${root}/script/jquery-3.4.1.min.js"></script>

</head>

 <style>
	@font-face {
		font-family: 'GmarketSansMedium';
		src:
			url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
		font-weight: normal;
		font-style: normal;
	}

	body,
	div,
	span,
	h5,
	button,
	h2,
	ul,
	li,
	a {
		font-family: 'GmarketSansMedium' !important;

	}
	  
	  nav>div>ul>li{
		   font-family:'GmarketSansMedium' !important;
	  }
	  
	 	.nav-item{
			 font-family:'GmarketSansMedium' !important;
		 }
    	
    	.button-custom {
        background-color: #6387A6; /* 사용자 정의 배경색을 지정 */
        color: white;
    	}
    	
		.button-custom:hover {
        background-color: #88a2bf; /* 마우스를 올렸을 때 좀 더 밝은 색상으로 변경 */
      
    	}
    	
    	.list-group-item {
	        border: none; /* 모든 테두리를 제거 */
	        border-bottom: 1px solid #dee2e6; /* 아래 선만 지정 */
	    }
    
	    .logo{
			width: 80px;
			height: 110px;
			
		}
		
		.navbar-custom{
			background-color: #D9E8F5;
		}
		
 </style>
<body>	
	
	<footer class="py-5 navbar-custom" style="margin-top: 150px; background-color: navbar-color;">
		<div class="container px-5">
			<div class="row">
				<div class="col-lg-3">
					<!-- Left side content -->
					<img src="${root }/image/logo4.png" alt="푸터 로고"
						style="max-width: 80%; height: 150px; margin-bottom: 5px;">
				</div>
				<div class="col-lg-6">
					<!-- Right side content -->
					<p class="text" style="margin-top: 12px; size:29px; font-size:17px;">
						아직도 숨어있나 <br>
						전화번호: 123-456-7890<br>
						주소: 솔데스크<br>
						이메일: info@soom.co.kr<br>
						Copyright &copy; 2023 soom ALL RIGHTS RESERVED
					</p>
				</div>
			</div>
		</div>
	</footer>
	
 
</body>
</html>