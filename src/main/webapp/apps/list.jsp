<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel='stylesheet' href='webjars/bootstrap/3.1.0/css/bootstrap.min.css'>
<script type='text/javascript' src='webjars/jquery/1.9.0/jquery.min.js'></script>
<script type='text/javascript' src='webjars/bootstrap/3.1.0/js/bootstrap.min.js'></script>
<title>测试列表</title>
</head>
<body>
<table>
	<s:iterator value="#request.list" var="status">
		<tr>
			<td><s:property value="#status.index+1"/></td>
			<td><s:property value="id"/></td>
			<td><s:property value="loginName"/></td>
			<td><a href="edit.do?id=${id}">编辑</a></td>
		</tr>
	</s:iterator>
</table>
</body>
</html>