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
		<link href="static/css/default.css" rel="stylesheet" type="text/css" media="all" />
		<link href="static/css/fonts.css" rel="stylesheet" type="text/css" media="all" />
		
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
			document.getElementById("searchform").action = "${root}/aptlist?pg="+pg+"&key="+key+"&word="+word;
			document.getElementById("searchform").submit();
		}
		function pageMove(pg) {
			document.getElementById("pg").value=pg;
			var key = document.getElementById("key").value;
			var word = document.getElementById("word").value;
			document.getElementById("pageform").action = "${root}/aptlist?pg="+pg+"&key="+key+"&word="+word;
			document.getElementById("pageform").submit();
		}
		function saveAptInfo(apt) {
			const housedeal = apt.split('※');
			var dong = housedeal[1].trim();
			document.getElementById('specDong').innerHTML = dong;
			var AptName = housedeal[2].trim();
			document.getElementById('specAptName').innerHTML = AptName;
			var dealAmount = housedeal[4].trim();
			document.getElementById('specDealAmount').innerHTML = dealAmount;
			var buildYear = housedeal[5].trim();
			document.getElementById('specBuildYear').innerHTML = buildYear;
			var dealDate = housedeal[6].trim()+"."+housedeal[7].trim()+"."+housedeal[8].trim();
			document.getElementById('specDealDate').innerHTML = dealDate;
		}
		
		function saveLocalStorage(apt){
			if (${userinfo != null}){
				if (localStorage.getItem("fav") != null) {
					const favList = JSON.parse(localStorage.getItem("fav"));
					favList.push(apt);
					let data = JSON.stringify(favList);
					localStorage.setItem("fav",data);
					alert("즐겨찾기 목록에 추가되었습니다!");
				}
				else {
					const favList = [];
					favList.push(apt);
					let data = JSON.stringify(favList);
					localStorage.setItem("fav",data);
					alert("즐겨찾기 목록에 추가되었습니다!");
				}
			} else {
				alert("우선 로그인을 해주세요!");
				location.href="${root}/";				
			}
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
            <li class="current_page_item"><a href="${root}/" accesskey="1" title="">HomePage</a></li>
            <c:if test="${userinfo != null}">
            <li><a href="${root}/logout" accesskey="2" title="">로그아웃</a></li>
            <li><a href="${root}/mvqna" accesskey="3" title="">QnA게시판</a></li>
            <li><a href="${root}/mypage" accesskey="7" title="">마이페이지</a></li>
            </c:if>
            <li><a href="${root}/update" accesskey="4" title="">회원정보수정</a></li>
            <li><a href="${root}/find?key=&value=" accesskey="5" title="">회원정보검색</a></li>
            <li><a href="${root}/aptlist?pg=1&key=&word=" accesskey="6" title="">전체아파트목록</a></li>
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
								<td>즐겨찾기 추가</td>
							</tr>
							<tr>
								<td><a data-toggle="modal" data-target="#aptmodal" onclick="javacript:saveAptInfo('${aptlist}')">${aptlist.no}</a></td>
								<td>${aptlist.dong}</td>
								<td width=350px;>${aptlist.aptName}</td>
								<td>${aptlist.dealAmount}</td>
								<td>아파트매매</td>
								<td><button type="button" class="btn btn-warning" onclick="saveLocalStorage('${aptlist}');">추가</button></td>
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
			<!-- modal -->
			<div class="modal fade bs-example-modal-sm" tabindex="-1" id="aptmodal">
     			<div class="modal-dialog modal-sm">
       				<div class="modal-content">
       			  		<div class="modal-header">
           					<h4 class="modal-title" id="mySmallModalLabel">아파트 상세 정보</h4>
         				</div>
         				<div class="modal-body">
         					<table class="table table-hover">
           					<tr>
           						<td>동</td>
           						<td id="specDong"></td>
           					</tr>
           					<tr>
           						<td>아파트 이름</td>
           						<td id="specAptName"></td>
           					</tr>
           					<tr>
           						<td>거래 가격</td>
           						<td id="specDealAmount"></td>
           					</tr>
           					<tr>
           						<td>건축 년도</td>
           						<td id="specBuildYear"></td>
           					</tr>
           					<tr>
           						<td>거래 일자</td>
           						<td id="specDealDate"></td>
           					</tr>
           					</table>
         				</div>
           				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">닫기</span></button>
       				</div>
     			</div>
			</div>
			
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
	      		function makeOverListener(map, marker, infowindow) {
	      		    return function() {
	      		        infowindow.open(map, marker);
	      		    };
	      		}
	      		function makeOutListener(infowindow) {
	      		    return function() {
	      		        infowindow.close();
	      		    };
	      		}
         		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
         		var options = { //지도를 생성할 때 필요한 기본 옵션
         			center: new kakao.maps.LatLng(37.5743822, 126.9688505), //지도의 중심좌표.
         			level: 6 //지도의 레벨(확대, 축소 정도)
         		};
         		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
         		var lat_avg = 0; 
         		var lng_avg = 0; 
         		<c:forEach items="${list}" var="locs">
         			console.log('${locs}');
         			lat_avg+=${locs.lat};
         			lng_avg+=${locs.lng};
         			var infowindow = new kakao.maps.InfoWindow({
         			    content : '<div>${locs.aptName}</div>',
         			});
	         		var coords = new kakao.maps.LatLng(${locs.lat}, ${locs.lng});
	         		var marker = new kakao.maps.Marker({
	                    position: coords
	                });
	            	marker.setMap(map);
	            	kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
	                kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
         		</c:forEach>
         		map.setCenter(new kakao.maps.LatLng(lat_avg/10, lng_avg/10));
      		</script>
   		</div>
	</div>
	</div>
	<div id="stamp" class="container">
	<div class="hexagon"><span class="icon icon-home"></span></div>
</div>
<div id="copyright" class="container"></div>
	</body>
</html>