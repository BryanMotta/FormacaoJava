<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cliente:${cliente.titular.nome}</title>
</head>
<body>

	<table>
		<tr>
			<td>Nome:${cliente.titular.nome}</td>
			<td>RG:${cliente.titular.rg}</td>
			<td>CPF:${cliente.titular.cpf}</td>
			<td>Data Nascimento:<fmt:formatDate pattern="dd/MM/yyyy" value="${cliente.titular.dataNascimento.time}"/></td>
			<td>Genero:${cliente.titular.genero}</td>
		</tr>

	</table>
	<table>
		<tr>
			<td><a href="${s:mvcUrl('HC#index').build() }">Home</a>
			<td>Seja nosso cliente <a href="${s:mvcUrl('NCC#form').build() }">cadastre-se
			</a></td>
		</tr>
	</table>







</body>
</html>