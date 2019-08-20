<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="/WEB-INF/views/cabecalho.jsp"%>

<div class="style__LayoutContent-sc-10egk4p-0 jDdZjs">
	<section
		class="structure-section Section__StyledSection-eh60l-0 eIdIeT">
		<article class="Section__StyledArticle-eh60l-1 iYjLqP">
			<div class="style__SectionContent-sc-1c8u6wd-1 cdVsYN">
				<div class="style__CopyContent-sc-1c8u6wd-4 jwFRlQ">

					<table>
						<tr>
							<td>Nome:${cliente.titular.nome}</td>
							<td>RG:${cliente.titular.rg}</td>
							<td>CPF:${cliente.titular.cpf}</td>
							<td>Data Nascimento:<fmt:formatDate pattern="dd/MM/yyyy" value="${cliente.titular.dataNascimento.time}" /></td>
							<td>Genero:${cliente.titular.genero}</td>
						</tr>

					</table>

				</div>
			</div>
		</article>
	</section>

</div>

<%@ include file="/WEB-INF/views/rodape.jsp"%>