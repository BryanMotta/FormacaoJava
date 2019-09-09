<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<tags:pageTemplate titulo="Home ">

	<table>
		<tr>
			<td>Nome:${cliente.titular.nome}</td>
			<td>RG:${cliente.titular.rg}</td>
			<td>CPF:${cliente.titular.cpf}</td>
			<td>Data Nascimento:<fmt:formatDate pattern="dd/MM/yyyy"
					value="${cliente.titular.dataNascimento.time}" /></td>
			<td>Genero:${cliente.titular.genero}</td>
		</tr>

	</table>

</tags:pageTemplate>
