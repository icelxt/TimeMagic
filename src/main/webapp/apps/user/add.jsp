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
<script type='text/javascript'
	src='/webjars/bootstrap/3.3.4/js/bootstrap.min.js'></script>
<title>添加</title>
</head>
<body style="background-image:url(/image/bg01.gif);">
	<div class="container">
		<s:form action="save.do">
		<div style="position:fixed;left:40%;top:30%;margin-left:width/2;margin-top:height/2;">
			<div class="form-group">
				<label for="userName">用户名</label>
				<s:textfield id="userName" name="user.loginName" cssClass="form-control" placeholder="用户名"></s:textfield>
			</div>
			<div class="form-group">
				<label for="password">密码</label>
				<s:password id="password" name="user.passWord" cssClass="form-control" placeholder="密码"/><!-- 明日添加密码强度、两次密码相同前端验证 -->
			</div>
			<div class="form-group">
				<label for="name">姓名</label>
				<s:textfield id="name" name="user.name" cssClass="form-control" placeholder="姓名"/>
			</div>
			<div class="form-group">
				<label for="address">地址</label>
				<s:textfield id="address" name="user.address" cssClass="form-control" placeholder="地址"/>
			</div>
			<div class="form-group">
				<label for="mobile">电话</label>
				<s:textfield id="mobile" name="user.mobile" cssClass="form-control" placeholder="电话"/>
			</div>
			<s:submit cssClass="btn btn-success" value="注册" />
		</div>
		</s:form>
	</div>
</body>
</html>