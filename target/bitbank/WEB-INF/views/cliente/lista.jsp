<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Bit Bank</title>
</head>
<body>
	<h1>Lista de Clientes</h1>

	<table>
		<tr>
			<td>Nome</td>
			<td>RG</td>
			<td>CPF</td>
			<td>Genero</td>
		</tr>

		<c:forEach items="${cliente}" var="cliente">
			<tr>
				<td>${cliente.titular.nome}</td>
				<td>${cliente.titular.rg}</td>
				<td>${cliente.titular.cpf}</td>
				<td>${cliente.titular.genero}</td>
			</tr>
		</c:forEach>

	</table>
	<table>
		<tr>
			<td> <a href="${s:mvcUrl('HC#index').build() }">Home
			<td>Seja nosso cliente <a href="${s:mvcUrl('CC#form').build() }">cadastre-se
			</a></td>
		</tr>
	</table>
	<p>${sucesso}</p>
</body>
</html>