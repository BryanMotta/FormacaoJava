<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<tags:pageTemplate titulo="Home ">
<main>
	<table class="table table-bordered table-striped table-hover">
		<tr>
			<th>Nome</th>
			<th>RG</th>
			<th>CPF</th>
		</tr>

		<c:forEach items="${cliente}" var="cliente">
			<tr>
				<th><a href="<s:url value="/cliente/detalhe?${cliente.id}"/>">${cliente.titular.nome}</th>
				</a>
				<th>${cliente.titular.rg}</th>
				<th>${cliente.titular.cpf}</th>
				<th><a href="<s:url value="/transacoes/deposita/${cliente.id}"/>">Depositar</a> 
				<a href="<s:url value="/transacoes/saca/${cliente.id}"/>">Sacar</a></th>
				</a>
			</tr>
		</c:forEach>

	</table>
	<p>${sucesso}</p>
	
</main>
</tags:pageTemplate>
