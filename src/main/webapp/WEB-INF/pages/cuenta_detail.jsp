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

    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/parsley.js/2.8.0/parsley.min.js"></script>
    <script src="/resources/js/validacion.js"></script>

    <link rel="stylesheet" type="text/css" media="screen" href="/resources/css/main.css" />

    <script>
        function loadBoletaModal(url) {
            $.get(url, function (data) {
                $("#boletaModalContent").children().remove();
                $("#boletaModalContent").append(data);
                $('#boletaModal').modal();
            });
        }

        function loadBoletaPagoModal(url) {
            $.get(url, function (data) {
                console.log(url);
                console.log(data);
                $("#boletaPagoModalContent").children().remove();
                $("#boletaPagoModalContent").append(data);
                $('#boletaPagoModal').modal();
            });
        }
    </script>

</head>
<body>

<jsp:include page="partials/_menu.jsp" >
    <jsp:param name="selected" value="cuenta"/>
</jsp:include>
<jsp:include page="partials/_attached_modal.jsp" />
<jsp:include page="partials/_delete_modal.jsp" />

<div class="container">
    <div class="card" style="margin-bottom: 20px">
        <div class="card-header">Cuenta</div>
        <div class="card-body">
            <jsp:include page="partials/_cuenta_form.jsp" />
        </div>
    </div>

    <c:if test="${cuenta != null}">
        <div class="card" style="margin-bottom: 20px">
            <div class="card-header">
                Boletas
            </div>
            <div class="card-body">
                <button type="button" onclick="loadBoletaModal('/cuenta/${cuenta.id}/boleta/new')" class="btn btn-info btn-sm" style="margin-bottom: 1rem;">Agregar nuevo</button>
                <jsp:include page="partials/_boleta_table.jsp" />
            </div>
        </div>

        <div id="boletaModalContent"></div>

        <div class="card" style="margin-bottom: 20px">
            <div class="card-header">
                Pagos
            </div>
            <div class="card-body">
                <button type="button" onclick="loadBoletaPagoModal('/cuenta/${cuenta.id}/boletaPago/new')" class="btn btn-info btn-sm" style="margin-bottom: 1rem;">Agregar nuevo</button>
                <jsp:include page="partials/_boleta_pago_table.jsp" />
            </div>
        </div>

        <div id="boletaPagoModalContent"></div>
    </c:if>

</div>

</body>
</html>
