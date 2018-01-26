<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %> <!-- IMPORTANTE PARA PARSEAR JSP -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<table class="table table-sm-aux">
    <thead class="bg-info" style="color: #fff;">
    <tr>
        <th scope="col" colspan="6">${param.tipoNombre}</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="pago" items="${pagos}" varStatus="loop">
        <input type="hidden" name="item_${param.viewTipo}_${pago.id}" data-pago-tipo="${param.tipoId}" data-pago-monto="${pago.monto}" value="${pago.gastocomun == null ? '0':'1'}" />
        <tr id="row_item_${param.viewTipo}_${pago.id}" style="display: ${pago.gastocomun == null ? 'none':'table-row'}">
            <th width="50" scope="row" style="text-align: center">${loop.index + 1}</th>
            <td width="calc(20% - 50px)"><fmt:formatDate pattern="dd/MM/yyyy" value="${pago.fecha}" /></td>
            <c:if test="${param.viewTipo == 'personal'}">
                <td width="45%">${pago.personal.nombres} ${pago.personal.apellidos}</td>
            </c:if>
            <c:if test="${param.viewTipo == 'boleta'}">
                <td width="45%">${pago.boleta.cuenta.nombre}</td>
            </c:if>
            <td width="15%">
                <c:if test="${pago.adjunto != null && pago.adjunto != ''}">
                    <button onclick="openAttachedModal('${pago.adjunto}')" class="btn btn-outline-info btn-sm-aux"><i class="fa fa-picture-o" aria-hidden="true"></i></button>
                </c:if>
            </td>
            <td width="calc(20% - 60px)">
                <div class="monto-nofinal"><fmt:formatNumber type="number" maxFractionDigits="0" value="${pago.monto}" /></div>
            </td>
            <td width="60"><button type="button" onclick="changeItem('${param.viewTipo}', '${pago.id}', 1);" class="btn btn-outline-info btn-sm-aux"><i class="fa fa-minus" aria-hidden="true"></i></button></td>
        </tr>
    </c:forEach>
    <tr class="table-light">
        <th scope="row" colspan="4">Subtotal</th>
        <td>
            <div id="total_items_${param.tipoId}" class="monto-nofinal"></div>
        </td>
        <td width="60"></td>
    </tr>
    </tbody>
</table>