<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<tags:pageTemplate titulo="Home ">
	<table>
		<tr>

			<s:url value="/transacoes/deposita/${cliente.id}" var="deposita" />
			<form:form
				action="${deposita}"
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
			<s:url value="/transacoes/saca/${cliente.id}" var="saca"/>
			<form:form action="${saca}"
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

</tags:pageTemplate>