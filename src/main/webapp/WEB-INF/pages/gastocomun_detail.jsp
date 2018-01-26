<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %> <!-- IMPORTANTE PARA PARSEAR JSP -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        function loadTotales() {
            totalArray = new Array();
            totalProrratear = 0;
            $.each($("[data-pago-monto]"), function(key, elem) {
                tipoId = $(elem).attr("data-pago-tipo");
                if (!totalArray[tipoId]) {
                    totalArray[tipoId] = 0;
                }
                if ($(elem).val() == 1) {
                    totalArray[tipoId] += parseInt($(elem).attr("data-pago-monto"));
                    totalProrratear += parseInt($(elem).attr("data-pago-monto"));
                }
            });

            $.each(totalArray, function(key, value) {
                $("#total_items_" + key).html($.number(value, 0, '', '.'));
            });

            $("#total_comun").html($.number(totalProrratear, 0, '', '.'));
            $("#total_reserva").html($.number(parseInt(totalProrratear * 0.05), 0, '', '.'));
            $("#total_gasto").html($.number(parseInt(totalProrratear * 1.05), 0, '', '.'));
            $("[name=gastocomun_monto_comun]").val(totalProrratear);
            $("[name=gastocomun_monto_reserva]").val(parseInt(totalProrratear * 0.05));
            $("[name=gastocomun_monto_total]").val(parseInt(totalProrratear * 1.05));
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
    <jsp:param name="selected" value="gastocomun"/>
</jsp:include>

<div class="container">
    <form:form action="/gastocomun/save" id="gastocomunForm">
        <c:if test="${gastocomun != null}">
            <input type="hidden" name="gastocomun_id" value="${gastocomun.id}" />
        </c:if>
        <input type="hidden" name="gastocomun_monto_comun" value="" />
        <input type="hidden" name="gastocomun_monto_reserva" value="" />
        <input type="hidden" name="gastocomun_monto_total" value="" />

        <div class="card" style="margin-bottom: 20px">
            <div class="card-header">Gasto Comun</div>
            <div class="card-body">
                <div class="form-group row">
                    <label for="gastocomun_fecha" class="col-sm-3 col-form-label col-form-label-sm">Fecha</label>
                    <div class="col-sm-9">
                        <input type="date" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${gastocomun.fecha}" />" class="form-control form-control-sm" id="gastocomun_fecha" name="gastocomun_fecha" required />
                    </div>
                </div>
                <div class="form-group row">
                    <label for="gastocomun_vencimiento" class="col-sm-3 col-form-label col-form-label-sm">Vencimiento</label>
                    <div class="col-sm-9">
                        <input type="date" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${gastocomun.fecha}" />" class="form-control form-control-sm" id="gastocomun_vencimiento" name="gastocomun_vencimiento" required />
                    </div>
                </div>
                <div class="form-group row">
                    <label for="gastocomun_observaciones" class="col-sm-3 col-form-label col-form-label-sm">Observaciones</label>
                    <div class="col-sm-9">
                        <textarea class="form-control form-control-sm" id="gastocomun_observaciones" name="gastocomun_observaciones" rows="3">${gastocomun.observaciones}</textarea>
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
            <div class="card-header">Detalle</div>
            <div class="card-body">
                <c:set var="pagos" value="${personalPagos}" scope="request"/>
                <jsp:include flush="true" page="partials/_gastocomun_item_plug_table.jsp">
                    <jsp:param name="tipoNombre" value="Gastos de Administración"/>
                    <jsp:param name="tipoId" value="0"/>
                    <jsp:param name="viewTipo" value="personal"/>
                </jsp:include>

                <c:forEach var="cuentaTipo" items="${cuentaTipos}">
                    <c:set var="pagos" value="${boletaPagosByTipo.get(cuentaTipo.key)}" scope="request"/>
                    <jsp:include flush="true" page="partials/_gastocomun_item_plug_table.jsp">
                        <jsp:param name="tipoNombre" value="${cuentaTipo.value}"/>
                        <jsp:param name="tipoId" value="${cuentaTipo.key}"/>
                        <jsp:param name="viewTipo" value="boleta"/>
                    </jsp:include>
                </c:forEach>

                <table class="table table-sm-aux">
                    <thead class="bg-info" style="color: #fff;">
                    <tr>
                        <th scope="col" colspan="6">Totales</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr class="table-light">
                        <th scope="row">Subtotal gastos a prorratear</th>
                        <td><div id="total_comun" class="monto-nofinal"></div></td>
                        <td width="60"></td>
                    </tr>
                    <tr class="table-light">
                        <th scope="row">Fondo de reserva (5%)</th>
                        <td><div id="total_reserva" class="monto-nofinal"></div></td>
                        <td width="60"></td>
                    </tr>
                    <tr class="table-active">
                        <th scope="row">Total gasto comun del mes</th>
                        <td><div id="total_gasto" class="monto-nofinal"></div></td>
                        <td width="60"></td>
                    </tr>
                    </tbody>
                </table>
                <div class="form-group row" style="margin-top: 30px">
                    <div class="col-sm-12">
                        <button type="submit" class="btn btn-info btn-sm">Guardar</button>
                        <a href="/gastocomun/${gastocomun.id}/prorratear" class="btn btn-dark btn-sm">Prorratear</a>
                    </div>
                </div>
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
                </jsp:include>
            </div>
        </div>

        <div class="card" style="margin-bottom: 20px">
            <div class="card-header">
                Remuneraciones pagadas
            </div>
            <div class="card-body">
                <c:set var="pagos" value="${personalPagos}" scope="request"/>
                <jsp:include flush="true" page="partials/_gastocomun_item_unplug_table.jsp">
                    <jsp:param name="viewTipo" value="personal"/>
                </jsp:include>
            </div>
        </div>

    </form:form>

</div>

</body>
</html>
