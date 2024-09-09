<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<title>게시물 등록</title>
<style>
	table{
		margin:auto;
	}
	tr {
		height:30px;
	}

	.text {
	 width:100%;
	}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		/* 수정 버튼 보이고 안보이고 처리방법 - 2 
		var loginId = "${loginInfo.id}";
		var createId = "${boardInfo.createId}";
		if(loginId != createId){
			$("#btn_update").hide();
		}else{
			$("#btn_update").show();
		} */
		$("#btn_update").on('click', function(){
			$("#flag").val("U");
			var frm = $("#saveFrm");
			frm.attr("method", "POST");
			frm.attr("action", "/board/registBoard.do");
			frm.submit();
		});
		
		$("#btn_list").on('click', function(){
			location.href="/board/boardList.do";
		});
		
		$("#btn_delete").on('click', function(){
			fn_delete();
		});
	});
	
	function fn_delete(){
		
		var boardIdx3 = $("#boardIdx").val();
		$.ajax({
		    url: '/board/deleteBoard.do',
		    method: 'post',
		    data : { "boardIdx" : boardIdx3},
		    dataType : 'json',
		    success: function (data, status, xhr) {
		    	if(data.resultChk > 0){
		    		alert("삭제되었습니다.");
		    		location.href="/board/boardList.do";
		    	}else{
		    		alert("삭제에 실패하였습니다.");
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
	<div>
		<form id="saveFrm" name="saveFrm">
			<input type="hidden" id="flag" name="flag" value="${flag}"/>
			<input type="hidden" id="boardIdx" name="boardIdx" value="${boardIdx }"/>
			<table style="height:auto; width:100%;" >
				<colgroup>
					<col width="20%" />
					<col width="30%" />
					<col width="20%" />
					<col width="30%" />
				</colgroup>
				<tbody>
					<tr>
						<th>제목</th>
						<td colspan="3">
							<input type="text" class="text" id="boardTitle" name="boardTitle" value="${boardInfo.boardTitle }" readonly/>
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="3">
							<textarea rows="20" cols="100" id="boardContent" name="boardContent" style="width:100%;" readonly>${boardInfo.boardContent}</textarea>
						</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>
							<input type="text" class="text" id="createId" name="createId" value="${boardInfo.createId }" readonly />
						</td>
						<th>작성일</th>
						<td>
							<input type="text" class="text" id="createDate" name="createDate" value="${boardInfo.createDate }" readonly />
						</td>
					</tr>
					<tr>
						<th>수정자</th>
						<td>
							<input type="text"  class="text" id="updateId" name="updateId" value="${boardInfo.updateId }" readonly />
						</td>
						<th>수정일</th>
						<td>
							<input type="text" class="text" id="updateDate" name="updateDate" value="${boardInfo.updateDate }" readonly />
						</td>
					</tr>
				</tbody>
				
			</table>
		</form>
	</div>
	<div style="float:right;">
		<c:if test="${loginInfo.id == boardInfo.createId }"> <!-- 수정 버튼 보이고 안보이고 처리방법 - 1 -->
			<input type="button" id="btn_update" name="btn_update" value="수정"/>
			<input type="button" id="btn_delete" name="btn_delete" value="삭제"/>
		</c:if>
		<input type="button" id="btn_list" name="btn_list" value="목록"/>
	</div>
</body>
</html>