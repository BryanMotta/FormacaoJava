<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<tags:pageTemplate titulo="Home ">


	<div class="col-md-8 order-md-1">
		<div class="container">
			<div class="panel panel-default">
				<div class="panel-body">

					<s:url value="/bitconta/atualizar" var="cadastrar" />
					<form:form servletRelativeAction="${atualizar}" method="post"
						modelAttribute="cliente" enctype="multipart/form-data">
						<fieldset disabled>
							<div class="form-group">
								<label>Nome Completo</label>
								<form:input path="titular.nome" class="form-control"
									placeholder="Sucupira Silva " />
								<form:errors path="titular.nome" />
							</div>
							<div class="row">
								<div class="col-md-3 mb-3">
									<form:label path="titular.cpf">CPF 
								<span class="text-muted">(Somente números)</span>
										<form:input path="titular.cpf" class="form-control"
											placeholder="123456789" />
										<form:errors path="titular.rg" />
									</form:label>
								</div>

								<div class="col-md-3 mb-3">
									<form:label path="titular.rg">Rg 
								<span class="text-muted">(Somente números)</span>
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
						</fieldset>
					</form:form>
					
					<div class="col-md-12 text-center">
							<a class="btn btn-success" href="<s:url 
							value="/bitconta/atualizar"/>"> Atualizar</a>
							<a class="btn btn-danger" href="<s:url 
							value="/bitconta/deletar"/>"> Deletar Conta</a>
						</div>
				</div>
			</div>
		</div>
	</div>

</tags:pageTemplate>
