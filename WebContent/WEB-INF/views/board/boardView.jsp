<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>boardView</title>
</head>
<script type="text/javascript">
$j(document).ready(function(){
	
	
	
	$j('#deleteBtn').click(function(){
		
		var $frm = $j('#bodyView :input');
		var param = $frm.serialize();
		
		$j.ajax({
			url : "/board/boardDeleteAction.do",
		    type: "POST",
		    data : param,
		    dataType: "json",
		    success: function(data, textStatus, jqXHR)
		    {
				alert("삭제완료");
				
				alert("메세지:"+data.success);
				
				location.href = "/board/boardList.do";
		    },
		    error: function (jqXHR, textStatus, errorThrown)
		    {
		    	alert("실패");
		    }
			
		});
		
	});
	/* <a href="/board/boardUpdate.do">Update</a>
	<a href="/board/boardDelete.do">Delete</a> */
	
	
	});
	</script>
<body>
<table align="center">
	<tr>
		<td>
			<table border ="1">
				<tr>
					<td width="120" align="center">
					Title
					</td>
					<td width="400">
					${board.boardTitle}
					</td>
				</tr>
				<tr>
					<td height="300" align="center">
					Comment
					</td>
					<td>
					${board.boardComment}
					</td>
				</tr>
				<tr>
					<td align="center">
					Writer
					</td>
					<td>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td align="right">
			<a href="/board/${boardType}/${boardNum}/boardUpdate.do" >Update</a>
			<a href="#" id = "deleteBtn">Delete</a>
			<a href="/board/boardList.do">List</a>
		</td>
		<td align="right">
			
		</td>
	</tr>
</table>
<form id = bodyView>
<input type='hidden' name = 'boardType' value='${boardType}'>
<input type='hidden' name = 'boardNum' value='${boardNum}'>
<%-- <input type='hidden' name = 'boardTitle' value='${board.boardTitle}'>
<input type='hidden' name = 'boardComment' value='${board.boardComment}'> --%>
</form>

</body>
</html>