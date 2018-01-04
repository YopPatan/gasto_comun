<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %> <!-- IMPORTANTE PARA PARSEAR JSP -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<table class="table table-sm-aux">
    <thead class="thead-dark">
    <tr>
        <th scope="col" width="50" style="text-align: center">#</th>
        <th scope="col">Nombre</th>
        <th scope="col">Tipo</th>
        <th scope="col" width="80"></th>
        <th scope="col" width="80"></th>
    </tr>
    </thead>
    <tbody>

    <c:forEach var="cuenta" items="${cuentas}" varStatus="loop">
        <tr>
            <th scope="row" style="text-align: center">${loop.index + 1}</th>
            <td>${cuenta.nombre}</td>
            <td>${cuenta.tipoNombre}</td>
            <td><a href="/cuenta/edit/${cuenta.id}" class="btn btn-outline-info btn-sm-aux"><i class="fa fa-pencil" aria-hidden="true"></i></a></td>
            <td><a href="/cuenta/delete/${cuenta.id}" class="btn btn-outline-info btn-sm-aux"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>
        </tr>
    </c:forEach>

    </tbody>
</table>