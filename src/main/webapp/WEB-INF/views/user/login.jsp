<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set> <!-- root = requset.getContextPath() -->
<c:if test="${cookie.ssafy_id.value}">
	<c:set var="svid" value="${cookie.ssafy_id.value}"/>
	<c:set var="ckid" value="checked"/>
</c:if>
<script type="text/javascript">
function login() {
	if(document.getElementById("userid").value == "") {
		alert("아이디 입력!!!");
		return;
	} else if(document.getElementById("userpwd").value == "") {
		alert("비밀번호 입력!!!");
		return;
	} else {
		document.getElementById("loginform").action = "${root}/main.do?act=login";
		//<input type="hidden" name="act" value="login">아래의 아이디, 비밀번호 등의 값들을 넘겨줌
		document.getElementById("loginform").submit();
	}
}
	 
function moveJoin() {
	document.location.href = "${root}/main.do?act=mvjoin";
}

function mvfindpwd() {
	document.location.href = "${root}/main.do?act=mvfindpwd";
}
</script>
</head>
<body>
<div id="menu-wrapper">
      <div id="menu">
         <ul>
            <li class="current_page_item"><a href="${root}/index.jsp" accesskey="1" title="">HomePage</a></li>
            <li><a href="${root}/main.do?act=mvsearchmember" accesskey="2" title="">회원정보검색</a></li>
            <li><a href="${root}/main.do?act=aptlist&pg=1&key=&word=" accesskey="5" title="">전체아파트목록</a></li>
         </ul>
      </div>
</div>
<div id="wrapper">
	<div id="featured-wrapper">
		<div class="container" align="center">
			<div class="col-lg-6" align="center">
			<form id="loginform" method="post" action="">
			<input type="hidden" name="act" value="login">
				<div class="form-group" align="left">
					<label for="">아이디</label>
					<input type="text" class="form-control" id="userid" name="userid" placeholder="" value="${svid}">
				</div>
				<div class="form-group" align="left">
					<label for="">비밀번호</label>
					<input type="password" class="form-control" id="userpwd" name="userpwd" placeholder="" onkeydown="javascript:if(event.keyCode == 13) {login();}">
				</div>
				<div class="form-group form-check" align="right">
			    	<label class="form-check-label">
			      	<input class="form-check-input" type="checkbox" id="idsave" name="idsave" value="saveok"${ckid}> 아이디저장
			    	</label>
				</div>
				<div class="form-group" align="center">
					<button type="button" class="btn btn-warning" onclick="javascript:login();">로그인</button>
					<button type="button" class="btn btn-dark" onclick="javascript:mvfindpwd();">비밀번호 찾기</button>
					<button type="button" class="btn btn-primary" onclick="javascript:moveJoin();">회원가입</button>
				</div>
			</form>
			</div>
		</div>
	</div>
</div>
<div id="stamp" class="container">
	<div class="hexagon"><span class="icon icon-user"></span></div>
</div>
<div id="copyright" class="container">
</div>