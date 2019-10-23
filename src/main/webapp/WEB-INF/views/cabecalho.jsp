<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>



<header>
	<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
		<a class="navbar-brand" href="<s:url value="/"/>">BitBank</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarCollapse" aria-controls="navbarCollapse"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarCollapse">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="<s:url value="/"/>">Home
						<span class="sr-only">(atual)</span>
				</a></li>
				<security:authorize access="hasRole('ROLE_ADMIN')">
				<li class="nav-item"><a class="nav-link" href="<s:url value="/cliente/lista"/>">Lista Clientes</a></li>
				</security:authorize>
				<li class="nav-item"><a class="nav-link " href="<s:url value="/bitconta"/>">BitConta</a>
				
			</ul>
			<security:authorize access="!isAuthenticated()">
				<ul>
					<li class="nav-item"><a
						class="nav-link btn btn-outline-success btn-lg"
						href="<s:url value="/login"/>">Login</a></li>
				</ul>
				<ul>
					<li class="nav-item"><a
						class="nav-link btn btn-success btn-lg"
						href="<s:url value="/novo-cliente/cadastrar"/>">Quero ser BitBank</a></li>
				</ul>
			</security:authorize>
			<security:authorize access="isAuthenticated()">
			<ul>
					<li class="nav-item"><a
						class="nav-link btn btn-success "
						href="<s:url value="/bitconta"/>">
						Profile: <security:authentication property="principal.username" /></a></li>
				</ul>
			</security:authorize>
		</div>
	</nav>
</header>