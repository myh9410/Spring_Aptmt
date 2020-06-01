<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<title>SSAFY-아파트 목록</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"/>
		<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
		<link href="css/default.css" rel="stylesheet" type="text/css" media="all" />
		<link href="css/fonts.css" rel="stylesheet" type="text/css" media="all" />
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
		<script>
		function goback() {
			location.href="${root}/index";
		}
		function movewrite() {
			location.href="${root}/main.do?act=mvwrite";
		}
		function searchApt() {
			var pg = document.getElementById("pg").value;
			var key = document.getElementById("key").value;
			var word = document.getElementById("word").value;
			document.getElementById("searchform").action = "${root}/api/aptlist?pg="+pg+"&key="+key+"&word="+word;
			document.getElementById("searchform").submit();
		}
		function pageMove(pg) {
			document.getElementById("pg").value=pg;
			var key = document.getElementById("key").value;
			var word = document.getElementById("word").value;
			document.getElementById("pageform").action = "${root}/aptlist?pg="+pg+"&key="+key+"&word="+word;
			document.getElementById("pageform").submit();
		}
		</script>
	</head>
	<body>
<div id="header-wrapper">
   <div id="header" class="container">
      <div id="logo">
         <span class="icon icon-home"></span>
         <h1><a href="${root}/aptlist?pg=1&key=&word">HappyHouse - 아파트 조회</a></h1>
         
      </div>
      <div id="triangle-up"></div>
   </div>
</div>
<div id="menu-wrapper">
      <div id="menu">
         <ul>
            <li class="current_page_item"><a href="${root}/index.jsp" accesskey="1" title="">HomePage</a></li>
            <c:if test="${userinfo != null}">
            <li><a href="${root}/main.do?act=logout" accesskey="2" title="">로그아웃</a></li>
            </c:if>
            <li><a href="${root}/main.do?act=mvmodify" accesskey="3" title="">회원정보수정</a></li>
            <li><a href="${root}/main.do?act=mvsearchmember" accesskey="4" title="">회원정보검색</a></li>
            <li><a href="${root}/aptlist?pg=1&key=&word=" accesskey="5" title="">전체아파트목록</a></li>
         </ul>
	</div>
</div>	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b80b37a7379bee362585cf8b7603b61a"></script>
	<form name="pageform" id="pageform" method="GET" action="">
		<input type="hidden" name="act" id="act" value="aptlist">
		<input type="hidden" name="pg" id="pg" value="">
		<input type="hidden" name="key" id="key" value="${key}">
		<input type="hidden" name="word" id="word" value="${word}">
	</form>
	<div id="featured-wrapper">
	<div class="container" align="center">
	
		<div class="col-lg-8" align="center">
			<h2>아파트 목록</h2>
			<table class="table table-borderless">
	  			<tr>
			  		<td align="right">
			  			<button type="button" class="btn btn-dark" onclick="javascript:goback();">돌아가기</button>
			  		</td>
		  		</tr>
	  		</table>
			<form id="searchform" method="get" class="form-inline" action="">
				<input type="hidden" name="act" id="act" value="aptlist">
				<input type="hidden" name="pg" id="pg" value="1">
				<table class="table table-borderless">
					<tr>
						<td align="right">
						<select class="form-control" name="key" id="key">
							<option value="dong" selected="selected">동 이름</option>
							<option value="AptName">아파트 이름</option>
						</select> 
						 <input type="text" class="form-control" placeholder="검색어 입력" name="word" id="word">
			 			 <button type="button" class="btn btn-primary" onclick="javascript:searchApt();">검색</button>
						</td>
					</tr>
				</table>
			</form>
			<c:if test="${list.size() != 0}">
				<c:forEach var="aptlist" items="${list}">
					<table style="text-align: center;" class="table table-hover">
						<tbody>
							<tr class="table-dark">
								<td>번호</td>
								<td>동</td>
								<td width=350px;>아파트이름</td>
								<td>거래금액</td>
								<td>거래종류</td>
							</tr>
							<tr>
								<td>${aptlist.no}</td>
								<td>${aptlist.dong}</td>
								<td width=350px;>${aptlist.aptName}</td>
								<td>${aptlist.dealAmount}</td>
								<td>아파트매매</td>
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
			</c:if>

			<c:if test="${list.size() == 0}">
				<table class="table table-active">
					<tbody>
						<tr class="table-info" align="center">
							<td>조회되지 않았습니다.</td>
						</tr>
					</tbody>
				</table>
			</c:if>
		</div>
		<div id="map" style="width:1000px;height:900px;margin-bottom:100px;">
      		<script>
         		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
         		console.log(container);
         		var options = { //지도를 생성할 때 필요한 기본 옵션
         			center: new kakao.maps.LatLng(37.5743822, 126.9688505), //지도의 중심좌표.
         			level: 2 //지도의 레벨(확대, 축소 정도)
         		};
         		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
         		<c:forEach items="${loclist}" var="locs">
	         		var coords = new kakao.maps.LatLng("${locs.lat}", "${locs.lng}");
	         		var marker = new kakao.maps.Marker({
	                    position: coords
	                });
	            	marker.setMap(map);
         		</c:forEach>
         		map.setCenter(coords);
      		</script>
   		</div>
	</div>
	</div>
	<div id="stamp" class="container">
	<div class="hexagon"><span class="icon icon-user"></span></div>
</div>
<div id="copyright" class="container"></div>
	</body>
</html>