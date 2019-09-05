<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv=“Content-Type” content=“text/html; charset=UTF-8″>
<title>青海农信考试平台</title>
<script type="text/javascript" src="./js/jquery/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
function login(){
	if($("#acctName").val().length === 0){
		alert("用户名不能为空！");
		return;
	}
	
	if($("#password").val().length === 0){
		alert("密码不能为空！");
		return;
	}
	
	$.ajax({
		type : "post",
		url : "login",
		data : $('#loginForm').serialize(),
		success : function(data){
			if("000000" == data){
				alert("登录成功！");
			}else if("000001" == data){
				alert("用户名不存在，请核对后重新登录！");
			}else if("000002" == data){
				alert("密码错误，请核对后重新登录！");
			}
		},
		
		error : function(){
			alert("网络错误！");
		}
	});
}
</script>
</head>
<body>
	<span id="erSpan"></span>
	<form id="loginForm">
		用户名：<input type="text" name="acctName" id="acctName" /> <br /> 
		密码<input type="text" name="password" id="password" /><br /> 
		<input type="button" value="登录"  onclick="login()"/> 
	</form>
</body>
</html>