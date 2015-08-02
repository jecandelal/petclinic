<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  

<t:wrapper title="Atención">

    <div class="btn-group pull-right">
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#ingreso">Nuevo Ingreso</button>
        <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <span class="caret"></span>
            <span class="sr-only">Toggle Dropdown</span>
        </button>
        <ul class="dropdown-menu">
            <li><a href="${pageContext.request.contextPath}/com/atencion/exportar">Generar Reporte </a></li>
        </ul>
    </div>


    <h1 class="page-header"> Atención </h1>

    <table class="table table-striped">
        <tr>
            <th class="col-md-7">Mascota</th>
            <th class="col-md-3">Visita</th>
            <th class="col-md-2 text-center">Acciones</th>
        </tr>
        <c:forEach items="${visitas}" var="e"  >
            <tr>
                <td> 
                    ${e.mascota.nombre}
                    <p class="small text-muted"> 
                        Propietario: ${e.mascota.propietario.persona.nombreCompleto} <br/>
                        Veterinario: ${e.veterinario.persona.nombreCompleto}  <br/>
                        Motivo: ${e.motivo}
                    </p>

                </td>
                <td>
                    <p class="text-muted small">
                        Fecha Ingreso:  <fmt:formatDate value="${e.fechaIngreso}" pattern="dd/MM/yyyy" /> <br/>
                        <c:if test="${e.fechaSalida != null}">
                            Fecha Salida:  <fmt:formatDate value="${e.fechaSalida}" pattern="dd/MM/yyyy" /> <br/>
                            <span class="text-danger">Próxima Visita:  <fmt:formatDate value="${e.proximaVisita}" pattern="dd/MM/yyyy" /> </span>
                        </c:if>
                    </p>
                </td>

                <td class="text-center">
                    <a class="atencion btn btn-sm btn-${e.fechaSalida == null ? 'info': 'success'}" 
                       href="#" rel="${e.id}">${e.fechaSalida == null ? 'Atención': 'Ver'}</a>
                </td>
            </tr>
        </c:forEach>
    </table>

    <input type="hidden" value="${pageContext.request.contextPath}" id="context"/>
    <%@include file="ingreso.jsp"%>


    <script>
        $(function () {

            // INGRESO
            $('#mascota').chained('#propietario');

            // ATENCION - VER
            $('body').delegate('.atencion', 'click', function () {
                var visita = $(this).attr('rel');

                $.ajax({
                    url: $('#context').val() + '/com/atencion/show',
                    method: "POST",
                    data: {id: visita},
                    success: function (response) {
                        $('body').append(response);
                        $('#proceso').modal('show');
                    }
                })
            });






        });
    </script>


</t:wrapper>