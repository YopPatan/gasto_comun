<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %> <!-- IMPORTANTE PARA PARSEAR JSP -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<table class="table table-sm-aux">
    <thead class="thead-dark">
    <tr>
        <th scope="col" width="50" style="text-align: center">#</th>
        <th scope="col">Fecha</th>
        <th scope="col">Monto Bruto</th>
        <th scope="col">Monto Movilización</th>
        <th scope="col">Monto Colación</th>
        <th scope="col">Adjunto</th>
        <th scope="col" width="80"></th>
        <th scope="col" width="80"></th>
    </tr>
    </thead>
    <tbody>

    <c:forEach var="contrato" items="${contratos}" varStatus="loop">
        <tr>
            <th scope="row" style="text-align: center">${loop.index + 1}</th>
            <td>${contrato.fecha}</td>
            <td>${contrato.montoBruto}</td>
            <td>${contrato.montoMovilizacion}</td>
            <td>${contrato.montoColación}</td>
            <td>${contrato.adjunto}</td>
            <td><a href="/personal/${personaId}/contrato/edit/${contrato.id}" class="btn btn-outline-info btn-sm-aux"><i class="fa fa-pencil" aria-hidden="true"></i></a></td>
            <td><a href="/personal/${personaId}/contrato/delete/${contrato.id}" class="btn btn-outline-info btn-sm-aux"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>
        </tr>
    </c:forEach>

    </tbody>
</table>