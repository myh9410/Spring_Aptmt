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

<link rel="stylesheet" type="text/css" href="css/index.css"/>
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" rel="stylesheet" />
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link href="css/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/fonts.css" rel="stylesheet" type="text/css" media="all" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b80b37a7379bee362585cf8b7603b61a"></script>
<script>
	function deleteIn() {
		location.href="${root}/user/deleteInfo";
	}

</script>
</head>
<body>
<div id="header-wrapper">
   <div id="header" class="container">
      <div id="logo">
         <i class="icon-home"></i>
         <h1><a href="${root}/">HappyHouse</a></h1>
         
      </div>
      <div id="triangle-up"></div>
   </div>
</div>

<div align="center">
	<c:if test="${userinfo eq null}"> <!-- if (memberDto == null) -->
      <h3>${msg}</h3>
      <%@ include file="/WEB-INF/views/user/login.jsp" %>
	</c:if> <!-- if문 종료 -->
	<c:if test="${userinfo != null}"> <!-- else문이 없으므로 조건 적어줘야됨 -->
	<!-- 로그인 여부는 session을 이용하여 판단 -->
	<div id="menu-wrapper">
      <div id="menu">
         <ul>
            <li class="current_page_item"><a href="${root}/index.jsp" accesskey="1" title="">HomePage</a></li>
            <li><a href="${root}/logout" accesskey="2" title="">로그아웃</a></li>
            <li><a href="${root}/main.do?act=mvmodify" accesskey="3" title="">회원정보수정</a></li>
            <li><a href="${root}/find?key=&value=" accesskey="4" title="">회원정보검색</a></li>
            <li><a href="${root}/aptlist?pg=1&key=&word=" accesskey="5" title="">전체아파트목록</a></li>
         </ul>
      </div>
	</div>
	<div id="wrapper">
		<div id="featured-wrapper">
   			<strong>${userinfo.username}(${userinfo.userid})</strong>님 <br>환영합니다. <!-- el로 표현하면 html에 가까워짐  -->
		</div>
	</div>
	<table class="table table-borderless">
	  			<tr>
			  		<td align="right">
			  			<button type="button" class="btn btn-dark" onclick="javascript:deleteIn();">회원탈퇴</button>
			  		</td>
		  		</tr>
	  		</table>
	<div id="stamp" class="container">
		<div class="hexagon"><i class="icon-home"></i></div>
	</div>
	<div id="copyright" class="container"></div>

   </c:if>
</div>
</body>
</html>