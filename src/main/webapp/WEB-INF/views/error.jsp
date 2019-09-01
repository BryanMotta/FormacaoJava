<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="/" var="contextPath" />
<c:url value="/resources/css" var="cssPath" />

<tags:pageTemplate titulo="Erro, estagiário econtrado.">
	<main role="main">
		<div class="container">
			<img src="https://media.giphy.com/media/mJy7e4Gip11pC/giphy.gif">
		</div>
		<div class="container">
			<h1>Ih... parece que deu algum erro, mas não se preocupe ja iremos resolver o
			problema. <h1> 
			<tl>É verdade esse bilhete.</tl>
		</div>

	<!-- 
        Mensagem: ${exception.message}
        <c:forEach items="${exception.stackTrace}" var="stk">
            ${stk}
        </c:forEach>    
    --> </main>
</tags:pageTemplate>
