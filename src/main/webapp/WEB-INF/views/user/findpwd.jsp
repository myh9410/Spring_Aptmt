<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>

<html lang="ko" xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>SSAFY-비밀번호 찾기</title>
<meta charset="utf-8">
<meta name="keywords" content="" />
<meta name="description" content="" />

<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" rel="stylesheet" />
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link href="static/css/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="static/css/fonts.css" rel="stylesheet" type="text/css" media="all" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
function findpwd() {
	var email = $("#memberform input[name=emailid]").val()+"@"+$("#memberform select[name=emaildomain]").val();
	$.ajax({
    	type:'POST',
        url:'${root}/findpwd',
        headers:{"Content-Type":"application/json"},
		data: JSON.stringify({	
			username: $("#memberform input[name=username]").val(),
			userid: $("#memberform input[name=userid]").val(),				  
			email: email
		}),
        success:function(data){
            window.location.href="${root}/findpwdsuccess";
        },
        error:function(data){
        	alert("비밀번호 못찾음!");
	        window.location.href="${root}/";
	    }
    });
}
</script>
</head>
<body>
<div id="header-wrapper">
   <div id="header" class="container">
      <div id="logo">
         <span class="icon icon-home"></span>
         <h1><a href="${root}/user/findpwd">HappyHouse - 비밀번호 찾기</a></h1>
         
      </div>
      <div id="triangle-up"></div>
   </div>
</div>
<div id="menu-wrapper">
      <div id="menu">
         <ul>
            <li class="current_page_item"><a href="${root}/" accesskey="1" title="">HomePage</a></li>
            <li><a href="${root}/find?key=&value=" accesskey="4" title="">회원정보검색</a></li>
            <li><a href="${root}/aptlist?pg=1&key=&word=" accesskey="5" title="">전체아파트목록</a></li>
         </ul>
      </div>
</div>
<div id="featured-wrapper">
	<div class="container" align="center">
		<div class="col-lg-6" align="center">
			<form id="memberform" method="post" action="">
			<input type="hidden" name="act" id="act" value="">
				<div class="form-group" align="left">
					<label for="name">이름</label>
					<input type="text" class="form-control" id="username" name="username" placeholder="">
				</div>
				<div class="form-group" align="left">
					<label for="">아이디</label>
					<input type="text" class="form-control" id="userid" name="userid" placeholder="">
				</div>
				<div class="form-group" align="left">
					<label for="email">이메일</label><br>
					<div id="email" class="custom-control-inline">
					<input type="text" class="form-control" id="emailid" name="emailid" placeholder="" size="25"> @
					<select class="form-control" id="emaildomain" name="emaildomain">
						<option value="naver.com">naver.com</option>
						<option value="google.com">google.com</option>
						<option value="daum.net">daum.net</option>
						<option value="nate.com">nate.com</option>
						<option value="hanmail.net">hanmail.net</option>
					</select>
					</div>
				</div>
				<div class="form-group" align="center">
					<button type="button" class="btn btn-primary" id="registerBtn" onclick="javascript:findpwd()">비밀번호 찾기</button>
					<button type="reset" class="btn btn-warning">초기화</button>
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