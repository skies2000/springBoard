<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>list</title>
</head>
<script type="text/javascript">

	$j(document).ready(function(){
		
		$j('#allCheck').click(function(){
			   var allCheck = document.getElementById('allCheck'); 
			   var ckList= document.getElementsByClassName('checkList');
			   var tfFlag = true;
			   var ckLen = ckList.length;
			   if(allCheck.checked==false){
			      tfFlag = false;
			      
			   }
			      for(var i=0; i<ckLen; i++){
			    	  ckList[i].checked = tfFlag; 
			      } 
		});
		
		$j('#boardSearchBtn').click(function(){
			var ckList = document.getElementsByClassName('checkList'); 
			var falseFlg = 0;
			for(var i = 0; i< ckList.length;i++){
				if(ckList[i].checked==false){
					falseFlg++; 
				}
			}
			if(falseFlg==ckList.length){alert('게시글 타입을 선택해주세요.');return;}
			var frm = document.getElementById("bodyListFrm");
			frm.action = '/board/boardListSearch.do';
			frm.submit();
			
			
		});
		
		
	});

</script>
<body>
<table  align="center">
	<tr>
		<td align="right">
			total : ${totalCnt}
		</td>
	</tr>
	<tr>
		<td>
			<table id="boardTable" border = "1">
				<tr>
					<td width="80" align="center">
						Type
					</td>
					<td width="40" align="center">
						No
					</td>
					<td width="300" align="center">
						Title
					</td>
				</tr>
				<c:forEach items="${boardList}" var="list">
					<tr>
						<td align="center">
							${list.codeName}
						</td>
						<td>
							${list.boardNum}
						</td>
						<td>
							<a href = "/board/${list.boardType}/${list.boardNum}/boardView.do?pageNo=${pageNo}">${list.boardTitle}</a>
						</td>
					</tr>	
				</c:forEach>
			</table>
		</td>
	</tr>
	<tr>
		<td align="right">
			<a href ="/board/boardWrite.do">글쓰기</a>
		</td>
		
	</tr>
	<tr>		
		<td>
		<form id = 'bodyListFrm'>
			<label><input type='checkbox' id='allCheck'>전체</label>
		<c:forEach var="obj" items="${menuList}">
			<label><input type='checkbox' class='checkList' name='boardTypeArr' value='${obj.codeId}'>${obj.codeName}</label>
		</c:forEach>
			<input type='button' value='조회' id = 'boardSearchBtn'>
		</form>
		</td>
	</tr>
</table>	
</body>
</html>