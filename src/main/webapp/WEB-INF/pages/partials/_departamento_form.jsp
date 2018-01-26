<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %> <!-- IMPORTANTE PARA PARSEAR JSP -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<form:form action="/departamento/save" id="departamentoForm">
    <c:if test="${departamento != null}">
        <input type="hidden" name="cuenta_id" value="${departamento.id}" />
    </c:if>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label col-form-label-sm">Nombre</label>
        <label class="col-sm-10 col-form-label col-form-label-sm">${departamento.nombre}</label>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label col-form-label-sm">Alicuota</label>
        <label class="col-sm-10 col-form-label col-form-label-sm">${departamento.alicuota}</label>
    </div>
    <div class="form-group row">
        <label for="departamento_propietario" class="col-sm-2 col-form-label col-form-label-sm">Propietario</label>
        <div class="col-sm-10">
            <input value="${departamento.propietario}" class="form-control form-control-sm" id="departamento_propietario" name="departamento_propietario" />
        </div>
    </div>
    <div class="form-group row">
        <label for="departamento_residente" class="col-sm-2 col-form-label col-form-label-sm">Residente</label>
        <div class="col-sm-10">
            <input value="${departamento.residente}" class="form-control form-control-sm" id="departamento_residente" name="departamento_residente" />
        </div>
    </div>
    <div class="form-group row">
        <div class="col-sm-12">
            <button type="submit" class="btn btn-info btn-sm">Guardar</button>
        </div>
    </div>
</form:form>