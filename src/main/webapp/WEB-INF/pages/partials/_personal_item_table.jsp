<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %> <!-- IMPORTANTE PARA PARSEAR JSP -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row">
    <div class="col-sm-6">
        <table class="table table-sm-aux">
            <thead class="thead-dark">
            <tr>
                <th scope="col" colspan="5">Haberes</th>
            </tr>
            </thead>
            <tbody>

            <c:forEach var="personalItem" items="${personalItemHaberes}" varStatus="loop">
                <tr>
                    <th width="50" scope="row" style="text-align: center">${loop.index + 1}</th>
                    <td>${personalItem.nombre}</td>
                    <td>${personalItem.monto}</td>
                    <td width="50"><a href="/personal/${personaId}/item/edit/${personal_item.id}" class="btn btn-outline-info btn-sm-aux"><i class="fa fa-pencil" aria-hidden="true"></i></a></td>
                    <td width="50"><a href="/personal/${personaId}/item/delete/${personal_item.id}" class="btn btn-outline-info btn-sm-aux"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>
                </tr>
            </c:forEach>

            </tbody>
        </table>
    </div>
    <div class="col-sm-6">
        <table class="table table-sm-aux">
            <thead class="thead-dark">
            <tr>
                <th scope="col" colspan="5">Descuentos</th>
            </tr>
            </thead>
            <tbody>

            <c:forEach var="personalItem" items="${personalItemDescuentos}" varStatus="loop">
                <tr>
                    <th width="50" scope="row" style="text-align: center">${loop.index + 1}</th>
                    <td>${personalItem.nombre}</td>
                    <td>${personalItem.monto}</td>
                    <td width="50"><a href="/personal/${personaId}/item/edit/${personal_item.id}" class="btn btn-outline-info btn-sm-aux"><i class="fa fa-pencil" aria-hidden="true"></i></a></td>
                    <td width="50"><a href="/personal/${personaId}/item/delete/${personal_item.id}" class="btn btn-outline-info btn-sm-aux"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>
                </tr>
            </c:forEach>

            </tbody>
        </table>
    </div>
</div>