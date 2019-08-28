<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:url value="/resources/css" var="cssPath" />

<!doctype html>
<html lang="pt-br">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../../../favicon.ico">

    <title>Login BitBank</title>

    <!-- Principal CSS do Bootstrap -->
    <link rel="stylesheet" href="${cssPath}/bootstrap.min.css" />

    <!-- Estilos customizados para esse template -->
    <link href="${cssPath}/csslogin/signin.css" rel="stylesheet">
  </head>

  <body class="text-center">
    <form:form servletRelativeAction="/login" method="POST" class="form-signin">
      <img class="mb-4" src="${cssPath}/csslogin/bootstrap-solid.svg" alt="" width="72" height="72">
      <h1 class="h3 mb-3 font-weight-normal">Faça login</h1>
      <label for="inputEmail" class="sr-only">Endereço de email</label>
      <input type="email" id="inputEmail" name="username" class="form-control" placeholder="Seu email" required autofocus>
      <label for="inputPassword" class="sr-only">Senha</label>
      <input type="password" id="inputPassword" name="password" class="form-control" placeholder="Senha" required>
      <div class="checkbox mb-3">
        <label>
          <input type="checkbox" value="remember-me"> Lembrar de mim
        </label>
      </div>
      <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
      <p class="mt-5 mb-3 text-muted">&copy; 2019-2019</p>
    </form:form>
  </body>
</html>
