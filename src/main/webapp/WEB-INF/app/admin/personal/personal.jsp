<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  

<t:wrapper  title="Personal">
    <a href="${pageContext.request.contextPath}/adm/personal/new" class="pull-right btn btn-primary"> Nuevo</a>
    <h1 class="page-header"> Personal </h1>


    <table class="table table-striped">
        <tr>
            <th class="col-md-8">Personal</th>
            <th class="col-md-1">Rol</th>
            <th class="col-md-1">Estado</th>
            <th class="col-md-2">Acciones</th>
        </tr>
        <c:forEach items="${usuarios}" var="e"  >
            <tr>
                <td> 
                    ${e.persona.nombreCompleto}  

                    <div class="row text-muted small">
                        <div class="col-md-6">
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
                    ${e.perfil == "ADMIN" ? "Administrador" :"Asistente" }
                </td>
                <td>
                    <span class="label label-${e.estado == "ACT" ? "success" :"danger" }">
                        ${e.estado == "ACT" ? "Activo" :"Inactivo" }
                    </span>
                </td>
                <td>
                    <a href="${pageContext.request.contextPath}/adm/personal/update/${e.id}">Editar</a> 
                    <a href="${pageContext.request.contextPath}/adm/personal/delete/${e.id}">Eliminar</a>
                </td>
            </tr>
        </c:forEach>
    </table>


</t:wrapper>