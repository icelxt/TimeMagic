<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑</title>
</head>
<body>
	<s:form action="update.do">
		<table>
			<tr>
				<td>用户名:</td>
				<td><s:textfield name="test.id"></s:textfield></td>
			</tr>
		</table>
		<s:submit>提交</s:submit>
	</s:form>
</body>
</html>