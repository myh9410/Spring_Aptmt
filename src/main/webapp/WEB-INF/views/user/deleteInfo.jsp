<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>

<html lang="ko" xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>SSAFY-회원 탈퇴</title>
<meta charset="utf-8">
<meta name="keywords" content="" />
<meta name="description" content="" />

<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" rel="stylesheet" />
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link href="../css/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="../css/fonts.css" rel="stylesheet" type="text/css" media="all" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#registerBtn").click(function() {
		
		if($("#userpwd").val() == "") {
			alert("비밀번호 입력!!!");
			return;
		} else {
			$("#memberform").attr("action", "${root}/main.do?act=deleteInfo").submit();
		}
	});
	 
	$('#zipcode').focusin(function() {
		$('#zipModal').modal();
	});
});

function goback() {
	location.href="${root}/index.jsp";
}
</script>
</head>
<body>
<div id="header-wrapper">
   <div id="header" class="container">
      <div id="logo">
         <span class="icon icon-home"></span>
         <h1><a href="${root}/user/findpwd.jsp">HappyHouse - 회원 탈퇴</a></h1>
         
      </div>
      <div id="triangle-up"></div>
   </div>
</div>
<div id="menu-wrapper">
      <div id="menu">
         <ul>
            <li class="current_page_item"><a href="${root}/index.jsp" accesskey="1" title="">HomePage</a></li>
            <li><a href="${root}/main.do?act=mvsearchmember" accesskey="4" title="">회원정보검색</a></li>
            <li><a href="${root}/main.do?act=aptlist&pg=1&key=&word=" accesskey="5" title="">전체아파트목록</a></li>
         </ul>
      </div>
</div>
<div id="featured-wrapper">
	<div class="container" align="center">
		<div class="col-lg-6" align="center">
			<form id="memberform" method="post" action="">
			<input type="hidden" name="act" id="act" value="/main.do?act=deleteInfo">
	
				<div class="form-group" align="left">
					<label for="">비밀번호</label>
					<input type="text" class="form-control" id="userpwd" name="userpwd" placeholder="" value="${userinfo.userpwd}">
				</div>
				
				<div class="form-group" align="center">
					<button type="button" class="btn btn-primary" id="registerBtn">탈퇴</button>
					<button type="button" class="btn btn-dark" onclick="javascript:goback();">돌아가기</button>
				</div>
			</form>
		</div>
	</div>
</div>
<div id="stamp" class="container">
	<div class="hexagon"><span class="icon icon-user"></span></div>
</div>
<div id="copyright" class="container"></div>
</body>
</html>