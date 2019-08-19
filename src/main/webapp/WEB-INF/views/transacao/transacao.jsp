<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>

			<form:form
				action="${s:mvcUrl('TC#deposita').arg(0,cliente.id).build() }"
				method="post" modelAttribute="cliente">
				<div>
					Nome:${cliente.titular.nome} Id:${cliente.conta.id} <input
						type="number" name="deposita" />
					<form:hidden path="id" value="${cliente.id}" />
				</div>
				<button type="submit">Depositar</button>
			</form:form>
		</tr>
	</table>

	<table>
		<tr>

			<form:form action="${s:mvcUrl('TC#saca').arg(0,cliente.id).build() }"
				method="post" modelAttribute="cliente">
				<div>
					Nome:${cliente.titular.nome} Id:${cliente.conta.id} <input
						type="number" name="saca" />
					<form:hidden path="id" value="${cliente.id}" />
				</div>
				<button type="submit">Sacar</button>
			</form:form>
		</tr>
	</table>

</body>
</html>