<%@ tag language="java" pageEncoding="utf-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ attribute name="titulo" required="true" %>
<%@ attribute name="bodyClass" required="false" %>
<%@ attribute name="extraScripts" fragment="true" %>

<c:url value="/" var="contextPath" />

<c:url value="/resources/css" var="cssPath" />
<c:url value="/resources/js" var="jsPath" />
<c:url value="/resources/css/csstemplate" var="cssTemplatePath" />

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../../../favicon.ico">

    <title>Template para o carousel Bootstrap</title>

    <!-- Principal CSS do Bootstrap -->
    <link href="${cssPath}/bootstrap.min.css" rel="stylesheet">

    <!-- Estilos customizados para esse template -->
    <link href="${cssTemplatePath }/carousel.css" rel="stylesheet">
    
  </head>
  <body class="${bodyClass}">

    <%@ include file="/WEB-INF/views/cabecalho.jsp" %>

    <jsp:doBody />


    <%@ include file="/WEB-INF/views/rodape.jsp" %>
    
    
    <!-- Principal JavaScript do Bootstrap
    ================================================== -->
    <!-- Foi colocado no final para a pÃ¡gina carregar mais rÃ¡pido -->
    <script src="${cssTemplatePath }/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="${cssTemplatePath }/jquery-slim.min.js"><\/script>')</script>
    <script src="${cssTemplatePath }/popper.min.js"></script>
    <script src="${cssTemplatePath }/bootstrap.min.js"></script>

    </body>
</html>