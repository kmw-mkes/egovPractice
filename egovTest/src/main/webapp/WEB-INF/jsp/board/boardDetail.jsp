<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		$("#btn_save").on('click', function(){
			fn_save();
		});
		
		$("#btn_list").on('click', function(){
			
		});
	});
	
	function fn_save(){
		var frm = $("#saveFrm").serialize();
		$.ajax({
		    url: '/board/saveBoard.do',
		    method: 'post',
		    data : frm,
		    dataType : 'json',
		    success: function (data, status, xhr) {
		    	
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
			<input type="hidden" id="statusFlag" name="statusFlag" value="${flag}"/>
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
							<input type="text" class="text" id="boardTitle" name="boardTitle" readonly/>
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="3">
							<textarea rows="20" cols="100" id="boardContent" name="boardContent" style="width:100%;" readonly></textarea>
						</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>
							<input type="text" class="text" id="createId" name="createId" value="" readonly />
						</td>
						<th>작성일</th>
						<td>
							<input type="text" class="text" id="createDate" name="createDate" value="" readonly />
						</td>
					</tr>
					<tr>
						<th>수정자</th>
						<td>
							<input type="text"  class="text" id="updateId" name="updateId" value="" readonly />
						</td>
						<th>수정일</th>
						<td>
							<input type="text" class="text" id="updateDate" name="updateDate" value="" readonly />
						</td>
					</tr>
				</tbody>
				
			</table>
		</form>
	</div>
	<div style="float:right;">
		<input type="button" id="btn_update" name="btn_update" value="수정"/>
		<input type="button" id="btn_list" name="btn_list" value="목록"/>
	</div>
</body>
</html>