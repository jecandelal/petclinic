<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  

<t:wrapper title="Propietarios">
    <a href="${pageContext.request.contextPath}/com/propietario/new" class="pull-right btn btn-primary"> Nuevo</a>
    <h1 class="page-header"> Propietarios </h1>


    <table class="table table-striped">
        <tr>
            <th class="col-md-8">Propietario</th>
            <th class="col-md-2">Acciones</th>
        </tr>
        <c:forEach items="${props}" var="e"  >
            <tr>
                <td> 
                    ${e.persona.nombreCompleto}  

                    <div class="row text-muted small">
                        <div class="col-md-6">
                            Fecha de Registro: <fmt:formatDate value="${e.fechaRegistro}" pattern="dd/MM/yyyy" /> <br/>
                            ${e.persona.email} <br/>
                            ${e.persona.celular}
                        </div>
                        <div class="col-md-6">
                            ${e.persona.direccion} <br/>
                            ${e.persona.telefono}
                        </div>
                    </div>
                </td>
                <td>
                    <a href="${pageContext.request.contextPath}/com/mascota/list/${e.id}">Mascotas</a> 
                    <a href="${pageContext.request.contextPath}/com/propietario/update/${e.id}">Editar</a> 
                    <a href="${pageContext.request.contextPath}/com/propietario/delete/${e.id}">Eliminar</a>
                </td>
            </tr>
        </c:forEach>
    </table>


</t:wrapper>