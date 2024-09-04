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
		$("#btn_certification").on('click', function(){
			fn_certification();
		});
	});
	
	function fn_certification(){

		var frm = $("#frm").serialize();
		$.ajax({
		    url: '/certification.do',
		    method: 'post',
		    data : frm,
		    dataType : 'json',
		    success: function (data, status, xhr) {
		        if(data.memberIdx > 0){
		        	alert("인증되었습니다.");
		        	$("#memberIdx").val(data.memberIdx);
		     		var frm = $("#frm");
		     		frm.attr("method", "POST");
		     		frm.attr("action", "/settingPwd.do");
		     		frm.submit();
		        }else{
		        	alert("인증에 실패하였습니다.");
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
	<input type="hidden" id="memberIdx" name="memberIdx" value=""/>
	<table>
	    <tr>
	        <td><h2>비밀번호 찾기</h2></td>
	    </tr>
	    <tr>
	        <td><input type="text" placeholder="ID를 입력해주세요" id="memberId" name="memberId"></td>
	    </tr>
	    <tr>
	        <td><input type="text" placeholder="이름을 입력해주세요" id="memberName" name="memberName"></td>
	    </tr>
	    <tr>
	        <td><input type="text" placeholder="이메일을 입력해주세요" id="memberEmail" name="memberEmail"></td>
	    </tr>
	   <tr>
	        <td><input type="button" value="본인 인증" class="btn" id="btn_certification" name="btn_certification"></td>
	    </tr>
	    <tr>
	        <td class="join">
	        	<a href="/login.do">로그인화면으로</a>
	        </td>
	    </tr>
	</table>
</form>
</body>
</html>