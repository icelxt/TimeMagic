<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel='stylesheet'
	href='/webjars/bootstrap/3.3.4/css/bootstrap.min.css'>
<script type='text/javascript' src='/webjars/jquery/1.11.1/jquery.min.js'></script>
<script type='text/javascript' src='/webjars/bootstrap/3.3.4/js/bootstrap.min.js'></script>
<script type='text/javascript' src='/apps/js/password.js'></script>
<script type="text/javascript">
$(function() {
    $('#password').password();
    $("#userName").on("blur" function(){
    	var userName = $("#userName").val();
    	$.post({
    		url: "/userjson/getUser.do" ,
    		data: {"userName":userName} ,
    		success: function(json){
    			
    	    }
    	});
    });
    $("#password2").on("keyup", function(){
    	console.log("psw"+$("#password").val());
    	console.log("psw2"+$("#password2").val());
    	if($("#password").val() != $("#password2").val()){
    		$("#password2").parent().addClass("has-error");
    		$("#password2").next().addClass("glyphicon-remove");
    		$("#password2").attr("title","两次密码不一样");
    	}else{
    		$("#password2").parent().removeClass("has-error");
    		$("#password2").parent().addClass("has-success");
    		$("#password2").next().removeClass("glyphicon-remove");
    		$("#password2").next().addClass("glyphicon-ok");
    		$("#password2").attr("title","");
    	}
    });
    $("[data-toggle='tooltip']").tooltip();
});
</script>
<title>添加</title>
</head>
<body style="background-image:url(/image/bg01.gif);">
	<div class="container">
		<s:form action="save.do">
		<div style="position:fixed;left:40%;top:30%;margin-left:width/2;margin-top:height/2;width: 500px;">
			<div class="form-group has-feedback">
				<label for="userName">用户名</label>
				<s:textfield id="userName" name="user.loginName" cssClass="form-control" placeholder="用户名"></s:textfield>
				<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
			</div>
			<div class="form-group has-feedback">
				<label for="password">请设置密码</label>
				<s:password id="password" name="user.passWord" cssClass="form-control" placeholder="密码"/>
			</div>
			<div class="form-group has-feedback">
				<label for="password2">请确认密码</label>
				<s:password id="password2" data-toggle="tooltip" cssClass="form-control" placeholder="密码" aria-describedby="inputError2Status"/>
				<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
			</div>
			<div class="form-group has-feedback">
				<label for="name">姓名</label>
				<s:textfield id="name" name="user.name" cssClass="form-control" placeholder="姓名"/>
			</div>
			<div class="form-group has-feedback">
				<label for="address">地址</label>
				<s:textfield id="address" name="user.address" cssClass="form-control" placeholder="地址"/>
			</div>
			<div class="form-group has-feedback">
				<label for="mobile">电话</label>
				<s:textfield id="mobile" name="user.mobile" cssClass="form-control" placeholder="电话"/>
			</div>
			<s:submit cssClass="btn btn-success" value="注册" />
		</div>
		</s:form>
	</div>
</body>
</html>