<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %> <!-- IMPORTANTE PARA PARSEAR JSP -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>Title</title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>

    <link rel="stylesheet" type="text/css" media="screen" href="/resources/css/main.css" />

</head>
<body>

<jsp:include page="partials/_menu.jsp" />

<div class="container">

    <div class="card" style="margin-bottom: 20px">
        <div class="card-header">
            Liquidacion
        </div>
        <ul class="list-group list-group-flush">
            <li class="list-group-item">
            <div class="form-group row">
                <label class="col-sm-2 col-form-label col-form-label-sm">Rut</label>
                <div class="col-sm-10">${personal.rut}</div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label col-form-label-sm">Nombre</label>
                <div class="col-sm-10">${personal.nombres} ${personal.apellidos}</div>
            </div>
            <div class="form-group row">
                <label for="liquidacion_dias" class="col-sm-2 col-form-label col-form-label-sm">Días Pagados</label>
                <div class="col-sm-10">
                    <input class="form-control form-control-sm" id="liquidacion_dias" name="liquidacion_dias" />
                </div>
            </div>
            </li>
            <li class="list-group-item">
            <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#personalItemModal" style="margin-bottom: 1rem;">Agregar nuevo</button>

            <div class="row">
                <div class="col-sm-6">
                    <table class="table table-sm-aux">
                        <thead class="thead-dark">
                        <tr>
                            <th scope="col" colspan="3">Haberes</th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach var="personalItem" items="${personalItemHaberes}" varStatus="loop">
                            <tr>
                                <th width="50" scope="row" style="text-align: center">${loop.index + 1}</th>
                                <td><input value="${personalItem.nombre}" class="form-control form-control-sm" name="item_1_${loop.index + 1}_nombre" /></td>
                                <td><input value="${personalItem.monto}" class="form-control form-control-sm" name="item_1_${loop.index + 1}_monto" /></td>
                            </tr>
                        </c:forEach>

                        <tr class="table-active">
                            <th scope="row" colspan="2">Total Haberes</th>
                            <td>1111</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-sm-6">
                    <table class="table table-sm-aux">
                        <thead class="thead-dark">
                        <tr>
                            <th scope="col" colspan="3">Descuentos</th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach var="personalItem" items="${personalItemDescuentos}" varStatus="loop">
                            <tr>
                                <th width="50" scope="row" style="text-align: center">${loop.index + 1}</th>
                                <td><input value="${personalItem.nombre}" class="form-control form-control-sm" name="item_2_${loop.index + 1}_nombre" /></td>
                                <td><input value="${personalItem.monto}" class="form-control form-control-sm" name="item_2_${loop.index + 1}_monto" /></td>
                            </tr>
                        </c:forEach>

                        <tr class="table-active">
                            <th scope="row" colspan="2">Total Descuentos</th>
                            <td>1111</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            </li>

            <li class="list-group-item">
            <div class="row">
                <div class="col-sm-3 offset-sm-6"><h5>Liquido</h5></div>
                <div class="col-sm-3"><h5>1000000</h5></div>
            </div>

            </li>
        </ul>
    </div>

</div>

</body>
</html>
