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
			var loginId = $j("#bodyLogin input[name='userId']");
			var loginPw = $j("#bodyLogin input[name='userPw']");
			
			if($j.trim(loginId.val())==""){
				alert("���̵� �Է��� �ּ���.");
				loginId.focus();
				return;
			}
			
			if($j.trim(loginPw.val())==""){
				alert("��й�ȣ�� �Է��� �ּ���.")
				loginPw.focus();
				return;
			}
			
			var frm$ = $j("#bodyLogin :input");
			var param = frm$.serialize(); 
			$j.ajax({
				url: "/board/boardLoginAction.do",
				dataType: "json",
				data: param,
				type: "POST",
				success: function(data, textStatus, jqXHR){
					
					if(data[0].idSucess==0){
						alert("�������� �ʴ� ���̵� �Դϴ�.");
						loginId.focus();
						return;
					}
					if(data[0].pwSucess==0){
						alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
						loginPw.focus();
						return;
					}
					
					location.href = "/board/boardList.do";
				},
				error: function (jqXHR, textStatus, errorThrown)
				{
					alert("����");	
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
				<input type="text" name="userId" placeholder="���̵� �Է��� �ּ���">
				</td>
			</tr>
			
			<tr>
				<td>
				pw
				</td>
				<td>
				<input type="password" name="userPw" placeholder="��й�ȣ�� �Է��� �ּ���">
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