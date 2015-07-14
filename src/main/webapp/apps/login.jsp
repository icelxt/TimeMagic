<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel='stylesheet' href='/webjars/bootstrap/3.3.4/css/bootstrap.min.css'>
<script type='text/javascript' src='/webjars/jquery/1.11.1/jquery.min.js'></script>
<script type='text/javascript' src='/webjars/bootstrap/3.3.4/js/bootstrap.min.js'></script>
<script type='text/javascript' src='/apps/js/password.js'></script>
<script type="text/javascript">
$(function() {
    $('#password').password();
    $("#subm").on("click", function(){
    	if($("#password").val() == ""){
    		alert("error!");
    		return ;
    	}
    	$.ajax({
			url:'/userjson/getPsw.do',
			data:{psw:$('#password').val(),key:$('#key').val()},
			type:'post',
			async:false,
			success:function(json){
				var result = json.result;
				$("#password").val(result);
			}
		});
    	$("#subm").submit();
    });
});
</script>
<title>TimeMagic</title>
</head>
<body>
	<div class="container">
	<div style="position:fixed;left:30%;top:20%;margin-left:width/2;margin-top:height/2;width: 300px;">
	<s:form action="indo" namespace="/login">
		<div class="form-group has-feedback input-group">
			<div class="input-group-addon"><i class="glyphicon glyphicon-user"></i></div>
			<s:textfield id="userName" name="loginName" cssClass="form-control" placeholder="用户名"></s:textfield>
			<span class="glyphicon form-control-feedback"></span>
		</div>
		<div class="form-group has-feedback input-group">
			<div class="input-group-addon"><i class="glyphicon glyphicon-asterisk"></i></div>
			<s:password id="password" name="psw" cssClass="form-control" placeholder="密码" />
		</div>
	<button id="subm" class="btn btn-success">Login</button>
	<s:hidden id="key" name="key" value="%{#request.publicKey}"></s:hidden>
	</s:form>
	</div>
	</div>
</body>
</html>