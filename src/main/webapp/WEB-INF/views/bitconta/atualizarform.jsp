<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<tags:pageTemplate titulo="Form Atualização ">
	<div class="container">
		<div class="panel panel-default">
			<div class="panel-body">
			
				<s:url value="/bitconta/atualiar" var="atualizar" />
				<form:form servletRelativeAction="${atualizar}" method="post"
					modelAttribute="cliente" enctype="multipart/form-data">
					

					<div class="form-group">
						<label>Nome</label>
						<form:input path="titular.nome" class="form-control" />
							<form:errors path="titular.nome" />
					</div>

					<div class="form-group">
						<label>Rg</label>
						<form:input path="titular.rg" class="form-control" />
							<form:errors path="titular.rg" />
					</div>

					<div class="form-group">
						<form:label path="titular.cpf">CPF 
						<form:input path="titular.cpf" class="form-control" />
							<form:errors path="titular.rg" />
						</form:label>

					</div>

					<div class="form-group">
						<form:label path="titular.dataNascimento">Data de Nascimento
						<form:input path="titular.dataNascimento" class="form-control" />
							<form:errors path="titular.dataNascimento" />
						</form:label>

					</div>
				</form:form>
				
			</div>
		</div>
	</div>
</tags:pageTemplate>