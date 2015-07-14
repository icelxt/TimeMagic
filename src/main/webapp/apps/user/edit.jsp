<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel='stylesheet' href='/webjars/bootstrap/3.3.4/css/bootstrap.min.css'>
<script type='text/javascript' src='/webjars/jquery/1.11.1/jquery.min.js'></script>
<script type='text/javascript' src='/webjars/bootstrap/3.3.4/js/bootstrap.min.js'></script>
<title>编辑</title>
</head>
<body>
<div class="container">
	<s:form action="update" namespace="/user">
		<table>
			<tr>
				<td>用户名:</td>
				<td><s:textfield name="test.id"></s:textfield></td>
			</tr>
		</table>
		<s:submit>提交</s:submit>
	</s:form>
</div>
</body>
</html>