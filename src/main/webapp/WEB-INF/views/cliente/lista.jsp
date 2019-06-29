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
		</tr>

		<c:forEach items="${cliente}" var="cliente">
			<tr>
				<td><a href="${s:mvcUrl('CC#detalhe').arg(0,cliente.id).build() }">${cliente.titular.nome}</td>  </a>
				<td>${cliente.titular.rg}</td>
				<td>${cliente.titular.cpf}</td>
				<td><a href="${s:mvcUrl('TC#form').arg(0,cliente.id).build() }">Depositar nessa conta</td>  </a>
			</tr>
		</c:forEach>

	</table>
	<table>
		<tr>
			<td> <a href="${s:mvcUrl('HC#index').build() }">Home</a>
			<td>Seja nosso cliente <a href="${s:mvcUrl('NCC#form').build() }">cadastre-se
			</a></td>
		</tr>
	</table>
	<p>${sucesso}</p>
</body>
</html>