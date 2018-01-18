<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %> <!-- IMPORTANTE PARA PARSEAR JSP -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
    function loadTotales() {
        totalImponibles = 0;
        totalNoImponibles = 0;
        totalDescuentos = 0;

        $.each($("[data-type=1]"), function(key, elem) {
            if (!isNaN(parseInt($(elem).val()))) {
                totalImponibles += parseInt($(elem).val());
                $(elem).val(parseInt($(elem).val()));
            }
        });

        $.each($("[data-type=2]"), function(key, elem) {
            if (!isNaN(parseInt($(elem).val()))) {
                totalNoImponibles += parseInt($(elem).val());
                $(elem).val(parseInt($(elem).val()));
            }
        });

        $.each($("[data-type=3][data-percent!=0]"), function(key, elem) {
            $(elem).val(parseInt(parseFloat($(elem).attr("data-percent")) * totalImponibles / 100));
        });

        $.each($("[data-type=3]"), function(key, elem) {
            if (!isNaN(parseInt($(elem).val()))) {
                totalDescuentos += parseInt($(elem).val());
                $(elem).val(parseInt($(elem).val()));
            }
        });

        $("#totalImponibles").html($.number(totalImponibles, 0, '', '.'));
        $("#totalNoImponibles").html($.number(totalNoImponibles, 0, '', '.'));
        $("#totalDescuentos").html($.number(totalDescuentos, 0, '', '.'));
        $("#totalLiquido").html($.number((totalImponibles - totalDescuentos), 0, '', '.'));

        $("[name=liquidacion_monto_imponible]").val(totalImponibles);
        $("[name=liquidacion_monto_no_imponible]").val(totalNoImponibles);
        $("[name=liquidacion_monto_descuentos]").val(totalDescuentos);
        $("[name=liquidacion_monto_liquido]").val((totalImponibles - totalDescuentos));
    }
</script>

