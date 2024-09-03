<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#btn_logout").on('click', function(){
				fn_logout();
			});
			
			$("#btn_mypage").on('click', function(){
				var frm = $("#logoutFrm");
				frm.attr("method", "POST");
				frm.attr("action", "/mypage.do")
				frm.submit();
			});
		});
		
		
		
		function fn_logout(){
			var frm = $("#logoutFrm");
			frm.attr("method", "POST");
			frm.attr("action", "/logout.do")
			frm.submit();
		}
		
	</script>
</head>
<header>
<form id="logoutFrm" name="logoutFrm">
</form>
<label>${loginInfo.id }님 환영합니다.</label>
<input type="button" id="btn_mypage" name="btn_mypage" value="마이페이지"/>
<input type="button" id="btn_logout" name="btn_logout" value="로그아웃"/>
</header>