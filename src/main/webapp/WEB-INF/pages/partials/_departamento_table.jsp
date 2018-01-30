<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %> <!-- IMPORTANTE PARA PARSEAR JSP -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<table class="table table-sm-aux">
    <thead class="thead-dark">
    <tr>
        <th scope="col" width="100">Numero</th>
        <th scope="col">Propietario</th>
        <th scope="col">Residente</th>
        <th scope="col" width="60"></th>
    </tr>
    </thead>
    <tbody>

    <c:forEach var="departamento" items="${departamentos}" varStatus="loop">
        <tr>
            <th scope="row" style="text-align: center">${departamento.nombre}</th>
            <td>${departamento.propietario}</td>
            <td>${departamento.residente}</td>
            <td><a href="/departamento/edit/${departamento.id}" class="btn btn-outline-info btn-sm-aux"><i class="fa fa-pencil" aria-hidden="true"></i></a></td>
        </tr>
    </c:forEach>

    </tbody>
</table>