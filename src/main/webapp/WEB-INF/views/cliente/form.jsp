<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<tags:pageTemplate titulo="Home ">
	<div class="col-md-8 order-md-1">
		<div class="container">
			<div class="panel panel-default">
				<div class="panel-body">

					<s:url value="/novo-cliente/cadastrar" var="cadastrar" />
					<form:form servletRelativeAction="${cadastrar }" method="post"
						modelAttribute="cliente" enctype="multipart/form-data">

						<div class="form-group">
							<label>Nome Completo</label>
							<form:input path="titular.nome" class="form-control"
								placeholder="Sucupira Silva " />
							<form:errors path="titular.nome" />
						</div>
						<div class="row">
							<div class="col-md-3 mb-3">
								<form:label path="titular.cpf">CPF 
								<span class="text-muted">(Somente n�meros)</span>
									<form:input path="titular.cpf" class="form-control"
										placeholder="123456789" />
									<form:errors path="titular.rg" />
								</form:label>
							</div>

							<div class="col-md-3 mb-3">
								<form:label path="titular.rg">Rg 
								<span class="text-muted">(Somente n�meros)</span>
									<form:input path="titular.rg" class="form-control"
										placeholder="123456789" />
									<form:errors path="titular.rg" />
								</form:label>
							</div>

							<div class="col-md-3 mb-3">
								<form:label path="titular.dataNascimento">Data de Nascimento
									<form:input path="titular.dataNascimento" class="form-control"
										placeholder="01/01/2001" />
									<form:errors path="titular.dataNascimento" />
								</form:label>
							</div>

							<div class="col-md-3 mb-3">
								<label>Genero</label>
								<form:select path="titular.genero"
									class="custom-select d-block w-100">
									<option value="">Escolha...</option>
									<c:forEach items="${genero}" var="genero">
										<form:option value="${genero}"></form:option>
									</c:forEach>
								</form:select>
							</div>
						</div>

						<form:form servletRelativeAction="${cadastrar }" method="post"
							modelAttribute="usuario">
							<div>
								<label>Email</label>
								<form:input path="email" class="form-control"
									placeholder="seunome@exemplo.com" />
								<form:errors path="email" />
							</div>

							<div class="form-group">

								<label>Senha</label>
								<form:input path="senha" class="form-control"
									placeholder="HG101tiOasP" />
								<form:errors path="senha" />
							</div>
							<button type="submit">Cadastrar</button>
						</form:form>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</tags:pageTemplate>