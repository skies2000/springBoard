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
			if(falseFlg==ckList.length){alert('�Խñ� Ÿ���� �������ּ���.');return;}
			var frm = document.getElementById("bodyListFrm");
			frm.action = '/board/boardList.do';
			frm.submit();
		});
		
		$j("#logOutBtn").click(function(){
			if(!confirm("�α׾ƿ� �Ͻðڽ��ϱ�?")) return;
			
			$j.ajax({
				url: "/board/boardLogoutAction.do",
				dataType: "json",
				type: "GET",
				success: function(data, textStatus, jqXHR){
					
					alert("�α׾ƿ� �޽���"+data.success);
					
					location.href = "/board/boardList.do";
				},
				error: function (jqXHR, textStatus, errorThrown)
				{
					alert("����");	
				}
			});	
		});
		
	});
	function goPage(page){
		
		var frm = document.getElementById("bodyListFrm");
		var pageNo = frm.pageNo;
		pageNo.value = page;
		frm.action = "/board/boardList.do";
		frm.submit();
	}

</script>
<body>
<table  align="center">
	<tr>
	<td>
	${loginName}
	<c:if test="${empty sessionId}">
		<a href='/board/boardJoin.do'>Join</a>
		<a href='/board/boardLogin.do'>Login</a>
	</c:if>
	</td>
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
			<c:if test="${!empty sessionId}">
				<a href ="#" id="logOutBtn">�α׾ƿ�</a>
			</c:if>
			<a href ="/board/boardWrite.do">�۾���</a>
		</td>
		
	</tr>
	<tr>		
		<td>
		<form id = 'bodyListFrm'>
			<input type="hidden" name="pageNo" value="0">
			<label><input type='checkbox' id='allCheck'>��ü</label>
		<c:forEach var="obj" items="${menuList}">
			<label><input type='checkbox' class='checkList' name='boardTypeArr' value='${obj.codeId}'>${obj.codeName}</label>
		</c:forEach>
			<input type='button' value='��ȸ' id = 'boardSearchBtn'>
		</form>
		</td>
	</tr>
	<tr>
	<td align="center">
		
		<c:if test="${page.startPage>1}">
			<a href="#" onclick="goPage(1)">ó��</a>
			<a href="#" onclick="goPage(${page.startPage-1})">��</a>
		</c:if>
		
		<c:forEach var = 'p' begin="${page.startPage}" end="${page.endPage}">
			<a href="#" onclick="goPage(${p})">${p}</a>
		</c:forEach>
		
		<c:if test="${page.totPage > page.endPage}">
			<a href="#" onclick="goPage(${page.endPage+1})">��</a>
			<a href="#" onclick="goPage(${page.totPage})">��</a>
		</c:if>
		
	</td>
	</tr>
</table>
	
</body>
</html>