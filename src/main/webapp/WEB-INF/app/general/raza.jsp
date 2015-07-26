<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<t:wrapper>
    <h1 class="page-header"> Razas</h1>

    <form action="${pageContext.request.contextPath}/gen/raza/save" method="post" class="form-inline">
        <input type="hidden" name="id" value="${raza.id}"/>
        
        <div class="form-group">
            <select name="especie.id" class="form-control">
                <c:forEach items="${especies}" var="e" >
                    <option value="${e.id}"  ${raza.especie.id == e.id ? 'selected': '' }> ${e.nombre} </option>
                </c:forEach>
            </select>
        </div>

        
        <div class="form-group">
            <input type="text" class="form-control" placeholder="Raza" name="nombre" value="${raza.nombre}">
        </div>

        <button type="submit" class="btn btn-primary">Guardar</button>
    </form>

    <br/>
    <table class="table table-striped">
        <tr>
            <th>Especie</th>
            <th>Raza</th>
            <th>Acciones</th>
        </tr>
        <c:forEach items="${razas}" var="r"  >
            <tr>
                <td> ${r.especie.nombre}</td>
                <td> ${r.nombre}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/gen/raza/update/${r.id}">Editar</a> 
                    <a href="${pageContext.request.contextPath}/gen/raza/delete/${r.id}">Eliminar</a>
                </td>
            </tr>
        </c:forEach>
    </table>


</t:wrapper>