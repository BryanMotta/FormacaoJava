<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<body>
	<div>

		<table>
			<p>${sucesso}</p>
			<p>${falha}</p>
			<tr>
				<a href="${contextPath}/cliente/lista"> lista clientes </a>
				<a href="${contextPath}/cliente/detalhe/${id}"> lista clientes </a>

			</tr>

		</table>

	</div>

</body>
</html>

