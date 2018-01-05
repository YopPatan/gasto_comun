<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %> <!-- IMPORTANTE PARA PARSEAR JSP -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="modal fade" id="personalItemModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <form:form action="/personal/${personal.id}/item/save" id="personalItemForm">
            <div class="modal-content">
                <div class="modal-body">
                    <input type="hidden" name="personal_id" value="${personal.id}" />
                    <c:if test="${personalItem != null}">
                        <input type="hidden" name="personal_item_id" value="${personalItem.id}" />
                    </c:if>
                    <div class="form-group row">
                        <label for="personal_item_nombre" class="col-sm-4 col-form-label col-form-label-sm">Nombre</label>
                        <div class="col-sm-8">
                            <input value="${personalItem.nombre}" class="form-control form-control-sm" id="personal_item_nombre" name="personal_item_nombre" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="personal_item_tipo" class="col-sm-4 col-form-label col-form-label-sm">Tipo</label>
                        <div class="col-sm-8">
                            <input value="${personalItem.tipo}" class="form-control form-control-sm" id="personal_item_tipo" name="personal_item_tipo" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="personal_item_monto" class="col-sm-4 col-form-label col-form-label-sm">Monto</label>
                        <div class="col-sm-8">
                            <input value="${personalItem.monto}" class="form-control form-control-sm" id="personal_item_monto" name="personal_item_monto" />
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