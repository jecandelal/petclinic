<nav class="navbar navbar-inverse navbar-fixed-top" >
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Pet Clinic</a>
        </div>

        <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <span>${sessionScope.USUARIO_AUTENTICADO.persona.nombreCompleto}</span>
                    <b class="fa fa-angle-down"></b>
                </a>

                <ul class="dropdown-menu">      
                    <li><a href="${pageContext.request.contextPath}/logout">Salir</a></li>
                </ul>

            </li>
        </ul>
    </div>
</nav>