<div class="modal fade" id="liquidacionModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-lg-aux" role="document">
        <form:form action="/personal/${personal.id}/liquidacion/save" id="liquidacionForm">
            <c:if test="${liquidacion != null}">
                <input type="hidden" name="liquidacion_id" value="${liquidacion.id}" />
            </c:if>
            <input type="hidden" name="liquidacion_monto_imponible" value="" />
            <input type="hidden" name="liquidacion_monto_no_imponible" value="" />
            <input type="hidden" name="liquidacion_monto_descuentos" value="" />
            <input type="hidden" name="liquidacion_monto_liquido" value="" />
            <div class="modal-content">
                <div class="modal-body">
                    <div class="card">
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">
                                <div class="form-group row">
                                    <label for="liquidacion_fecha" class="col-sm-2 col-form-label col-form-label-sm">Fecha</label>
                                    <div class="col-sm-4">
                                        <input type="date" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${liquidacion.fecha}" />" id="liquidacion_fecha" name="liquidacion_fecha" class="form-control form-control-sm" required />
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label col-form-label-sm">Rut</label>
                                    <label class="col-sm-4 col-form-label col-form-label-sm">${personal.rut}</label>
                                    <label class="col-sm-2 col-form-label col-form-label-sm">Nombre</label>
                                    <label class="col-sm-4 col-form-label col-form-label-sm">${personal.nombres} ${personal.apellidos}</label>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label col-form-label-sm">Cargo</label>
                                    <label class="col-sm-4 col-form-label col-form-label-sm">${personal.cargo}</label>
                                    <label for="liquidacion_dias_trabajados" class="col-sm-2 col-form-label col-form-label-sm">Días Pagados</label>
                                    <div class="col-sm-4">
                                        <input value="${liquidacion.diasTrabajados}" id="liquidacion_dias_trabajados" name="liquidacion_dias_trabajados" class="form-control form-control-sm" required />
                                    </div>
                                </div>
                            </li>

                            <li class="list-group-item">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <table class="table table-sm-aux">
                                            <thead class="thead-dark">
                                            <tr>
                                                <th scope="col" colspan="3">Haberes Imponibles</th>
                                            </tr>
                                            </thead>
                                            <tbody>

                                            <c:forEach var="item" items="${itemImponibles}" varStatus="loop">
                                                <tr>
                                                    <th width="50" scope="row" class="form-control-noinput">${loop.index + 1}</th>
                                                    <td><input value="${item.nombre}" name="item_1_${item.id}" class="form-control form-control-sm" /></td>
                                                    <td><input value="${item.monto}" data-type="1" name="item_1_${item.id}_monto" onchange="loadTotales();" class="form-control form-control-sm" /></td>
                                                </tr>
                                            </c:forEach>

                                            <tr class="table-active">
                                                <th scope="row" colspan="2">Total Imponible</th>
                                                <td>
                                                    <div id="totalImponibles" style="text-align: right;"></div>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                        <table class="table table-sm-aux">
                                            <thead class="thead-dark">
                                            <tr>
                                                <th scope="col" colspan="3">Haberes No Imponibles</th>
                                            </tr>
                                            </thead>
                                            <tbody>

                                            <c:forEach var="item" items="${itemNoImponibles}" varStatus="loop">
                                                <tr>
                                                    <th width="50" scope="row" class="form-control-noinput">${loop.index + 1}</th>
                                                    <td><input value="${item.nombre}" name="item_2_${item.id}" class="form-control form-control-sm" /></td>
                                                    <td><input value="${item.monto}" data-type="2" name="item_2_${item.id}_monto" onchange="loadTotales();" class="form-control form-control-sm" /></td>
                                                </tr>
                                            </c:forEach>

                                            <tr class="table-active">
                                                <th scope="row" colspan="2">Total No Imponible</th>
                                                <td>
                                                    <div id="totalNoImponibles" style="text-align: right;"></div>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="col-sm-6">
                                        <table class="table table-sm-aux">
                                            <thead class="thead-dark">
                                            <tr>
                                                <th scope="col" colspan="3">Descuentos</th>
                                            </tr>
                                            </thead>
                                            <tbody>

                                            <c:forEach var="item" items="${itemDescuentos}" varStatus="loop">
                                                <c:set var = "indexPrev" scope = "session" value = "${loop.index + 1}"/>
                                                <tr>
                                                    <th width="50" scope="row" class="form-control-noinput">${loop.index + 1}</th>
                                                    <td><input value="${item.nombre}" name="item_3_${item.id}" class="form-control form-control-sm" /></td>
                                                    <td>
                                                        <c:if test="${item.esPorcentaje==1}">
                                                            <input value="" data-percent="${item.monto}" data-type="3" name="item_3_${item.id}_monto" onchange="$(this).attr('data-percent', 0); loadTotales();" class="form-control form-control-sm" />
                                                        </c:if>
                                                        <c:if test="${item.esPorcentaje==0}">
                                                            <input value="${item.monto}" data-percent="0" data-type="3" name="item_3_${item.id}_monto" onchange="loadTotales();" class="form-control form-control-sm" />
                                                        </c:if>
                                                    </td>
                                                </tr>
                                            </c:forEach>

                                            <c:forEach var="personalPago" items="${personalPagoAnticipos}" varStatus="loop">
                                                <input type="hidden" value="${personalPago.monto}" data-type="3" name="pago_3_${personalPago.id}" />
                                                <tr>
                                                    <th width="50" scope="row" class="form-control-noinput">${loop.index + indexPrev + 1}</th>
                                                    <td class="form-control-noinput">
                                                        Anticipo <fmt:formatDate pattern="dd/MM/yyyy" value="${personalPago.fecha}" />
                                                    </td>
                                                    <td class="form-control-noinput">
                                                        <fmt:formatNumber type="number" maxFractionDigits="0" value="${personalPago.monto}" />
                                                    </td>
                                                </tr>
                                            </c:forEach>

                                            <tr class="table-active">
                                                <th scope="row" colspan="2">Total Descuentos</th>
                                                <td>
                                                    <div id="totalDescuentos" style="text-align: right;"></div>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </li>

                            <li class="list-group-item">
                                <div class="row">
                                    <div class="col-sm-3 offset-sm-6">
                                        <div style="font-weight: bold; padding-left: .6rem;">Liquido</div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div id="totalLiquido" style="text-align: right; padding-right: .6rem;"></div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Cerrar</button>
                    <button type="submit" class="btn btn-info btn-sm">Guardar</button>
                </div>
            </div>
        </form:form>
    </div>
</div>
<script>
    loadTotales();
</script>