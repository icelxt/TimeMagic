<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel='stylesheet' href='webjars/bootstrap/3.3.4/css/bootstrap.min.css'>
<script type='text/javascript' src='webjars/jquery/1.11.1/jquery.min.js'></script>
<script type='text/javascript' src='webjars/bootstrap/3.3.4/js/bootstrap.min.js'></script>
<title>编辑</title>
</head>
<body>
<div class="container">
	<s:form action="update.do">
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