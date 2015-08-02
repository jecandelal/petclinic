<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<t:wrapper title="Especies">
    <h1 class="page-header"> Especies </h1>

    <form action="${pageContext.request.contextPath}/gen/especie/save" method="post" class="form-inline">
        <input type="hidden" name="id" value="${especie.id}"/>

        <div class="form-group">
            <input type="text" class="form-control" placeholder="Especie" name="nombre" value="${especie.nombre}" required="">
        </div>

        <button type="submit" class="btn btn-primary">Guardar</button>
        <a href="${pageContext.request.contextPath}/gen/especie" class="btn btn-link">Cancelar</a>
    </form>

    <br/>
    <table class="table table-striped">
        <tr>
            <th class="col-md-10">Especie</th>
            <th class="col-md-2">Acciones</th>
        </tr>
        <c:forEach items="${especies}" var="e"  >
            <tr>
                <td> ${e.nombre}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/gen/especie/update/${e.id}">Editar</a> 
                    <a href="${pageContext.request.contextPath}/gen/especie/delete/${e.id}">Eliminar</a>
                </td>
            </tr>
        </c:forEach>
    </table>


</t:wrapper>