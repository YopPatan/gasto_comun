<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %> <!-- IMPORTANTE PARA PARSEAR JSP -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="navbar navbar-dark bg-dark navbar-expand-lg" style="margin-bottom: 30px;">
    <a class="navbar-brand" href="#"><i class="fa fa-paper-plane" aria-hidden="true"></i></a>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item ${param.selected == 'gastocomun' ? 'active' : ''}">
                <a class="nav-link" href="/gastocomun">Gasto Comun</a>
            </li>
            <li class="nav-item ${param.selected == 'cuenta' ? 'active' : ''}">
                <a class="nav-link" href="/cuenta">Cuenta</a>
            </li>
            <li class="nav-item ${param.selected == 'personal' ? 'active' : ''}">
                <a class="nav-link" href="/personal">Personal</a>
            </li>
            <li class="nav-item dropdown ${param.selected == 'departamento' ? 'active' : ''}">
                <a class="nav-link dropdown-toggle" data-toggle="dropdown" aria-expanded="false">Departamento</a>
                <div class="dropdown-menu" href="#" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="/departamento">Departamento</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="/consumo">Consumo</a>
                </div>
            </li>
        </ul>
        <form class="form-inline" style="margin: 0px;">
            <a href="/logout" class="btn btn-outline-info my-2 my-sm-0">Logout</a>
        </form>
    </div>
</nav>