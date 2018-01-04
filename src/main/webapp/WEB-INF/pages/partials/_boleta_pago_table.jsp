<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %> <!-- IMPORTANTE PARA PARSEAR JSP -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<table class="table table-sm-aux">
    <thead class="thead-dark">
    <tr>
        <th scope="col" width="50" style="text-align: center">#</th>
        <th scope="col">Cuota</th>
        <th scope="col">Fecha</th>
        <th scope="col">Monto</th>
        <th scope="col" width="80"></th>
        <th scope="col" width="80"></th>
    </tr>
    </thead>
    <tbody>

    <c:forEach var="boletaPago" items="${boletaPagos}" varStatus="loop">
        <tr>
            <th scope="row" style="text-align: center">${loop.index + 1}</th>
            <td>${boletaPago.cuota}</td>
            <td>${boletaPago.fecha}</td>
            <td>${boletaPago.monto}</td>
            <td><a href="/cuenta/${cuenta.id}/boleta/edit/${boleta.id}" type="button" class="btn btn-outline-dark btn-sm-aux"><i class="fa fa-pencil" aria-hidden="true"></i></a></td>
            <td><a href="/cuenta/${cuenta.id}/boleta/delete/${boleta.id}" type="button" class="btn btn-outline-dark btn-sm-aux"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>
        </tr>
    </c:forEach>

    </tbody>
</table>