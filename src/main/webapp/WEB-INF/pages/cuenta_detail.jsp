<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %> <!-- IMPORTANTE PARA PARSEAR JSP -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>Title</title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>

    <link rel="stylesheet" type="text/css" media="screen" href="/resources/css/main.css" />

</head>
<body>

<jsp:include page="partials/_menu.jsp" />

<div class="container">
    <div class="card" style="margin-bottom: 20px">
        <div class="card-header">Cuenta</div>
        <div class="card-body">
            <jsp:include page="partials/_cuenta_form.jsp" />
        </div>
    </div>

    <div class="card">
        <div class="card-header">
            Boletas
        </div>
        <div class="card-body">
            <a href="/cuenta/${cuenta.id}/boleta/new" class="btn btn-info btn-sm" style="margin-bottom: 1rem;">Agregar nuevo</a>
            <jsp:include page="partials/_boleta_table.jsp" />
        </div>
    </div>
</div>

</body>
</html>
