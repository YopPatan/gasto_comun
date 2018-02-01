<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %> <!-- IMPORTANTE PARA PARSEAR JSP -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<form:form action="/personal/save" id="personalForm">
    <c:if test="${personal != null}">
        <input type="hidden" name="personal_id" value="${personal.id}" />
    </c:if>
    <div class="form-group row">
        <label for="personal_rut" class="col-sm-2 col-form-label col-form-label-sm">Rut</label>
        <div class="col-sm-10">
            <input value="${personal.rut}" class="form-control form-control-sm" id="personal_rut" name="personal_rut" required data-parsley-is-rut />
        </div>
    </div>
    <div class="form-group row">
        <label for="personal_nombres" class="col-sm-2 col-form-label col-form-label-sm">Nombres</label>
        <div class="col-sm-10">
            <input value="${personal.nombres}" class="form-control form-control-sm" id="personal_nombres" name="personal_nombres" required data-parsley-type="alphanum" data-parsley-minlength="3" />
        </div>
    </div>
    <div class="form-group row">
        <label for="personal_apellidos" class="col-sm-2 col-form-label col-form-label-sm">Apellidos</label>
        <div class="col-sm-10">
            <input value="${personal.apellidos}" class="form-control form-control-sm" id="personal_apellidos" name="personal_apellidos" required data-parsley-type="alphanum" data-parsley-minlength="3" />
        </div>
    </div>
    <div class="form-group row">
        <label for="personal_direccion" class="col-sm-2 col-form-label col-form-label-sm">Dirección</label>
        <div class="col-sm-10">
            <input value="${personal.direccion}" class="form-control form-control-sm" id="personal_direccion" name="personal_direccion" required data-parsley-minlength="3" />
        </div>
    </div>
    <div class="form-group row">
        <label for="personal_cargo" class="col-sm-2 col-form-label col-form-label-sm">Cargo</label>
        <div class="col-sm-10">
            <input value="${personal.cargo}" class="form-control form-control-sm" id="personal_cargo" name="personal_cargo" required type="alphanum" data-parsley-minlength="3" />
        </div>
    </div>
    <div class="form-group row">
        <div class="col-sm-12">
            <button type="submit" class="btn btn-info btn-sm">Guardar</button>
        </div>
    </div>
</form:form>