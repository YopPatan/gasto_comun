<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %> <!-- IMPORTANTE PARA PARSEAR JSP -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<table class="table table-sm-aux">
    <thead class="thead-dark">
    <tr>
        <th scope="col" width="50" style="text-align: center">#</th>
        <th scope="col">Fecha</th>
        <th scope="col">Monto a Prorratear</th>
        <th scope="col">Monto Reserva</th>
        <th scope="col">Monto Total</th>
        <th scope="col" width="60"></th>
        <th scope="col" width="60"></th>
    </tr>
    </thead>
    <tbody>

    <c:forEach var="gastocomun" items="${gastocomunes}" varStatus="loop">
        <tr>
            <th scope="row" style="text-align: center">${loop.index + 1}</th>
            <td><fmt:formatDate pattern="dd/MM/yyyy" value="${gastocomun.fecha}" /></td>
            <td><fmt:formatNumber type="number" maxFractionDigits="0" value="${gastocomun.montoComun}" /></td>
            <td><fmt:formatNumber type="number" maxFractionDigits="0" value="${gastocomun.montoReserva}" /></td>
            <td><fmt:formatNumber type="number" maxFractionDigits="0" value="${gastocomun.montoTotal}" /></td>
            <td><a href="/gastocomun/edit/${gastocomun.id}" class="btn btn-outline-info btn-sm-aux"><i class="fa fa-pencil" aria-hidden="true"></i></a></td>
            <td><a href="/gastocomun/delete/${gastocomun.id}" class="btn btn-outline-info btn-sm-aux"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>
        </tr>
    </c:forEach>

    </tbody>
</table>