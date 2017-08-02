<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Join</title>
</head>
<script type="text/javascript">
	$j(document).ready(function(){
		var idCheckFlag = false;
		var pwdCheckFlag = false;
		$j("#bodyJoin input[name='userPwCheck']").keyup(function(){
			var userPw = $j("#bodyJoin input[name='userPw']");
			if($j(this).val() == userPw.val()){
				alert("비밀번호가 일치합니다.");
				pwdCheckFlag = true;
			}else
				pwdCheckFlag = false;
			
		});
		
			$j("#bodyJoin input[name='userPw']").change(function(){
			pwdCheckFlag = false;	
		});
		
		$j("#bodyJoin input[name='userId']").change(function(){
			idCheckFlag = false;	
		});
		
		
		$j('#joinSubmitBtn').click(function(){
			var userId = $j("#bodyJoin input[name='userId']");
			var pwd = $j("#bodyJoin input[name='userPw']");
			var pwdCheck = $j("#bodyJoin input[name='userPwCheck']");
			var userName = $j("#bodyJoin input[name='userName']");
			var userPhone2 = $j("#bodyJoin input[name='userPhone2']");
			var userPhone3 = $j("#bodyJoin input[name='userPhone3']");
			var userAddr1 = $j("#bodyJoin input[name='userAddr1']");
			var userAddr2 = $j("#bodyJoin input[name='userAddr2']");
			var userCompany = $j("#bodyJoin input[name='userCompany']");
			
			var userIdReg = /^$/;
			var pwdReg = /^[0-9a-zA-Z]{6,12}$/;
			var userNameReg = /^$/;
			var userPhone2Reg = /^\d{4}$/;
			var userPhone3Reg = /^\d{4}$/;
			var userAddr1Reg = /^\d{3}-\d{3}$/;
			var userAddr2Reg = /^$/;
			var userCompanyReg = /^$/;
			
			/* alert(userPhoneReg.test(userPhone2.val()));
			alert(userPhoneReg.test(userPhone3.val()));
			alert(pwdReg.test(pwd.val()));
			alert(userAddr1Reg.test(userAddr1.val())); */
			
			if(!idCheckFlag){
				alert("중복 체크를 하시기 바랍니다.");
				return;
			}
			
			if(!(pwdReg.test(pwd.val()))){
				alert("비밀번호는 6~12 글자로 입력해 주세요.");
				return;
			}
			
			if(pwd.val()!=pwdCheck.val() || !pwdCheckFlag){
				alert("비밀번호가 일치하지 않습니다.");
				return;
			}
			
			if(!(userPhone2Reg.test(userPhone2.val()))){
				alert("전화번호는 4글자씩 입력해 주세요.");
				return;
			}
			if(!(userPhone3Reg.test(userPhone3.val()))){
				alert("전화번호는 4글자씩 입력해 주세요.");
				return;
			}
			
			if(!(userAddr1Reg.test(userAddr1.val()))){
				alert("우편번호는 xxx-xxx 형식으로 입력해 주세요.")
				return;
			}
			
			
			var frm$ = $j("#bodyJoin :input");
			var param = frm$.serialize(); 
			$j.ajax({
				url: "/board/boardJoinAction.do",
				dataType: "json",
				data: param,
				type: "POST",
				success: function(data, textStatus, jqXHR){
					alert("작성완료");
					
					alert("메세지:"+data.success);
					
					location.href = "/board/boardList.do";
				},
				error: function (jqXHR, textStatus, errorThrown)
				{
					alert("실패");	
				}
			});
			
		});
		$j('#idCheckBtn').click(function(){
			$j.ajax({
				url: "/board/boardSelectIdList.do",
				dataType: "json",
				type : "GET",
				success: function(data, textStatus, jqXHR)
				{
					var id = $j("#bodyJoin input[name='userId']");
					if(id.val()==''){
						alert("아이디를 입력해 주세요");
						idCheckFlag = false;
						return;
					}
					for(var i=0; i<data.length; i++){
						if(id.val()==data[i].userId){
							alert("아이디가 중복 되었습니다.");
							idCheckFlag = false;
							return;
						}
					}
					idCheckFlag = true;
					alert("사용 가능한 아이디 입니다.")
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
	<form id="bodyJoin"> 
	<table align="center">
	
		<tr>
			<td>
			<a href="/board/boardList.do">List</a>
			</td>
		</tr>
		<tr>
			<td>
				<table border ="1">
				
					<tr>
						<td width="120" align="center">
						id
						</td>
						<td width="300">
						<input name="userId" type="text" size="10"> 
						<input id = "idCheckBtn" type="button" value="중복확인">
						</td>
					</tr>
					<tr>
						<td align="center">
						pw
						</td>
						<td >
						<input type="password" size="14" name="userPw">
						</td>
					</tr>
					<tr>
						<td align="center">
						pw check
						</td>
						<td>
						<input type="password" size="14" name="userPwCheck">
						</td>
					</tr>
					<tr>
						<td align="center">
						name
						</td>
						<td>
						<input type="text" name="userName" size="14">
						</td>
					</tr>
					<tr>
						<td align="center">
						phone
						</td>
						<td>
						<select name="userPhone1">
						<c:forEach items="${phoneList}" var="obj">
						<option value="${obj.codeId}">
						${obj.codeName}
						</option>
						</c:forEach>	
						</select>-<input type="text" size="1" name="userPhone2">-<input type="text" size="1" name="userPhone3">
						</td>
					</tr>
					<tr>
						<td align="center">
						postNo
						</td>
						<td>
						<input type="text" name="userAddr1" size="14">
						</td>
					</tr>
					<tr>
						<td align="center">
						address
						</td>
						<td>
						<input type="text" name="userAddr2" size="14">
						</td>
					</tr>
					<tr>
						<td align="center">
						company
						</td>
						<td>
						<input type="text" name="userCompany" size="14">
						</td>
					</tr>
					
				</table>
			</td>
		</tr>
		<tr>
			<td align="right">
				<a href="#" id="joinSubmitBtn">Join</a>
			</td>
		</tr>
		
	</table>
	</form>
</body>
</html>