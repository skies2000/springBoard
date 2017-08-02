<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Login</title>
</head>
<script type="text/javascript">
	$j(document).ready(function(){
		
		$j("#loginBtn").click(function(){
			var frm$ = $j("#bodyLogin :input");
			var param = frm$.serialize(); 
			$j.ajax({
				url: "/board/boardLoginAction.do",
				dataType: "json",
				data: param,
				type: "POST",
				success: function(data, textStatus, jqXHR){
					
					alert("로그인 메시지:"+data.success);
					if(data.success=='N') return;
					
					location.href = "/board/boardList.do";
				},
				error: function (jqXHR, textStatus, errorThrown)
				{
					alert("실패");	
				}
			});	
		});
	});
</script>
<body>
	<form id="bodyLogin">
		<table align  = "center">
		<tr>
		<td>
		
		<table  border="1">
			<tr>
				<td width="120">
				id
				</td>
				<td width="200">
				<input type="text" name="userId">
				</td>
			</tr>
			
			<tr>
				<td>
				pw
				</td>
				<td>
				<input type="password" name="userPw">
				</td>
			</tr>
			</table>
			</td>
			</tr>
			<tr>
			<td align="right">
			<a href="#" id='loginBtn'>login</a>
			</td>
			</tr>
		</table>
	</form>
</body>
</html>