<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %> <!-- IMPORTANTE PARA PARSEAR JSP -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<table class="table table-sm-aux">
    <thead class="thead-dark">
    <tr>
        <th scope="col" width="50" style="text-align: center">#</th>
        <th scope="col">Fecha</th>
        <th scope="col">Monto Imponible</th>
        <th scope="col">Monto No Imponible</th>
        <th scope="col">Monto Descuentos</th>
        <th scope="col">Monto Liquido</th>
        <th scope="col" width="60"></th>
        <th scope="col" width="60"></th>
    </tr>
    </thead>
    <tbody>

    <c:forEach var="liquidacion" items="${liquidaciones}" varStatus="loop">
        <tr>
            <th scope="row" style="text-align: center">${loop.index + 1}</th>
            <td><fmt:formatDate pattern="dd/MM/yyyy" value="${liquidacion.fecha}" /></td>
            <td><fmt:formatNumber type="number" maxFractionDigits="0" value="${liquidacion.montoImponible}" /></td>
            <td><fmt:formatNumber type="number" maxFractionDigits="0" value="${liquidacion.montoNoImponible}" /></td>
            <td><fmt:formatNumber type="number" maxFractionDigits="0" value="${liquidacion.montoDescuentos}" /></td>
            <td><fmt:formatNumber type="number" maxFractionDigits="0" value="${liquidacion.montoLiquido}" /></td>
            <td><button onclick="loadLiquidacionModal('/personal/${personalId}/liquidacion/edit/${liquidacion.id}');" class="btn btn-outline-info btn-sm-aux"><i class="fa fa-pencil" aria-hidden="true"></i></button></td>
            <td><a href="/personal/${personalId}/liquidacion/delete/${liquidacion.id}" class="btn btn-outline-info btn-sm-aux"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>
        </tr>
    </c:forEach>

    </tbody>
</table>