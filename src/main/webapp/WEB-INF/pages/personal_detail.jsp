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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/df-number-format/2.1.6/jquery.number.min.js"></script>

    <link rel="stylesheet" type="text/css" media="screen" href="/resources/css/main.css" />

    <script>
        function loadPersonalItemModal(url) {
            $.get(url, function (data) {
                $("#personalItemModalContent").children().remove();
                $("#personalItemModalContent").append(data);
                $('#personalItemModal').modal();
            });
        }

        function loadLiquidacionModal(url) {
            $.get(url, function (data) {
                $("#liquidacionModalContent").children().remove();
                $("#liquidacionModalContent").append(data);
                $('#liquidacionModal').modal();
            });
        }

        function loadPersonalPagoModal(url) {
            $.get(url, function (data) {
                $("#personalPagoModalContent").children().remove();
                $("#personalPagoModalContent").append(data);
                $('#personalPagoModal').modal();
            });
        }
    </script>

</head>
<body>

<jsp:include page="partials/_menu.jsp" >
    <jsp:param name="selected" value="personal"/>
</jsp:include>
<jsp:include page="partials/_attached_modal.jsp" />

<div class="container">
    <div class="card" style="margin-bottom: 20px">
        <div class="card-header">Personal</div>
        <div class="card-body">
            <jsp:include page="partials/_personal_form.jsp" />
        </div>
    </div>

    <div class="card" style="margin-bottom: 20px">
        <div class="card-header">
            Haberes / Descuentos
        </div>
        <div class="card-body">
            <button type="button" onclick="loadPersonalItemModal('/personal/${personal.id}/item/new')" class="btn btn-info btn-sm" style="margin-bottom: 1rem;">Agregar nuevo</button>
            <div class="row">
                <div class="col-sm-6">
                    <c:set var="personalItems" value="${personalItemImponibles}" scope="request"/>
                    <jsp:include flush="true" page="partials/_personal_item_table.jsp">
                        <jsp:param name="title" value="Haberes Imponibles"/>
                    </jsp:include>

                    <c:set var="personalItems" value="${personalItemNoImponibles}" scope="request"/>
                    <jsp:include flush="true" page="partials/_personal_item_table.jsp">
                        <jsp:param name="title" value="Haberes No Imponibles"/>
                    </jsp:include>
                </div>
                <div class="col-sm-6">
                    <c:set var="personalItems" value="${personalItemDescuentos}" scope="request"/>
                    <jsp:include flush="true" page="partials/_personal_item_table.jsp">
                        <jsp:param name="title" value="Descuentos"/>
                    </jsp:include>
                </div>
            </div>
        </div>
    </div>

    <div id="personalItemModalContent"></div>

    <div class="card" style="margin-bottom: 20px">
        <div class="card-header">
            Liquidaciones
        </div>
        <div class="card-body">
            <button type="button" onclick="loadLiquidacionModal('/personal/${personal.id}/liquidacion/new')" class="btn btn-info btn-sm" style="margin-bottom: 1rem;">Agregar nuevo</button>
            <jsp:include page="partials/_liquidacion_table.jsp" />
        </div>
    </div>

    <div id="liquidacionModalContent"></div>

    <div class="card" style="margin-bottom: 20px">
        <div class="card-header">
            Pagos
        </div>
        <div class="card-body">
            <button type="button" onclick="loadPersonalPagoModal('/personal/${personal.id}/pago/new')" class="btn btn-info btn-sm" style="margin-bottom: 1rem;">Agregar nuevo</button>
            <jsp:include page="partials/_personal_pago_table.jsp" />
        </div>
    </div>

    <div id="personalPagoModalContent"></div>

</div>

</body>
</html>
