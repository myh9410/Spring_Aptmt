<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set> <!-- root = requset.getContextPath() -->
<c:if test="${cookie.ssafy_id.value ne null}">
	<c:set var="saveid" value="${cookie.ssafy_id.value}"/>
	<c:set var="idck" value=" checked=\"checked\""/>
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
	    var userid = $("#loginform input[name=userid]").val();
	    var userpwd = $("#loginform input[name=userpwd]").val();   
	    $.ajax({
	    	type:'GET',
	        url:'${root}/login?userid='+userid+'&userpwd='+userpwd,
	        success:function(data){
	        	alert($("#loginform input[name=userid]").val()+ " 로그인 성공!");
	            window.location.href="${root}/";
	         },
 	        error:function(data){
	        	alert("아이디 혹은 비밀번호를 다시 확인해주세요!");
		        window.location.href="${root}/";
		    }
	    });
	}
}
	 
function moveJoin() {
	document.location.href = "${root}/mvjoin";
}

function mvfindpwd() {
	document.location.href = "${root}/mvfindpwd";
}
</script>
</head>
<body>
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
			<div class="col-lg-6" align="center">
			<form id="loginform" method="post" action="">
			<input type="hidden" name="act" value="login">
				<div class="form-group" align="left">
					<label for="">아이디</label>
					<input type="text" class="form-control" id="userid" name="userid" placeholder="" value="${saveid}">
				</div>
				<div class="form-group" align="left">
					<label for="">비밀번호</label>
					<input type="password" class="form-control" id="userpwd" name="userpwd" placeholder="" onkeydown="javascript:if(event.keyCode == 13) {login();}">
				</div>
				<div class="form-group form-check" align="right">
			    	<label class="form-check-label">
			      		<input class="form-check-input" type="checkbox" id="idsave" name="idsave" value="saveok"${idck}> 아이디저장 
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