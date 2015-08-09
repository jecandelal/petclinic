<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  

<t:wrapper title="Mascotas">
    <a href="${pageContext.request.contextPath}/com/mascota/new" class="pull-right btn btn-primary"> Nuevo</a>

    <c:choose>
        <c:when test="${propietario == null}">
            <h1 class="page-header"> Mascotas </h1>
        </c:when>

        <c:when test="${propietario != null}">
            <h1 class="page-header"> Mascotas de ${propietario.persona.nombreCompleto} </h1>
        </c:when>
    </c:choose>


    <table class="table table-striped">
        <tr>
            <th class="col-md-2">Propietario</th>
            <th class="col-md-8">Mascota</th>
            <th class="col-md-2">Acciones</th>
        </tr>
        <c:forEach items="${mascotas}" var="e"  >
            <tr>
                <td> 
                    ${e.propietario.persona.nombreCompleto}
                </td>
                <td> 
                    ${e.nombre}  

                    <div class="row text-muted small">
                        <div class="col-md-6">
                            Fecha de Nacimiento: <fmt:formatDate value="${e.fechaNacimiento}" pattern="dd/MM/yyyy" /> <br/>
                            Nº Identificación: ${e.nroIdentificacion} <br/>
                            Sexo:  ${e.sexo == 1 ? "Macho" :"Hembra" }
                        </div>
                        <div class="col-md-6">
                            Especie: ${e.especie.nombre} <br/>
                            Raza: ${e.raza.nombre} <br/>
                            Color: ${e.color}
                        </div>
                    </div>
                </td>
                <td>
                    <a href="${pageContext.request.contextPath}/com/mascota/update/${e.id}">Editar</a> 
                    <a href="${pageContext.request.contextPath}/com/mascota/delete/${e.id}">Eliminar</a>
                </td>
            </tr>
        </c:forEach>
    </table>


</t:wrapper>