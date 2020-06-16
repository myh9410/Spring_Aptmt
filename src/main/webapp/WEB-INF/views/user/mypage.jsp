<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<meta name="keywords" content="" />
<meta name="description" content="" />

<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"/>
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link href="static/css/index.css" rel="stylesheet" type="text/css" media="all"/>
<link href="static/css/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="static/css/fonts.css" rel="stylesheet" type="text/css" media="all" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<script>
	window.onload=function(){
		let fav = localStorage.getItem("fav");
		let favList = JSON.parse(fav);
		favList.forEach(function(element){
			var myPick = element.split('※');
			var no = myPick[0].trim();
			var dong = myPick[1].trim();
			var AptName = myPick[2].trim();
			var dealAmount = myPick[4].trim();
			var buildYear = myPick[5].trim();
			var dealDate = myPick[6].trim()+"."+myPick[7].trim()+"."+myPick[8].trim();
			document.getElementById("favTable").innerHTML += '<td>'+no+'</td>' + '<td>'+dong+'</td>' + '<td>'+AptName+'</td>' + '<td>'+dealAmount+'</td>' + 
			'<td>'+buildYear+'</td>' + '<td>'+dealDate+'</td>' + 
			'<td><button type="button" class="btn btn-warning" onclick="removeFav('+no+')">삭제</button></td>';
		})
	}
	function removeFav(no){
		var tmp = [];
		let fav = localStorage.getItem("fav");
		let favList = JSON.parse(fav);
		favList.forEach(function(element){
			var myPick = element.split('※');
			var noInList = myPick[0].trim();
			if (noInList != no){
				tmp.push(element);
			}
		})
		let data = JSON.stringify(tmp);
		localStorage.setItem("fav",data);
		alert("즐겨찾기 목록에서 삭제되었습니다!");
		location.href="${root}/mypage";
	}
</script>
</head>
<body>
	<div id="header-wrapper">
		<div id="header" class="container">
			<div id="logo">
				<span class="icon icon-home"></span>
				<h1>
					<a href="${root}/mypage">HappyHouse-마이페이지</a>
				</h1>

			</div>
			<div id="triangle-up"></div>
		</div>
	</div>
	<div id="menu-wrapper">
      <div id="menu">
         <ul>
            <li class="current_page_item"><a href="${root}/" accesskey="1" title="">HomePage</a></li>
            <li><a href="${root}/logout" accesskey="2" title="">로그아웃</a></li>
            <li><a href="${root}/mvqna" accesskey="3" title="">QnA게시판</a></li>
            <li><a href="${root}/mypage" accesskey="7" title="">마이페이지</a></li>
            <li><a href="${root}/update" accesskey="4" title="">회원정보수정</a></li>
            <li><a href="${root}/find?key=&value=" accesskey="5" title="">회원정보검색</a></li>
            <li><a href="${root}/aptlist?pg=1&key=&word=" accesskey="6" title="">전체아파트목록</a></li>
         </ul>
      </div>
	</div>
	<div id="wrapper">
		<div id="featured-wrapper">
			<table class="table table-hover" id="favTable">
				<tr>
					<th>번호</th>
					<th>동</th>
					<th>아파트 이름</th>
					<th>거래 가격</th>
					<th>건축 년도</th>
					<th>거래 일자</th>
					<th>목록에서 삭제</th>
				</tr>
			</table>
		</div>
	</div>
	<div id="stamp" class="container">
		<div class="hexagon">
			<span class="icon icon-user"></span>
		</div>
	</div>
	<div id="copyright" class="container"></div>
</body>
</html>