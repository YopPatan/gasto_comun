<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %> <!-- IMPORTANTE PARA PARSEAR JSP -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="modal fade" id="boletaPagoModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <form:form action="/cuenta/${cuentaId}/boletaPago/save" id="boletaPagoForm">
            <div class="modal-content">
                <div class="modal-body">
                    <input type="hidden" name="cuenta_id" value="${cuenta_id}" />
                    <c:if test="${boletaPago != null}">
                        <input type="hidden" name="boleta_pago_id" value="${boletaPago.id}" />
                    </c:if>
                    <c:if test="${boletaAdeudadas != null}">
                        <div class="form-group row">
                            <label for="boleta_id" class="col-sm-3 col-form-label col-form-label-sm">Boleta</label>
                            <div class="col-sm-9">
                                <select class="form-control form-control-sm" id="boleta_id" name="boleta_id" required>
                                    <c:forEach var="boletaAdeudada" items="${boletaAdeudadas}">
                                        <option value="${boletaAdeudada.id}" ${boletaPago.boleta.id == boletaAdeudada.id ? "selected" : ""}><fmt:formatDate pattern="dd/MM/yyyy" value="${boletaAdeudada.fecha}" /></option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${boleta != null}">
                        <input type="hidden" name="boleta_id" value="${boleta.id}" />
                        <div class="form-group row">
                            <label class="col-sm-3 col-form-label col-form-label-sm">Boleta</label>
                            <label class="col-sm-9 col-form-label col-form-label-sm">
                                <fmt:formatDate pattern="dd/MM/yyyy" value="${boleta.fecha}" />
                            </label>
                        </div>
                    </c:if>
                    <div class="form-group row">
                        <label for="boleta_pago_fecha" class="col-sm-3 col-form-label col-form-label-sm">Fecha</label>
                        <div class="col-sm-9">
                            <input type="date" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${boletaPago.fecha}" />" class="form-control form-control-sm" id="boleta_pago_fecha" name="boleta_pago_fecha" required />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="boleta_pago_adjunto" class="col-sm-3 col-form-label col-form-label-sm">Adjunto</label>
                        <div class="col-sm-9">
                            <input value="${boletaPago.adjunto}" class="form-control form-control-sm" id="boleta_pago_adjunto" name="boleta_pago_adjunto" data-parsley-type="url" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="boleta_pago_monto" class="col-sm-3 col-form-label col-form-label-sm">Monto</label>
                        <div class="col-sm-9">
                            <input value="${boletaPago.monto}" class="form-control form-control-sm" id="boleta_pago_monto" name="boleta_pago_monto" required data-parsley-type="number" />
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