
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
					<div class="container">
						<table class="table table-bordered table-striped table-hover">
							<tr>
								<th>Nome</th>
								<th>RG</th>
								<th>CPF</th>
							</tr>

							<c:forEach items="${cliente}" var="cliente">
								<tr>
									<th><a
										href="${s:mvcUrl('CC#detalhe').arg(0,cliente.id).build() }">${cliente.titular.nome}</th>
									</a>
									<th>${cliente.titular.rg}</th>
									<th>${cliente.titular.cpf}</th>
									<th><a
										href="${s:mvcUrl('TC#form').arg(0,cliente.id).build() }">Depositar
											nessa conta</th>
									</a>
								</tr>
							</c:forEach>

						</table>
						<p>${sucesso}</p>

					</div>
				</div>
		</article>
	</section>
</div>
</div>

<%@ include file="/WEB-INF/views/rodape.jsp"%>
