<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/css/egovframework/login.css"/>
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function(){
		$("#btn_login").on('click', function(){
			fn_login();
		});
	});

	function fn_createAccount(){
		var frm = $("#frm");
		frm.attr("method", "POST");
		frm.attr("action", "/join.do");
		frm.submit();
	}
	
	function fn_login(){
		var frm = $("#frm").serialize();
		$.ajax({
		    url: '/member/loginAction.do',
		    method: 'post',
		    data : frm,
		    dataType : 'json',
		    success: function (data, status, xhr) {
		        if(data.resultChk){
		        	location.href="/main.do";
		        }else{
		        	alert("로그인에 실패하였습니다.");
		        	return;
		        }
		    },
		    error: function (data, status, err) {
		    	console.log(err);
		    }
		});
	}
</script>
</head>
<body>
<form id="frm" name="frm">
	<table>
	    <tr>
	        <td><h2>로그인</h2></td>
	    </tr>
	    <tr>
	        <td><input type="text" placeholder="ID" id="id" name="id"></td>
	    </tr>
	    <tr>
	        <td><input type="password" placeholder=Password id="pwd" name="pwd"></td>
	    </tr>
	    <tr>
	       <td><input type="checkbox"> 로그인 정보 저장</td>
	    </tr>
	   <tr>
	        <td><input type="button" value="Sign in" class="btn" id="btn_login" name="btn_login"></td>
	    </tr>
	    <tr>
	        <td class="join"><a href="javascript:fn_createAccount();">회원가입</a></td>
	    </tr>
	</table>
</form>
</body>
</html>