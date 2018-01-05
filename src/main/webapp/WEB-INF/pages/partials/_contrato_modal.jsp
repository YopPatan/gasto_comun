<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %> <!-- IMPORTANTE PARA PARSEAR JSP -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="modal fade" id="contratoModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <form:form action="/personal/${personal.id}/sueldo/save" id="contratoForm">
                    <input type="hidden" name="personal_id" value="${personal.id}" />
                    <c:if test="${contrato != null}">
                        <input type="hidden" name="contrato_id" value="${contrato.id}" />
                    </c:if>
                    <div class="form-group row">
                        <label for="contrato_fecha" class="col-sm-4 col-form-label col-form-label-sm">Fecha</label>
                        <div class="col-sm-8">
                            <input type="date" value="${contrato.fecha}" class="form-control form-control-sm" id="contrato_fecha" name="contrato_fecha" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="contrato_monto_bruto" class="col-sm-4 col-form-label col-form-label-sm">Monto Bruto</label>
                        <div class="col-sm-8">
                            <input value="${contrato.montoBruto}" class="form-control form-control-sm" id="contrato_monto_bruto" name="contrato_monto_bruto" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="contrato_monto_colacion" class="col-sm-4 col-form-label col-form-label-sm">Monto Colación</label>
                        <div class="col-sm-8">
                            <input value="${contrato.montoColacion}" class="form-control form-control-sm" id="contrato_monto_colacion" name="contrato_monto_colacion" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="contrato_monto_movilizacion" class="col-sm-4 col-form-label col-form-label-sm">Monto Colación</label>
                        <div class="col-sm-8">
                            <input value="${contrato.montoMovilizacion}" class="form-control form-control-sm" id="contrato_monto_movilizacion" name="contrato_monto_movilizacion" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="contrato_adjunto" class="col-sm-4 col-form-label col-form-label-sm">Adjunto</label>
                        <div class="col-sm-8">
                            <input value="${contrato.adjunto}" class="form-control form-control-sm" id="contrato_adjunto" name="contrato_adjunto" />
                        </div>
                    </div>
                </form:form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Cerrar</button>
                <button type="submit" class="btn btn-info btn-sm">Guardar</button>
            </div>
        </div>
    </div>
</div>