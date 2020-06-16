<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>SSAFY-회원정보수정</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link href="static/css/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="static/css/fonts.css" rel="stylesheet" type="text/css" media="all" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
function modify() {
	var email = $("#memberform input[name=emailid]").val()+"@"+$("#memberform select[name=emaildomain]").val();
	var address = $("#memberform input[name=address]").val()+"^^"+$("#memberform input[name=address_detail]").val();
	$.ajax({
    	type:'POST',
        url:'${root}/modify',
        headers:{"Content-Type":"application/json"},
		data: JSON.stringify({				  
			username: $("#memberform input[name=username]").val(),
			userpwd: $("#memberform input[name=userpwd]").val(),
			email: email,
			address: address
		}),
        success:function(data){
        	alert("정보 수정 완료!")
            window.location.href="${root}/";
        },
        error:function(data){
        	alert("수정 실패!");
	        window.location.href="${root}/";
	    }
    });
}
function cancel() {
   document.location.href = "${root}/";
}
</script>
</head>
<body>
<div id="header-wrapper">
   <div id="header" class="container">
      <div id="logo">
         <span class="icon icon-home"></span>
         <h1><a href="${root}/update">HappyHouse<br>회원정보수정</a></h1>
         
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
<div id="wrapper">
   <div id="featured-wrapper">
      <div class="container" align="center">
         <div class="col-lg-6" align="center">
         <form id="memberform" method="post" action="">
            <input type="hidden" name="act" id="act" value="">
               <div class="form-group" align="left">
                  <label for="name">이름</label>
                  <input type="text" class="form-control" id="username" name="username" placeholder="" value="${userinfo.username}">
               </div>
               <div class="form-group" align="left">
                  <label for="">비밀번호</label>
                  <input type="password" class="form-control" id="userpwd" name="userpwd" placeholder="" value="${userinfo.userpwd}">
               </div>
               <div class="form-group" align="left">
                  <label for="email">이메일</label><br>
                  <div id="email" class="custom-control-inline">
                  <c:forEach var="email" items="${fn:split(userinfo.email,'@')}" varStatus="status">
                     <c:if test="${status.first}"><c:set var="emailid" >${email}</c:set></c:if>
                     <c:if test="${status.last}"><c:set var="emaildomain" >${email}</c:set></c:if>
                  </c:forEach>
                  <input type="text" class="form-control" id="emailid" name="emailid" placeholder="" size="25" value="${emailid}"> @
                  <select class="form-control" id="emaildomain" name="emaildomain" >
                     <option value="naver.com" <c:if test="${emaildomain eq 'naver.com'}">selected</c:if>>naver.com</option>
                     <option value="google.com" <c:if test="${emaildomain eq 'google.com'}">selected</c:if>>google.com</option>
                     <option value="daum.net" <c:if test="${emaildomain eq 'daum.net'}">selected</c:if>>daum.net</option>
                     <option value="nate.com" <c:if test="${emaildomain eq 'nate.com'}">selected</c:if>>nate.com</option>
                     <option value="hanmail.net" <c:if test="${emaildomain eq 'hanmail.net'}">selected</c:if>>hanmail.net</option>
                  </select>
                  </div>
               </div>
               <div class="form-group" align="left">
                  <label for="">주소</label><br>
                  <div id="addressdiv" class="custom-control-inline">
                     <input type="text" class="form-control" id="zipcode" name="zipcode" placeholder="우편번호" size="7" maxlength="5" readonly="readonly">
                  </div>
                  <c:set var="tmp" value="${fn:split(userinfo.address,'^^')}" />
                  <c:forEach var="address_split" items="${tmp}" varStatus="status">
                     <c:if test="${status.first}"><c:set var="address1" >${tmp[0]}</c:set></c:if>
                     <c:if test="${status.last}"><c:set var="address2" >${tmp[1]}</c:set></c:if>
                  </c:forEach>
                  <input type="text" class="form-control" id="address" name="address" placeholder="" value="${address1}">
                  <input type="text" class="form-control" id="address_detail" name="address_detail" placeholder="" value="${address2}">
               </div>
               <div class="form-group" align="center">
                  <button type="button" class="btn btn-primary" id="registerBtn" onclick="javascript:modify()">수정</button>
                  <button type="reset" class="btn btn-warning" onclick="javascript:cancel()">취소</button>
               </div>
            </form>
         </div>
      </div>
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