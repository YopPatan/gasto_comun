<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %> <!-- IMPORTANTE PARA PARSEAR JSP -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="modal fade" id="departamentoPagoModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <form:form action="/departamento/${departamentoId}/pago/save" id="departamentoPagoForm">
            <div class="modal-content">
                <div class="modal-body">
                    <input type="hidden" name="departamento_id" value="${departamento.id}" />
                    <c:if test="${departamentoPago != null}">
                        <input type="hidden" name="departamento_pago_id" value="${departamentoPago.id}" />
                    </c:if>
                    <div class="form-group row">
                        <label for="departamento_pago_fecha" class="col-sm-3 col-form-label col-form-label-sm">Fecha</label>
                        <div class="col-sm-9">
                            <input type="date" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${personalPago.fecha}" />" class="form-control form-control-sm" id="departamento_pago_fecha" name="departamento_pago_fecha" required />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="departamento_pago_monto" class="col-sm-3 col-form-label col-form-label-sm">Monto</label>
                        <div class="col-sm-9">
                            <input value="${personalPago.monto}" class="form-control form-control-sm" id="departamento_pago_monto" name="departamento_pago_monto" required />
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