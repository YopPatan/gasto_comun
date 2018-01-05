<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %> <!-- IMPORTANTE PARA PARSEAR JSP -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<table class="table table-sm-aux">
    <thead class="thead-dark">
    <tr>
        <th scope="col" width="50" style="text-align: center">#</th>
        <th scope="col">Fecha</th>
        <th scope="col">Total Haberes</th>
        <th scope="col">Total Descuento</th>
        <th scope="col">Monto Liquido</th>
        <th scope="col">Adjunto</th>
        <th scope="col" width="80"></th>
        <th scope="col" width="80"></th>
    </tr>
    </thead>
    <tbody>

    <c:forEach var="liquidacion" items="${liquidaciones}" varStatus="loop">
        <tr>
            <th scope="row" style="text-align: center">${loop.index + 1}</th>
            <td>${liquidacion.fecha}</td>
            <td></td>
            <td></td>
            <td></td>
            <td>${contrato.adjunto}</td>
            <td><a href="/personal/${personaId}/liquidacion/edit/${contrato.id}" class="btn btn-outline-info btn-sm-aux"><i class="fa fa-pencil" aria-hidden="true"></i></a></td>
            <td><a href="/personal/${personaId}/liquidacion/delete/${contrato.id}" class="btn btn-outline-info btn-sm-aux"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>
        </tr>
    </c:forEach>

    </tbody>
</table>