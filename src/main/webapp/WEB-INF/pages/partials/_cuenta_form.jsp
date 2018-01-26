<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %> <!-- IMPORTANTE PARA PARSEAR JSP -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<form:form action="/cuenta/save" id="cuentaForm">
    <c:if test="${cuenta != null}">
        <input type="hidden" name="cuenta_id" value="${cuenta.id}" />
    </c:if>
    <div class="form-group row">
        <label for="cuenta_nombre" class="col-sm-2 col-form-label col-form-label-sm">Nombre</label>
        <div class="col-sm-10">
            <input value="${cuenta.nombre}" class="form-control form-control-sm" id="cuenta_nombre" name="cuenta_nombre" required />
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label col-form-label-sm">Tipo</label>
        <div class="col-sm-10">
            <div class="btn-group btn-group-sm" data-toggle="buttons">
                <c:forEach var="cuentaTipo" items="${cuentaTipos}">
                <label class="btn btn-secondary ${cuenta.tipo == cuentaTipo.key ? "active" : ""}">
                    <input type="radio" name="cuenta_tipo" value="${cuentaTipo.key}" autocomplete="off" ${cuenta.tipo == cuentaTipo.key ? "checked" : ""} required />${cuentaTipo.value}
                </label>
                </c:forEach>
            </div>
        </div>
    </div>
    <div class="form-group row">
        <div class="col-sm-12">
            <button type="submit" class="btn btn-info btn-sm">Guardar</button>
        </div>
    </div>
</form:form>