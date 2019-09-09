<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<tags:pageTemplate titulo="Home ">
	<div class="container">
		<div class="panel panel-default">
			<div class="panel-body">

				<s:url value="/novo-cliente/cadastrar" var="cadastrar" />
				<form:form servletRelativeAction="${cadastrar }" method="post"
					modelAttribute="cliente" enctype="multipart/form-data">

					<div class="form-group">
						<label>Nome</label>
						<form:input path="titular.nome" class="form-control" />
						<form:errors path="titular.nome" />
					</div>

					<div class="form-group">
						<form:label path="titular.rg">Rg 
				<form:input path="titular.rg" class="form-control" />
							<form:errors path="titular.rg" />
						</form:label>
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

					<div class="radio">
						Genero
						
						<c:forEach items="${genero}" var="genero">
							<label class="radio-inline"><form:radiobutton path="titular.genero" label="${genero} "
								value="${genero}" class="radio-inline" />
						</label>
						</c:forEach>
					</div>
					<form:form servletRelativeAction="${cadastrar }" method="post"
						modelAttribute="usuario">
						<div>
							<label>Email</label>
							<form:input path="email" class="form-control" />
							<form:errors path="email" />
						</div>

						<div class="form-group">
							<label>Senha</label>
							<form:input path="senha" class="form-control" />
							<form:errors path="senha" />
						</div>
						<button type="submit">Cadastrar</button>
					</form:form>
				</form:form>
			</div>
		</div>
	</div>
</tags:pageTemplate>