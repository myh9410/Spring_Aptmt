<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>
<html lang=en>
<head>
<meta charset=utf-8>
<meta http-equiv=X-UA-Compatible content="IE=edge">
<meta name=viewport content="width=device-width,initial-scale=1">
<link rel=icon href=/favicon.ico>
<link rel=stylesheet
	href=https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css
	integrity=sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh
	crossorigin=anonymous>
<title>vue-qna-bef</title>
<link rel=stylesheet
	href=https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css
	integrity=sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh
	crossorigin=anonymous>
<script src=https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/moment.min.js></script>
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"/>
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link href="static/css/index.css" rel="stylesheet" type="text/css" media="all"/>
<link href="static/css/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="static/css/fonts.css" rel="stylesheet" type="text/css" media="all" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>

<link href=/happyhouse/static/js/app.1407812a.js rel=preload as=script>
<link href=/happyhouse/static/js/chunk-vendors.cbe815fd.js rel=preload as=script>
</head>
<body>
	<noscript>
		<strong>We're sorry but vue-qna-bef doesn't work properly
			without JavaScript enabled. Please enable it to continue.</strong>
	</noscript>
	<div id="header-wrapper">
		<div id="header" class="container">
        	<div id="logo">
            	<i class="icon icon-home"></i>
            	<h1><a href="javascript:location.reload()">HappyHouse - Q&A게시판</a></h1>
            </div>
            <div id="triangle-up"></div>
        </div>
      </div>
      <div align="center">
      <div id="menu-wrapper">
      	<div id="menu">
        	<ul>
            	<li class="current_page_item"><a href="${root}/" accesskey="1" title="">HomePage</a></li>
                <li><a href="${root}/find?key=&value=" accesskey="4" title="">회원정보검색</a></li>
                <li><a href="${root}/aptlist?pg=1&key=&word=" accesskey="5" title="">전체아파트목록</a></li>
            </ul>
        </div>
      </div>
      <div id="wrapper">
      	<div id="featured-wrapper">
        	<div class="container" align="center">
				<div id=app></div>
          	</div>
        </div>
      </div>
      <div id="stamp" class="container">
		<div class="hexagon"><span class="icon icon-home"></span></div>
	</div>
	<div id="copyright" class="container"></div>
	</div>
	<script src=/happyhouse/static/js/chunk-vendors.cbe815fd.js></script>
	<script src=/happyhouse/static/js/app.1407812a.js></script>
</body>
</html>