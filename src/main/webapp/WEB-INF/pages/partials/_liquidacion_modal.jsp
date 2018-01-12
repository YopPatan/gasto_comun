<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %> <!-- IMPORTANTE PARA PARSEAR JSP -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
    function loadTotales() {
        totalHaberes = 0;
        totalDescuentos = 0;

        $.each($("[data-type=1]"), function(key, elem) {
            if (!isNaN(parseInt($(elem).val()))) {
                totalHaberes += parseInt($(elem).val());
                $(elem).val(parseInt($(elem).val()));
            }
        });

        $.each($("[data-type=2][data-percent!=0]"), function(key, elem) {
            $(elem).val(parseInt(parseFloat($(elem).attr("data-percent")) * totalHaberes / 100));
        });

        $.each($("[data-type=2]"), function(key, elem) {
            if (!isNaN(parseInt($(elem).val()))) {
                totalDescuentos += parseInt($(elem).val());
                $(elem).val(parseInt($(elem).val()));
            }
        });

        $("#totalHaberes").html($.number(totalHaberes, 0, '', '.'));
        $("#totalDescuentos").html($.number(totalDescuentos, 0, '', '.'));
        $("#totalLiquido").html($.number((totalHaberes - totalDescuentos), 0, '', '.'));
    }
</script>

<div class="modal fade" id="liquidacionModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <form:form action="/personal/${personal.id}/liquidacion/save" id="liquidacionForm">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="card">
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label col-form-label-sm">Rut</label>
                                    <label class="col-sm-4 col-form-label col-form-label-sm">${personal.rut}</label>
                                    <label class="col-sm-2 col-form-label col-form-label-sm">Nombre</label>
                                    <label class="col-sm-4 col-form-label col-form-label-sm">${personal.nombres} ${personal.apellidos}</label>
                                </div>
                                <div class="form-group row">
                                    <label for="liquidacion_dias" class="col-sm-2 col-form-label col-form-label-sm">Días Pagados</label>
                                    <div class="col-sm-3">
                                        <input class="form-control form-control-sm" id="liquidacion_dias" name="liquidacion_dias" />
                                    </div>
                                </div>
                            </li>

                            <li class="list-group-item">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <table class="table table-sm-aux">
                                            <thead class="thead-dark">
                                            <tr>
                                                <th scope="col" colspan="3">Haberes</th>
                                            </tr>
                                            </thead>
                                            <tbody>

                                            <c:forEach var="personalItem" items="${personalItemHaberes}" varStatus="loop">
                                                <tr>
                                                    <th width="50" scope="row" style="text-align: center">${loop.index + 1}</th>
                                                    <td><input value="${personalItem.nombre}" class="form-control form-control-sm" name="item_1_${loop.index + 1}_nombre" /></td>
                                                    <td><input value="${personalItem.monto}" class="form-control form-control-sm" data-type="1" name="item_1_${loop.index + 1}_monto" onchange="loadTotales();" /></td>
                                                </tr>
                                            </c:forEach>

                                            <tr class="table-active">
                                                <th scope="row" colspan="2">Total Haberes</th>
                                                <td>
                                                    <div id="totalHaberes" style="text-align: right;"></div>
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

                                            <c:forEach var="personalItem" items="${personalItemDescuentos}" varStatus="loop">
                                                <tr>
                                                    <th width="50" scope="row" style="text-align: center">${loop.index + 1}</th>
                                                    <td><input value="${personalItem.nombre}" class="form-control form-control-sm" name="item_2_${loop.index + 1}_nombre" /></td>
                                                    <td>
                                                        <c:if test="${personalItem.esPorcentaje==1}">
                                                            <input value="" class="form-control form-control-sm" data-type="2" data-percent="${personalItem.monto}" name="item_2_${loop.index + 1}_monto" onchange="$(this).attr('data-percent', 0); loadTotales();" />
                                                        </c:if>
                                                        <c:if test="${personalItem.esPorcentaje==0}">
                                                            <input value="${personalItem.monto}" class="form-control form-control-sm" data-type="2" data-percent="0" name="item_2_${loop.index + 1}_monto" onchange="loadTotales();" />
                                                        </c:if>
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