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
        <div class="card-header">Boleta</div>
        <div class="card-body">
            <form:form action="/cuenta/${cuentaId}/boleta/save" id="boletaForm">
                <input type="hidden" name="cuenta_id" value="${cuenta_id}" />
                <c:if test="${boleta != null}">
                    <input type="hidden" name="boleta_id" value="${boleta.id}" />
                </c:if>
                <div class="form-group row">
                    <label for="boleta_folio" class="col-sm-2 col-form-label col-form-label-sm">Folio</label>
                    <div class="col-sm-10">
                        <input value="${boleta.folio}" class="form-control form-control-sm" id="boleta_folio" name="boleta_folio" />
                    </div>
                </div>
                <div class="form-group row">
                    <label for="boleta_adjunto" class="col-sm-2 col-form-label col-form-label-sm">Adjunto</label>
                    <div class="col-sm-10">
                        <input value="${boleta.adjunto}" class="form-control form-control-sm" id="boleta_adjunto" name="boleta_adjunto" />
                    </div>
                </div>
                <div class="form-group row">
                    <label for="boleta_monto" class="col-sm-2 col-form-label col-form-label-sm">Monto</label>
                    <div class="col-sm-10">
                        <input value="${boleta.monto}" class="form-control form-control-sm" id="boleta_monto" name="boleta_monto" />
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
            Pagos
        </div>
        <div class="card-body">
            <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#boletaPagoForm" style="margin-bottom: 1rem;">Pagar</button>
            <jsp:include page="partials/_boleta_pago_table.jsp" />
        </div>
    </div>

    <jsp:include page="partials/_boleta_pago_form.jsp" />
</div>

</body>
</html>
