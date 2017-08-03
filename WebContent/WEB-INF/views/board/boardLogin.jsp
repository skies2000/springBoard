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
				alert("아이디를 입력해 주세요.");
				loginId.focus();
				return;
			}
			
			if($j.trim(loginPw.val())==""){
				alert("비밀번호를 입력해 주세요.")
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
						alert("존재하지 않는 아이디 입니다.");
						loginId.focus();
						return;
					}
					if(data[0].pwSucess==0){
						alert("비밀번호가 일치하지 않습니다.");
						loginPw.focus();
						return;
					}
					
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
				<input type="text" name="userId" placeholder="아이디를 입력해 주세요">
				</td>
			</tr>
			
			<tr>
				<td>
				pw
				</td>
				<td>
				<input type="password" name="userPw" placeholder="비밀번호를 입력해 주세요">
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