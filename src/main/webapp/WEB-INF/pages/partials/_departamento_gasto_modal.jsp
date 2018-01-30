<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %> <!-- IMPORTANTE PARA PARSEAR JSP -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="modal fade" id="departamentoGastoModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-lg-aux" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <div class="card">
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label col-form-label-sm">Fecha Emision</label>
                                <label class="col-sm-4 col-form-label col-form-label-sm">
                                    <fmt:formatDate pattern="dd/MM/yyyy" value="${departamentoGasto.gastocomun.fecha}" />
                                </label>
                                <label class="col-sm-2 col-form-label col-form-label-sm">Fecha Vencimiento</label>
                                <label class="col-sm-4 col-form-label col-form-label-sm">
                                    <fmt:formatDate pattern="dd/MM/yyyy" value="${departamentoGasto.gastocomun.fechaVencimiento}" />
                                </label>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label col-form-label-sm">Departamento</label>
                                <label class="col-sm-4 col-form-label col-form-label-sm">${departamentoGasto.departamento.nombre}</label>
                                <label class="col-sm-2 col-form-label col-form-label-sm">Alicuota</label>
                                <label class="col-sm-4 col-form-label col-form-label-sm">${departamentoGasto.departamento.alicuota}</label>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label col-form-label-sm">Observaciones</label>
                                <label class="col-sm-10 col-form-label col-form-label-sm">${departamentoGasto.gastocomun.observaciones}</label>
                            </div>
                        </li>

                        <li class="list-group-item">
                            <div class="row">
                                <div class="col-sm-6">
                                    <c:forEach var="consumo" items="${consumos}" varStatus="loop">
                                        <table class="table table-sm-aux">
                                            <thead class="bg-info" style="color: #fff;">
                                            <tr>
                                                <th scope="col" colspan="2">${consumo.nombre}</th>
                                            </tr>
                                            </thead>
                                            <tbody>

                                            <c:forEach var="boletaPago" items="${consumo.boletaPagos}" varStatus="loop">
                                                <tr>
                                                    <td>${boletaPago.boleta.cuenta.nombre}</td>
                                                    <td style="text-align: right;">
                                                        <fmt:formatNumber type="number" maxFractionDigits="0" value="${boletaPago.monto}" />
                                                    </td>
                                                </tr>
                                            </c:forEach>

                                            <tr>
                                                <td>Monto Total</td>
                                                <td style="text-align: right;">
                                                    <fmt:formatNumber type="number" maxFractionDigits="0" value="${consumo.monto}" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Cantidad Consumida</td>
                                                <td style="text-align: right;">${consumo.cantidad}</td>
                                            </tr>
                                            <tr class="table-light">
                                                <th scope="row">Monto por consumo</th>
                                                <td style="text-align: right;">
                                                    <fmt:formatNumber type="number" maxFractionDigits="0" value="${consumo.monto / consumo.cantidad}" />
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </c:forEach>
                                </div>

                                <div class="col-sm-6">
                                    <table class="table table-sm-aux">
                                        <thead class="bg-info" style="color: #fff;">
                                        <tr>
                                            <th scope="col" colspan="3">Gastos</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>Monto Comun</td>
                                            <td style="text-align: right;">
                                                <fmt:formatNumber type="number" maxFractionDigits="0" value="${departamentoGasto.gastocomun.montoComun}" />
                                            </td>
                                            <td style="text-align: right;">
                                                <fmt:formatNumber type="number" maxFractionDigits="0" value="${departamentoGasto.montoComun}" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Monto Reserva</td>
                                            <td style="text-align: right;">
                                                <fmt:formatNumber type="number" maxFractionDigits="0" value="${departamentoGasto.gastocomun.montoReserva}" />
                                            </td>
                                            <td style="text-align: right;">
                                                <fmt:formatNumber type="number" maxFractionDigits="0" value="${departamentoGasto.montoReserva}" />
                                            </td>
                                        </tr>
                                        <tr class="table-light">
                                            <th scope="row" colspan="2">Subtotal</th>
                                            <td style="text-align: right;">
                                                <fmt:formatNumber type="number" maxFractionDigits="0" value="${departamentoGasto.montoComun + departamentoGasto.montoReserva}" />
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    <table class="table table-sm-aux">
                                        <thead class="bg-info" style="color: #fff;">
                                        <tr>
                                            <th scope="col" colspan="3">Consumos</th>
                                        </tr>
                                        </thead>
                                        <tbody>

                                        <c:forEach var="departamentoConsumo" items="${departamentoConsumos}" varStatus="loop">
                                            <tr>
                                                <td>${departamentoConsumo.consumo.nombre}</td>
                                                <td style="text-align: right;">${departamentoConsumo.cantidad}</td>
                                                <td style="text-align: right;">
                                                    <fmt:formatNumber type="number" maxFractionDigits="0" value="${departamentoConsumo.monto}" />
                                                </td>
                                            </tr>
                                        </c:forEach>

                                        <tr class="table-light">
                                            <th scope="row" colspan="2">Subtotal</th>
                                            <td style="text-align: right;">
                                                <fmt:formatNumber type="number" maxFractionDigits="0" value="${departamentoGasto.montoNoComun}" />
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    <table class="table table-sm-aux">
                                        <thead class="bg-info" style="color: #fff;">
                                        <tr>
                                            <th scope="col" colspan="2">Recargos / Multas</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>Monto Adeudado</td>
                                            <td style="text-align: right;">
                                                <fmt:formatNumber type="number" maxFractionDigits="0" value="${departamentoGasto.montoAdeudado}" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Monto Interes</td>
                                            <td style="text-align: right;">
                                                <fmt:formatNumber type="number" maxFractionDigits="0" value="${departamentoGasto.montoInteres}" />
                                            </td>
                                        </tr>
                                        <tr class="table-light">
                                            <th scope="row">Subtotal</th>
                                            <td style="text-align: right;">
                                                <fmt:formatNumber type="number" maxFractionDigits="0" value="${departamentoGasto.montoAdeudado + departamentoGasto.montoInteres}" />
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <table class="table table-sm-aux">
                                        <tr class="table-active">
                                            <th scope="row" width="80%">Total a pagar</th>
                                            <td style="text-align: right;">
                                                <fmt:formatNumber type="number" maxFractionDigits="0" value="${departamentoGasto.montoTotal + departamentoGasto.montoAdeudado + departamentoGasto.montoInteres}" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>