<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %> <!-- IMPORTANTE PARA PARSEAR JSP -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="modal fade" id="boletaModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <form:form action="/cuenta/${cuentaId}/boleta/save" id="boletaForm">
            <div class="modal-content">
                <div class="modal-body">
                    <input type="hidden" name="cuenta_id" value="${cuenta_id}" />
                    <c:if test="${boleta != null}">
                        <input type="hidden" name="boleta_id" value="${boleta.id}" />
                    </c:if>
                    <div class="form-group row">
                        <label for="boleta_fecha" class="col-sm-3 col-form-label col-form-label-sm">Fecha</label>
                        <div class="col-sm-9">
                            <input type="date" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${boleta.fecha}" />" class="form-control form-control-sm" id="boleta_fecha" name="boleta_fecha" required />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="boleta_folio" class="col-sm-3 col-form-label col-form-label-sm">Folio</label>
                        <div class="col-sm-9">
                            <input value="${boleta.folio}" class="form-control form-control-sm" id="boleta_folio" name="boleta_folio" required />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="boleta_adjunto" class="col-sm-3 col-form-label col-form-label-sm">Adjunto</label>
                        <div class="col-sm-9">
                            <input value="${boleta.adjunto}" class="form-control form-control-sm" id="boleta_adjunto" name="boleta_adjunto" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="boleta_monto" class="col-sm-3 col-form-label col-form-label-sm">Monto</label>
                        <div class="col-sm-9">
                            <input value="${boleta.monto}" class="form-control form-control-sm" id="boleta_monto" name="boleta_monto" required />
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