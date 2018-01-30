<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %> <!-- IMPORTANTE PARA PARSEAR JSP -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
        function loadTotales() {
            total = 0;
            $.each($("[data-pago-monto]"), function(key, elem) {
                if ($(elem).val() == 1) {
                    total += parseInt($(elem).attr("data-pago-monto"));
                }
            });

            $("#total_items_0").html($.number(total, 0, '', '.'));
            $("[name=consumo_monto]").val(total);
        }

        function changeItem(viewTipo, pagoId, currentStatus) {
            if (currentStatus == 0) {
                $("#row_item_" + viewTipo + "_" + pagoId).show();
                $("#row_pago_" + viewTipo + "_" + pagoId).hide();
                $("[name=item_" + viewTipo + "_" + pagoId + "]").val(1);
            }
            else {
                $("#row_item_" + viewTipo + "_" + pagoId).hide();
                $("#row_pago_" + viewTipo + "_" + pagoId).show();
                $("[name=item_" + viewTipo + "_" + pagoId + "]").val(0);
            }
            loadTotales();
        }

        $(document).ready(function() {
            loadTotales();
        });
    </script>

</head>
<body>

<jsp:include page="partials/_menu.jsp" >
    <jsp:param name="selected" value="consumo"/>
</jsp:include>
<jsp:include page="partials/_attached_modal.jsp" />

<div class="container">
    <form:form action="/consumo/save" id="consumoForm">
        <c:if test="${consumo != null}">
            <input type="hidden" name="consumo_id" value="${consumo.id}" />
        </c:if>
        <input type="hidden" name="consumo_monto" value="" />

        <div class="card" style="margin-bottom: 20px">
            <div class="card-header">Consumo</div>
            <div class="card-body">
                <div class="form-group row">
                    <label for="consumo_nombre" class="col-sm-2 col-form-label col-form-label-sm">Nombre</label>
                    <div class="col-sm-10">
                        <input value="${consumo.nombre}" class="form-control form-control-sm" id="consumo_nombre" name="consumo_nombre" required />
                    </div>
                </div>
                <div class="form-group row">
                    <label for="consumo_fecha" class="col-sm-2 col-form-label col-form-label-sm">Fecha</label>
                    <div class="col-sm-10">
                        <input type="date" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${consumo.fecha}" />" class="form-control form-control-sm" id="consumo_fecha" name="consumo_fecha" required />
                    </div>
                </div>
                <div class="form-group row">
                    <label for="consumo_cantidad" class="col-sm-2 col-form-label col-form-label-sm">Cantidad</label>
                    <div class="col-sm-10">
                        <input value="${consumo.cantidad}" class="form-control form-control-sm" id="consumo_cantidad" name="consumo_cantidad" />
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-12">
                        <button type="submit" class="btn btn-info btn-sm">Guardar</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="card" style="margin-bottom: 20px">
            <div class="card-header">
                Consumo Por Departamento
            </div>
            <div class="card-body">
                <div class="row">
                    <c:forEach var="departamentoGrupo" items="${departamentoConsumoGrupos}" varStatus="loop">
                        <div class="col-sm-4">
                            <table class="table table-sm-aux">
                                <thead class="thead-dark">
                                <tr>
                                    <th scope="col">Departamento</th>
                                    <th scope="col">Consumo</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="departamentoConsumo" items="${departamentoGrupo}" varStatus="loop">
                                    <tr>
                                        <td class="form-control-noinput">${departamentoConsumo.departamento.nombre}</td>
                                        <td><input type="text" name="departamento_${departamentoConsumo.departamento.id}_${departamentoConsumo.id}_consumo" value="${departamentoConsumo.cantidad}" class="form-control form-control-sm"></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>

        <div class="card" style="margin-bottom: 20px">
            <div class="card-header">Detalle</div>
            <div class="card-body">
                <c:set var="pagos" value="${boletaPagos}" scope="request"/>
                <jsp:include flush="true" page="partials/_gastocomun_item_plug_table.jsp">
                    <jsp:param name="tipoNombre" value="Boletas Consumo"/>
                    <jsp:param name="tipoId" value="0"/>
                    <jsp:param name="viewTipo" value="boleta"/>
                    <jsp:param name="viewContainer" value="consumo"/>
                </jsp:include>
            </div>
        </div>

        <div class="card" style="margin-bottom: 20px">
            <div class="card-header">
                Boletas pagadas
            </div>
            <div class="card-body">
                <c:set var="pagos" value="${boletaPagos}" scope="request"/>
                <jsp:include flush="true" page="partials/_gastocomun_item_unplug_table.jsp">
                    <jsp:param name="viewTipo" value="boleta"/>
                    <jsp:param name="viewContainer" value="consumo"/>
                </jsp:include>
            </div>
        </div>

    </form:form>
</div>

</body>
</html>
