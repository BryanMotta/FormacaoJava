<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ include file="/WEB-INF/views/cabecalho.jsp"%>

<div class="style__LayoutContent-sc-10egk4p-0 jDdZjs">
	<section
		class="structure-section Section__StyledSection-eh60l-0 eIdIeT">
		<article class="Section__StyledArticle-eh60l-1 iYjLqP">
			<div class="style__SectionContent-sc-1c8u6wd-1 cdVsYN">
				<div class="style__CopyContent-sc-1c8u6wd-4 jwFRlQ">
					<form:form action="${s:mvcUrl('NCC#gravar').build() }"
						method="post" modelAttribute="cliente"
						enctype="multipart/form-data">

						<div>
							<label>Nome Titular</label>
							<form:input path="titular.nome" />
							<form:errors path="titular.nome" />
						</div>

						<div>
							<form:label path="titular.rg">Rg Titular
				<form:input path="titular.rg" />
								<form:errors path="titular.rg" />
							</form:label>
						</div>

						<div>
							<form:label path="titular.cpf">CPF Titular
			<form:input path="titular.cpf" />
								<form:errors path="titular.rg" />
							</form:label>

						</div>

						<div>
							<form:label path="titular.dataNascimento">Data Nascimento
			<form:input path="titular.dataNascimento" />
								<form:errors path="titular.dataNascimento" />
							</form:label>

						</div>

						<div>
							<form:label path="conta.agencia">Agencia
			<form:input path="conta.agencia" />
								<form:errors path="conta.agencia" />
							</form:label>

						</div>

						<div>
							<form:label path="conta.numero">Numero
			<form:input path="conta.numero" />
								<form:errors path="conta.numero" />
							</form:label>

						</div>

						<div>
							Genero
							<c:forEach items="${genero}" var="genero">
								<form:radiobutton path="titular.genero" label="${genero}"
									value="${genero}" />
							</c:forEach>
						</div>

						<div>
							<label>Foto Perfil</label> <input name="fotoPerfil" type="file" />

						</div>

						<button type="submit">Cadastrar</button>
					</form:form>
				</div>
			</div>
		</article>
	</section>

</div>

<%@ include file="/WEB-INF/views/rodape.jsp"%>