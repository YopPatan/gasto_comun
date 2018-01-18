<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %> <!-- IMPORTANTE PARA PARSEAR JSP -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<table class="table table-sm-aux">
    <thead class="thead-dark">
    <tr>
        <th scope="col" width="50" style="text-align: center">#</th>
        <th scope="col">Fecha</th>
        <th scope="col">Folio</th>
        <th scope="col">Adjunto</th>
        <th scope="col">Estado</th>
        <th scope="col">Monto</th>
        <th scope="col" width="60"></th>
        <th scope="col" width="60"></th>
    </tr>
    </thead>
    <tbody>

    <c:forEach var="boleta" items="${boletas}" varStatus="loop">
        <tr>
            <th scope="row" style="text-align: center">${loop.index + 1}</th>
            <td><fmt:formatDate pattern="dd/MM/yyyy" value="${boleta.fecha}" /></td>
            <td>${boleta.folio}</td>
            <td>
                <c:if test="${boleta.adjunto != null && boleta.adjunto != ''}">
                    <button onclick="openAttachedModal('${boleta.adjunto}')" class="btn btn-outline-info btn-sm-aux"><i class="fa fa-picture-o" aria-hidden="true"></i></button>
                </c:if>
            </td>
            <td>${boleta.estadoNombre}</td>
            <td><fmt:formatNumber type="number" maxFractionDigits="0" value="${boleta.monto}" /></td>
            <td><button onclick="loadBoletaModal('/cuenta/${cuenta.id}/boleta/edit/${boleta.id}')" class="btn btn-outline-info btn-sm-aux"><i class="fa fa-pencil" aria-hidden="true"></i></button></td>
            <td><a href="/cuenta/${cuenta.id}/boleta/delete/${boleta.id}" class="btn btn-outline-info btn-sm-aux"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>
        </tr>
    </c:forEach>

    </tbody>
</table>