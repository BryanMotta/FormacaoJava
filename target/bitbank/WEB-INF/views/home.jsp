<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BitBank</title>
</head>
<body>
	<h1>BitBank</h1>
	<p> ${sucesso} </p>
	<table>
		<tr>
			<td>Seja nosso cliente <a href="${s:mvcUrl('CC#form').build() }">cadastre-se </a></td>
			<td>Veja nossos clientes <a href="${s:mvcUrl('CC#lista').build() }">Lista de clientes </a></td>
		</tr>
	</table>
</body>
</html>