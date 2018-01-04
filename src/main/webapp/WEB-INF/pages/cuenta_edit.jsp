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
            <form:form action="/cuenta/save" id="cuentaForm">
                <c:if test="${cuenta != null}">
                    <input type="hidden" name="cuenta_id" value="${cuenta.id}" />
                </c:if>
                <div class="form-group row">
                    <label for="cuenta_nombre" class="col-sm-2 col-form-label col-form-label-sm">Nombre</label>
                    <div class="col-sm-10">
                        <input value="${cuenta.nombre}" class="form-control form-control-sm" id="cuenta_nombre" name="cuenta_nombre" />
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label col-form-label-sm">Tipo ${cuenta.tipo}</label>
                    <div class="col-sm-10">
                        <div class="btn-group btn-group-sm" data-toggle="buttons">
                            <label class="btn btn-secondary ${cuenta.tipo == 0 ? "active" : ""}">
                                <input type="radio" name="cuenta_tipo" value="0" autocomplete="off" ${cuenta.tipo == 0 ? "checked" : ""}>Cuenta
                            </label>
                            <label class="btn btn-secondary ${cuenta.tipo == 1 ? "active" : ""}">
                                <input type="radio" name="cuenta_tipo" value="1" autocomplete="off" ${cuenta.tipo == 1 ? "checked" : ""}>Mantencion
                            </label>
                            <label class="btn btn-secondary ${cuenta.tipo == 2 ? "active" : ""}">
                                <input type="radio" name="cuenta_tipo" value="2" autocomplete="off" ${cuenta.tipo == 2 ? "checked" : ""}>Extra
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-10">
                        <button type="submit" class="btn btn-info btn-sm">Guardar</button>
                    </div>
                </div>
            </form:form>
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
