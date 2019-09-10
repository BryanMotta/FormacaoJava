<%@ tag language="java" pageEncoding="utf-8"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%@ attribute name="titulo" required="true" %>
<%@ attribute name="bodyClass" required="false" %>
<%@ attribute name="extraScripts" fragment="true" %>

<s:url value="/" var="contextPath" />

<s:url value="/resources/css" var="cssPath" />
<s:url value="/resources/js" var="jsPath" />

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
    <link href="${cssPath }/carousel.css" rel="stylesheet">
    
     <!-- Principal JavaScript do Bootstrap
    ================================================== -->
    <!-- Foi colocado no final para a pÃ¡gina carregar mais rÃ¡pido -->
    <script src="${jsPath }/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="${jsPath }/jquery-slim.min.js"><\/script>')</script>
    <script src="${jsPath }/popper.min.js"></script>
    <script src="${jsPath }/bootstrap.min.js" ></script>
    
    
  </head>
  <body class="${bodyClass}">

    <%@ include file="/WEB-INF/views/cabecalho.jsp" %>

    <jsp:doBody />


    <%@ include file="/WEB-INF/views/rodape.jsp" %>
    
    
   

    </body>
</html>