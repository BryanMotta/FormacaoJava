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

	<form:form action="${s:mvcUrl('TC#deposita').arg(0,cliente.id).build() }" method="post"
		modelAttribute="cliente">
		<div>
		<input type="number" name="conta.deposita" />		
		<button type="submit">Depositar</button>
		</div>
	</form:form>
	
	



</body>
</html>