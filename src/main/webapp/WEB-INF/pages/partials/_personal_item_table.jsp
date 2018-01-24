<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %> <!-- IMPORTANTE PARA PARSEAR JSP -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<table class="table table-sm-aux">
    <thead class="thead-dark">
    <tr>
        <th scope="col" colspan="5">${param.title}</th>
    </tr>
    </thead>
    <tbody>

    <c:forEach var="personalItem" items="${personalItems}" varStatus="loop">
        <tr>
            <th width="50" scope="row" style="text-align: center">${loop.index + 1}</th>
            <td>${personalItem.nombre}</td>
            <td align="right">
                <c:if test="${personalItem.esPorcentaje==0}">
                    <fmt:formatNumber type="number" maxFractionDigits="0" value="${personalItem.monto}" />
                </c:if>
                <c:if test="${personalItem.esPorcentaje==1}">
                    <fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${personalItem.monto}" />
                </c:if>
            </td>
            <td width="60"><button onclick="loadPersonalItemModal('/personal/${personal.id}/item/edit/${personalItem.id}')" class="btn btn-outline-info btn-sm-aux"><i class="fa fa-pencil" aria-hidden="true"></i></button></td>
            <td width="60"><a href="/personal/${personal.id}/item/delete/${personalItem.id}" class="btn btn-outline-info btn-sm-aux"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>
        </tr>
    </c:forEach>

    </tbody>
</table>