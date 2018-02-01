<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %> <!-- IMPORTANTE PARA PARSEAR JSP -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
    function changeTipo(elem) {
        if ($(elem).val() == 1) {
            $("#liquidacionDiv").show();
        }
        else {
            $("#liquidacionDiv").hide();
        }
    }
</script>

<div class="modal fade" id="personalPagoModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <form:form action="/personal/${personalId}/pago/save" id="personalPagoForm">
            <div class="modal-content">
                <div class="modal-body">
                    <input type="hidden" name="personal_id" value="${personal.id}" />
                    <c:if test="${personalPago != null}">
                        <input type="hidden" name="personal_pago_id" value="${personalPago.id}" />
                    </c:if>
                    <div class="form-group row">
                        <label for="personal_pago_fecha" class="col-sm-3 col-form-label col-form-label-sm">Fecha</label>
                        <div class="col-sm-9">
                            <input type="date" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${personalPago.fecha}" />" class="form-control form-control-sm" id="personal_pago_fecha" name="personal_pago_fecha" required />
                        </div>
                    </div>
                    <c:if test="${liquidacionAdeudadas != null}">
                        <div class="form-group row">
                            <label class="col-sm-3 col-form-label col-form-label-sm">Tipo</label>
                            <div class="col-sm-9">
                                <div class="btn-group btn-group-sm" data-toggle="buttons">
                                    <c:forEach var="personalPagoTipo" items="${personalPagoTipos}">
                                        <label class="btn btn-secondary ${personalPago.tipo == personalPagoTipo.key ? "active" : ""}">
                                            <input type="radio" name="personal_pago_tipo" value="${personalPagoTipo.key}" onchange="changeTipo(this);" autocomplete="off" ${personalPago.tipo == personalPagoTipo.key ? "checked" : ""} required />${personalPagoTipo.value}
                                        </label>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>

                        <div class="form-group row" id="liquidacionDiv">
                            <label for="liquidacion_id" class="col-sm-3 col-form-label col-form-label-sm">Liquidación</label>
                            <div class="col-sm-9">
                                <select class="form-control form-control-sm" id="liquidacion_id" name="liquidacion_id" required>
                                    <c:forEach var="liquidacionAdeudada" items="${liquidacionAdeudadas}">
                                        <option value="${liquidacionAdeudada.id}" ${personalPago.liquidacion.id == liquidacionAdeudada.id ? "selected" : ""}><fmt:formatDate pattern="dd/MM/yyyy" value="${liquidacionAdeudada.fecha}" /></option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${liquidacion != null}">
                        <input type="hidden" name="personal_pago_tipo" value="${personalPago.tipo}" />
                        <div class="form-group row">
                            <label class="col-sm-3 col-form-label col-form-label-sm">Tipo</label>
                            <label class="col-sm-9 col-form-label col-form-label-sm">${personalPago.tipoNombre}</label>
                        </div>

                        <input type="hidden" name="liquidacion_id" value="${liquidacion.id}" />
                        <div class="form-group row">
                            <label class="col-sm-3 col-form-label col-form-label-sm">Liquidación</label>
                            <label class="col-sm-9 col-form-label col-form-label-sm">
                                <fmt:formatDate pattern="dd/MM/yyyy" value="${liquidacion.fecha}" />
                            </label>
                        </div>
                    </c:if>
                    <div class="form-group row">
                        <label for="personal_pago_adjunto" class="col-sm-3 col-form-label col-form-label-sm">Adjunto</label>
                        <div class="col-sm-9">
                            <input value="${personalPago.adjunto}" class="form-control form-control-sm" id="personal_pago_adjunto" name="personal_pago_adjunto" data-parsley-type="url" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="personal_pago_monto" class="col-sm-3 col-form-label col-form-label-sm">Monto</label>
                        <div class="col-sm-9">
                            <input value="${personalPago.monto}" class="form-control form-control-sm" id="personal_pago_monto" name="personal_pago_monto" required data-parsley-type="number" />
                        </div>
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
    configParsley();
</script>