<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>

<html lang="ko" xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>SSAFY-회원가입</title>
<meta charset="utf-8">
<meta name="keywords" content="" />
<meta name="description" content="" />

<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" rel="stylesheet" />
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link href="css/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/fonts.css" rel="stylesheet" type="text/css" media="all" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	   $("#registerBtn").click(function(){
	       var pw = $("#userpwd").val();
	       var num = pw.search(/[0-9]/g);
	       var eng = pw.search(/[a-z]/ig);
	       var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

	      if($("#username").val() == "") {
	         alert("이름 입력!!!");
	         return;
	      } else if($("#userid").val() == "") {
	         alert("아이디 입력!!!");
	         return;
	      } else if($("#userpwd").val() == "") {
	         alert("비밀번호 입력!!!");
	         return;
	      } else if($("#userpwd").val() != $("#pwdcheck").val()) {
	         alert("비밀번호 확인!!!");
	         return;
	      }else if(pw.length < 8 || pw.length > 10){
	           alert("8자리 ~ 10자리 이내로 입력해주세요.");
	           return false;
	      }else if(pw.search(/\s/) != -1){
	           alert("비밀번호는 공백 없이 입력해주세요.");
	           return false;
	      }else if( (num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0) ){
	           alert("영문,숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.");
	           return false;
	      }else {
	    	 var email = $("#memberform input[name=emailid]").val()+"@"+$("#memberform select[name=emaildomain]").val();
	    	 var address = $("#memberform input[name=address]").val()+" "+$("#memberform input[name=address_detail]").val();
	    	 $.ajax({
	    	    	type:'POST',
	    	        url:'${root}/join',
	    	        headers:{"Content-Type":"application/json"},
	    			data: JSON.stringify({				  
	    				username: $("#memberform input[name=username]").val(),
	    				userid: $("#memberform input[name=userid]").val(),
	    				userpwd: $("#memberform input[name=userpwd]").val(),
	    				email: email,
	    				address: address
	    			}),
	    	        success:function(data){
	    	        	alert("회원가입 완료!")
	    	            window.location.href="${root}/";
	    	        },
	    	        error:function(data){
	    	        	alert("회원가입 실패!");
	    		        window.location.href="${root}/";
	    		    }
	    	 });
	      }
	   });
	   $('#zipcode').focusin(function() {
	      $('#zipModal').modal();
	   });
	});
</script>
</head>
<body>
<div id="header-wrapper">
   <div id="header" class="container">
      <div id="logo">
         <span class="icon icon-home"></span>
         <h1><a href="${root}/user/join.jsp">HappyHouse - 회원가입</a></h1>
         
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
	            <input type="text" class="form-control" id="username" name="username" placeholder=""/>
	         </div>
	         <div class="form-group" align="left">
	            <label for="">아이디</label>
	            <input type="text" class="form-control" id="userid" name="userid" placeholder=""/>
	         </div>
	         <div class="form-group" align="left">
	            <label for="">비밀번호</label>
	            <input type="password" class="form-control" id="userpwd" name="userpwd" placeholder=""/>
	         </div>
	         <div class="form-group" align="left">
	            <label for="">비밀번호재입력</label>
	            <input type="password" class="form-control" id="pwdcheck" name="pwdcheck" placeholder=""/>
	         </div>
	         <div class="form-group" align="left">
	            <label for="email">이메일</label><br>
	            <div id="email" class="custom-control-inline">
	            <input type="text" class="form-control" id="emailid" name="emailid" placeholder="" size="25"/> @
	            <select class="form-control" id="emaildomain" name="emaildomain">
	               <option value="naver.com">naver.com</option>
	               <option value="google.com">google.com</option>
	               <option value="daum.net">daum.net</option>
	               <option value="nate.com">nate.com</option>
	               <option value="hanmail.net">hanmail.net</option>
	            </select>
	            </div>
	         </div>
	         <div class="form-group" align="left">
	            <label for="">주소</label><br>
	            <div id="addressdiv" class="custom-control-inline">
	               <input type="text" class="form-control" id="zipcode" name="zipcode" placeholder="우편번호" size="7" maxlength="5" readonly="readonly"/>
	               <!--<button type="button" class="btn btn-primary" onclick="javascript:">우편번호</button>-->
	            </div>
	            <input type="text" class="form-control" id="address" name="address" placeholder=""/>
	            <input type="text" class="form-control" id="address_detail" name="address_detail" placeholder="" value=""/>
	         </div>
	         <div class="form-group" align="center">
	            <button type="button" class="btn btn-primary" id="registerBtn" onclick="javascript:join()">회원가입</button>
	            <button type="reset" class="btn btn-warning">초기화</button>
	         </div>
	      </form>
	   </div>
	</div>

	<div id="zipModal" class="modal fade" role="dialog">
	<h5 class="modal-title" id="myModalLabel">우편번호검색</h5>
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header text-center">
	                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                    <span aria-hidden="true">×</span>
	                </button>
	            </div>    
	            <div class="modal-body text-center">
	               <form id = "zip_codeForm">
	                  <div align="center">
	                     <label>도로명 주소검색</label>
	                  </div>
	               <div class="input-group" align="left">
	                  <input type="text" class="form-control" id="doro" name="doro" placeholder="검색 할 도로명 입력(예: 대왕판교로, 학하서로)">
	                  <span class="input-group-btn">
	                  <input type="submit" class="btn btn-warning" value="검색" id="searchBtn">
	                  </span>
	               </div>
	                </form>
	                <div style="width:100%; height:200px; overflow:auto">
	                   <table class = "table text-center">
	                      <thead>
	                      <tr>
	                         <th style="width:150px;">우편번호</th>
	                         <th style="width:600px;">주소</th>
	                      </tr>
	                      </thead>
	                      <tbody id="zip_codeList"></tbody>
	                   </table>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
</div>
<div id="stamp" class="container">
	<div class="hexagon"><span class="icon icon-user"></span></div>
</div>
<div id="copyright" class="container">
</div>
</body>
</html>