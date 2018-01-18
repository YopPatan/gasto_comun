<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %> <!-- IMPORTANTE PARA PARSEAR JSP -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="PersonalPagoUtil" class="com.gasto.model.PersonalPago" />

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
                            <input type="date" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${personalPago.fecha}" />" class="form-control form-control-sm" id="personal_pago_fecha" name="personal_pago_fecha" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label col-form-label-sm">Tipo</label>
                        <div class="col-sm-9">
                            <div class="btn-group btn-group-sm" data-toggle="buttons">
                                <c:forEach var="personalPagoTipo" items="${PersonalPagoUtil.tipoNombres}">
                                    <label class="btn btn-secondary ${personalPago.tipo == personalPagoTipo.key ? "active" : ""}">
                                        <input type="radio" name="personal_pago_tipo" value="${personalPagoTipo.key}" autocomplete="off" ${personalPago.tipo == personalPagoTipo.key ? "checked" : ""} required />${personalPagoTipo.value}
                                    </label>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="personal_pago_monto" class="col-sm-3 col-form-label col-form-label-sm">Monto</label>
                        <div class="col-sm-9">
                            <input value="${personalPago.monto}" class="form-control form-control-sm" id="personal_pago_monto" name="personal_pago_monto" />
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