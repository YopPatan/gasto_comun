<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %> <!-- IMPORTANTE PARA PARSEAR JSP -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="modal fade" id="boletaPagoModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <form:form action="/cuenta/${cuentaId}/boleta/save" id="boletaForm">
            <div class="modal-content">
                <div class="modal-body">
                    <input type="hidden" name="cuenta_id" value="${cuenta_id}" />
                    <input type="hidden" name="boleta_id" value="${boleta.id}" />
                    <div class="form-group row">
                        <label for="boleta_pago_fecha" class="col-sm-4 col-form-label col-form-label-sm">Fecha</label>
                        <div class="col-sm-8">
                            <input type="date" class="form-control form-control-sm" id="boleta_pago_fecha" name="boleta_adjunto" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="boleta_pago_monto" class="col-sm-4 col-form-label col-form-label-sm">Monto</label>
                        <div class="col-sm-8">
                            <input class="form-control form-control-sm" id="boleta_pago_monto" name="boleta_monto" />
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Cerrar</button>
                    <button type="button" class="btn btn-info btn-sm">Pagar</button>
                </div>
            </div>
        </form:form>
    </div>
</div>