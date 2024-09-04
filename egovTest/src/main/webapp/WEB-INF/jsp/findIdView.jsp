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
		$("#btn_findId").on('click', function(){
			fn_findId();
		});
	});
	
	function fn_findId(){
		var frm = $("#frm").serialize();
		$.ajax({
		    url: '/findId.do',
		    method: 'post',
		    data : frm,
		    dataType : 'json',
		    success: function (data, status, xhr) {
				if(data.idList.length > 0){
					var findId = '조회된 아이디는\n';
					for(var i =0; i<data.idList.length; i++){
						findId += data.idList[i];
						findId += '\n';
					}
					alert(findId);
					return;
				}else{
					alert("검색된 아이디가 없습니다.");
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
	        <td><h2>아이디찾기</h2></td>
	    </tr>
	    <tr>
	        <td><input type="text" placeholder="이름을 입력해주세요" id="memberName" name="memberName"></td>
	    </tr>
	    <tr>
	        <td><input type="text" placeholder="이메일을 입력해주세요" id="memberEmail" name="memberEmail"></td>
	    </tr>
	   <tr>
	        <td><input type="button" value="아이디 찾기" class="btn" id="btn_findId" name="btn_findId"></td>
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