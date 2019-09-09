<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="/" var="contextPath" />
<c:url value="/resources/css" var="cssPath" />

<tags:pageTemplate titulo="Erro, estagiário econtrado.">

	<div class="text-center">
		<div class="w-auto p-3">
			<img class="align-self-center mr-3"
				src="https://media.giphy.com/media/mJy7e4Gip11pC/giphy.gif">
		</div>
		<div class="media-body">
			<h3 class="mt-0">Ih... parece que deu algum erro, mas não se
				preocupe ja iremos resolver o problema.</h3>
			<p>É verdade esse bilhete.</p>
		</div>
	</div>


	<!-- 
        Mensagem: ${exception.message}
        <c:forEach items="${exception.stackTrace}" var="stk">
            ${stk}
        </c:forEach>    
    -->
</tags:pageTemplate>
