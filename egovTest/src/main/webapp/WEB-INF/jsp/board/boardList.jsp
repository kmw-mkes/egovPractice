<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/>
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function(){
		fn_selectList(1);
		
		$("#btn_search").on('click', function(){
			fn_selectList(1);
		});
		
		$("#btn_insert").on('click', function(){
			fn_insert();
		});
	});
	
	function fn_selectList(pageIndex){
		var frm = $("#searchFrm").serialize();
		$.ajax({
		    url: '/board/selectBoardList.do',
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
	
	function fn_detail(boardIdx){

	}
	
	function fn_insert(){
		
	}
	
	function fn_paging_move(pageIndex){
		$("#pageIndex").val(pageIndex);
		
		fn_selectList(pageIndex);
	}
	
	function fn_paging(paramMap){
      var innerHtml = "";
      if(paramMap.totalPageCount > 0) {
         innerHtml +='<a href="javascript:fn_paging_move(1);"><img src="/images/egovframework/cmmn/btn_page_pre10.gif" alt="처음페이지로" /></a>&nbsp;'; //처음 페이지로
         if(paramMap.currentPageNo == 1){
            innerHtml +='<a href="javascript:fn_paging_move('+paramMap.currentPageNo+');"><img src="/images/egovframework/cmmn/btn_page_pre1.gif" alt="이전 페이지로" /></a>&nbsp;'; //이전 페이지로
         }else if(paramMap.currentPage != 1){
            innerHtml +='<a href="javascript:fn_paging_move('+(paramMap.currentPageNo-1)+');"><img src="/images/egovframework/cmmn/btn_page_pre1.gif" alt="이전 페이지로" /></a>&nbsp;'; //이전 페이지로
         }
         for(var i=paramMap.firstPageNoOnPageList; i<=paramMap.lastPageNoOnPageList; i++){ //한번에 보여주는 페이징처리 갯수 조정
            if(paramMap.currentPageNo == i){
               innerHtml += '<strong> '+i+' </strong>';
            }else{
               innerHtml += '<a href="javascript:fn_paging_move('+i+');" class="page_num"> '+ i +' </a>';
            }
         }
         if(paramMap.currentPageNo == paramMap.totalPageCount){
            innerHtml +='&nbsp;<a href="javascript:fn_paging_move('+paramMap.totalPageCount+');"><img src="/images/egovframework/cmmn/btn_page_next1.gif" alt="다음 페이지로" /></a>&nbsp;'; //다음 페이지로
         }else if(paramMap.currentPageNo != paramMap.totalPageCount){
            innerHtml +='&nbsp;<a href="javascript:fn_paging_move('+(paramMap.currentPageNo+1)+');"><img src="/images/egovframework/cmmn/btn_page_next1.gif" alt="다음 페이지로" /></a>&nbsp;'; //다음 페이지로
         }
      
      
         innerHtml +='<a href="javascript:fn_paging_move('+paramMap.totalPageCount+');"><img src="/images/egovframework/cmmn/btn_page_next10.gif" alt="마지막 페이지로" /></a>'; //마지막 페이지로
      
      }   
      $("#paging").html(innerHtml);
      
      var innerHtmlCounter = "";
      var totListCnt = "<strong>"+paramMap.totalRecordCount+"</strong>";
      if(paramMap.listCnt > 0){
         innerHtmlCounter += '<span>전체  '+totListCnt+'건</span><span>['+paramMap.currentPageNo+'/<strong>'+paramMap.totalPageCount+'</strong>] </span>'; //건
      }else{
         innerHtmlCounter += '<span>전체  '+totListCnt+'건</span>';
      }
      $("#total_counter").html(innerHtmlCounter);
	}
</script>
</head>
<body>
	<div id="search">
		<form id="boardFrm" name="boardFrm" method="POST">
			<input type="hidden" id="boardIdx" name="boardIdx" value=""/>
			<input type="hidden" id="flag" name="flag" value=""/>
		</form>
		<form id="searchFrm" name="searchFrm">
			<input type="hidden" id="pageIndex" name="pageIndex" value="1"/>
			<label id="total_counter" style="float:left;">총 0 건</label>
			<ul>
				<li>
					<select id="searchCondition" name="searchCondition">
						<option value="id">ID</option>
						<option value="title">제목</option>
					</select>
				</li>
				<li>
					<input type="text" id="searchKeyword" name="searchKeyword" class="txt"/>
				</li>
				<li>
					<input type="button" id="btn_search" name="btn_search" value="검색" class="btn_blue_l"/>
				</li>
			</ul>
		</form>

	</div>
	<div>
		<table width="100%" border="0" cellpadding="0" cellspacing="0" >
			<thead>
				<colgroup>
       				<col width="5%"/>
       				<col width="auto;"/>
       				<col width="10%"/>
       				<col width="15%"/>
       			</colgroup>
       			<tr>
       				<th align="center">번호</th>
       				<th align="center">제목</th>
       				<th align="center">작성자</th>
       				<th align="center">작성일시</th>
       			</tr>
			</thead>
        	<tbody id="tbody" name="tbody">
        		<tr>
        			<td colspan="4" style="text-align:center;">조회된 결과가 없습니다.</td>
        		</tr>
        	</tbody>		
        </table>
	</div>
	<div style="float:right;">
		<input type="button" id="btn_insert" name="btn_insert" value="등록"/>
	</div>
	<div id="paging" >
	</div>
</body>
</html> 