<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %> <!-- IMPORTANTE PARA PARSEAR JSP -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<table class="table table-sm-aux">
    <thead class="thead-dark">
    <tr>
        <th scope="col" width="50" style="text-align: center">#</th>
        <th scope="col">Fecha</th>
        <th scope="col">Monto Gastos</th>
        <th scope="col">Monto Consumo</th>
        <th scope="col">Monto Total</th>
        <th scope="col" width="60"></th>
    </tr>
    </thead>
    <tbody>

    <c:forEach var="departamentoGasto" items="${departamentoGastos}" varStatus="loop">
        <tr>
            <th scope="row" style="text-align: center">${loop.index + 1}</th>
            <td><fmt:formatDate pattern="dd/MM/yyyy" value="${departamentoGasto.gastocomun.fecha}" /></td>
            <td><fmt:formatNumber type="number" maxFractionDigits="0" value="${departamentoGasto.montoComun + departamentoGasto.montoReserva}" /></td>
            <td><fmt:formatNumber type="number" maxFractionDigits="0" value="${departamentoGasto.montoNoComun}" /></td>
            <td><fmt:formatNumber type="number" maxFractionDigits="0" value="${departamentoGasto.montoTotal}" /></td>
            <td><button onclick="loadDepartamentoGastoModal('/departamento/${departamento.id}/gasto/${departamentoGasto.id}')" class="btn btn-outline-info btn-sm-aux"><i class="fa fa-eye" aria-hidden="true"></i></button></td>
        </tr>
    </c:forEach>

    </tbody>
</table>