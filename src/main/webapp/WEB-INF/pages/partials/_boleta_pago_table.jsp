<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %> <!-- IMPORTANTE PARA PARSEAR JSP -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<table class="table table-sm-aux">
    <thead class="thead-dark">
    <tr>
        <th scope="col" width="50" style="text-align: center">#</th>
        <th scope="col">Fecha</th>
        <th scope="col">Adjunto</th>
        <th scope="col">Monto</th>
        <th scope="col" width="60"></th>
        <th scope="col" width="60"></th>
    </tr>
    </thead>
    <tbody>

    <c:forEach var="boletaPago" items="${boletaPagos}" varStatus="loop">
        <tr>
            <th scope="row" style="text-align: center">${loop.index + 1}</th>
            <td><fmt:formatDate pattern="dd/MM/yyyy" value="${boletaPago.fecha}" /></td>
            <td>
                <c:if test="${boletaPago.adjunto != null && boletaPago.adjunto != ''}">
                    <button onclick="openAttachedModal('${boletaPago.adjunto}')" class="btn btn-outline-info btn-sm-aux"><i class="fa fa-picture-o" aria-hidden="true"></i></button>
                </c:if>
            </td>
            <td><fmt:formatNumber type="number" maxFractionDigits="0" value="${boletaPago.monto}" /></td>
            <td><button onclick="loadBoletaPagoModal('/cuenta/${cuenta.id}/boletaPago/edit/${boletaPago.id}')" class="btn btn-outline-info btn-sm-aux"><i class="fa fa-pencil" aria-hidden="true"></i></button></td>
            <td><button onclick="openDeleteModal('/cuenta/${cuenta.id}/boletaPago/delete/${boletaPago.id}', 'Pago');" class="btn btn-outline-info btn-sm-aux"><i class="fa fa-trash-o" aria-hidden="true"></i></button></td>
        </tr>
    </c:forEach>

    </tbody>
</table>