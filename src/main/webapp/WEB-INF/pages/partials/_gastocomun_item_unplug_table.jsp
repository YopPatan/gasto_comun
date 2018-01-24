<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %> <!-- IMPORTANTE PARA PARSEAR JSP -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<table class="table table-sm-aux">
    <thead class="thead-dark">
    <tr>
        <th scope="col" width="50" style="text-align: center">#</th>
        <th scope="col" width="calc(20% - 50px)">Fecha</th>
        <c:if test="${param.viewTipo == 'personal'}">
            <th scope="col" width="25%">Personal</th>
        </c:if>
        <c:if test="${param.viewTipo == 'boleta'}">
            <th scope="col" width="25%">Cuenta</th>
        </c:if>
        <th scope="col" width="20%">Tipo</th>
        <th scope="col" width="15%">Adjunto</th>
        <th scope="col" width="calc(20% - 60px)">Monto</th>
        <th scope="col" width="60"></th>
    </tr>
    </thead>
    <tbody>

    <c:forEach var="pago" items="${pagos}" varStatus="loop">
        <tr id="row_pago_${param.viewTipo}_${pago.id}" style="display: ${pago.gastocomun == null ? 'table-row':'none'}">
            <th scope="row" style="text-align: center">${loop.index + 1}</th>
            <td><fmt:formatDate pattern="dd/MM/yyyy" value="${pago.fecha}" /></td>
            <c:if test="${param.viewTipo == 'personal'}">
                <td>${pago.personal.nombres} ${pago.personal.apellidos}</td>
                <td>${pago.tipoNombre}</td>
            </c:if>
            <c:if test="${param.viewTipo == 'boleta'}">
                <td>${pago.boleta.cuenta.nombre}</td>
                <td>${pago.boleta.cuenta.tipoNombre}</td>
            </c:if>
            <td>
                <c:if test="${pago.adjunto != null && pago.adjunto != ''}">
                    <button onclick="openAttachedModal('${pago.adjunto}')" class="btn btn-outline-info btn-sm-aux">
                        <i class="fa fa-picture-o" aria-hidden="true"></i>
                    </button>
                </c:if>
            </td>
            <td>
                <div class="monto-nofinal"><fmt:formatNumber type="number" maxFractionDigits="0" value="${pago.monto}" /></div>
            </td>
            <td><button onclick="changeItem('${param.viewTipo}', '${pago.id}', 0);" class="btn btn-outline-info btn-sm-aux"><i class="fa fa-plus" aria-hidden="true"></i></button></td>
        </tr>
    </c:forEach>

    </tbody>
</table>