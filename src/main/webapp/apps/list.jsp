<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel='stylesheet' href='webjars/bootstrap/3.3.4/css/bootstrap.min.css'>
<script type='text/javascript' src='webjars/jquery/1.11.1/jquery.min.js'></script>
<script type='text/javascript' src='webjars/bootstrap/3.3.4/js/bootstrap.min.js'></script>
<title>测试列表</title>
</head>
<body>
<div class="container">
	<table class="table table-striped table-hover table-bordered">
		<thead>
			<tr>
				<td>序号</td>
				<td>id标识</td>
				<td>用户名</td>
				<td>操作</td>
			</tr>
		</thead>
		<s:iterator value="list" status="status">
			<tr>
				<td><s:property value="#status.index+1"/></td>
				<td><s:property value="id"/></td>
				<td><s:property value="loginName"/></td>
				<td><a href="edit.do?id=${id}">编辑</a></td>
			</tr>
		</s:iterator>
	</table>
</div>
</body>
</html>