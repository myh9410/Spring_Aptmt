<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>SSAFY - HappyHouse</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<meta name="keywords" content="" />
<meta name="description" content="" />

<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" rel="stylesheet" />
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link href="static/css/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="static/css/fonts.css" rel="stylesheet" type="text/css" media="all" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b80b37a7379bee362585cf8b7603b61a"></script>

		<script type="text/javascript">
		function goback() {
			location.href="${root}/";
		}
		function searchmember(){
			if(document.getElementById("value").value == "") {
				alert("모든 목록 조회!!");
			}
			var value = document.getElementById("value").value;
			var key = document.getElementById("key").value;
			location.href = "${root}/find?key="+key+"&value="+value;
		}
		</script>
<title>HappyHouse - 회원 검색</title>
</head>
<body>
<div id="header-wrapper">
   <div id="header" class="container">
      <div id="logo">
         <span class="icon icon-home"></span>
         <h1><a href="${root}/find?key=&value=">HappyHouse - 회원 검색</a></h1>
         
      </div>
      <div id="triangle-up"></div>
   </div>
</div>
<div id="menu-wrapper">
      <div id="menu">
         <ul>
            <li class="current_page_item"><a href="${root}/" accesskey="1" title="">HomePage</a></li>
            <c:if test="${userinfo != null}">
            <li><a href="${root}/logout" accesskey="2" title="">로그아웃</a></li>
            <li><a href="${root}/mvqna" accesskey="3" title="">QnA게시판</a></li>
            <li><a href="${root}/mypage" accesskey="7" title="">마이페이지</a></li>
            </c:if>
           	<li><a href="${root}/find?key=&value=" accesskey="4" title="">회원정보검색</a></li>
            <li><a href="${root}/aptlist?pg=1&key=&word=" accesskey="5" title="">전체아파트목록</a></li>
         </ul>
      </div>
</div>
<div id="featured-wrapper">
	<div class="container" align="center">
	
		  <div class="col-lg-8" align="center">
		  <h2>회원 목록</h2>  
		  <table class="table table-borderless">
		  	<tr>
		  		<td align="right">
		  			<button type="button" class="btn btn-dark" onclick="javascript:goback();">돌아가기</button>
		  		</td>
		  	</tr>
		  </table>
		  <form id="searchform" method="get" class="form-inline" action="">
		  <input type="hidden" name="act" value="searchmember">
		  <table class="table table-borderless">
		  	<tr>
		  		<td align="right">
			  	  <select class="form-control" name="key" id="key">
				    <option value="userid" selected="selected">회원 아이디</option>
				    <option value="username">회원 이름</option>
				  </select>
				  <input type="text" class="form-control" placeholder="입력" name="value" id="value">
				  <button type="button" class="btn btn-primary" onclick="javascript:searchmember();">검색</button>
				</td>
		  	</tr>
		  </table>
		  </form>
		  
		  <c:forEach var="user" items="${users}">
		  
		  <table class="table table-hover">
		    <tbody>
		      <tr class = "table-dark">
		        <td colspan="2">회원 아이디 : ${user.userid}</td>
		      </tr>
		      <tr>
		        <td colspan="2">회원 이메일 : ${user.email}</td>
		      </tr>
		      
		    </tbody>
		  </table>
		  
		  </c:forEach>
			<table>
	  				<tr>
	  					<td>
	  						<!-- page 출력부분 -->
	  						${navigation.navigator}
	  					</td>
	  				</tr>
	  		</table>
		  </div>
	</div>
</div>
<div id="stamp" class="container">
	<div class="hexagon"><span class="icon icon-user"></span></div>
</div>
<div id="copyright" class="container"></div>
</body>
</html>