<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<t:wrapper title="Razas">
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
            <input type="text" class="form-control" placeholder="Raza" name="nombre" value="${raza.nombre}" required="">
        </div>

        <button type="submit" class="btn btn-primary">Guardar</button>
        <a href="${pageContext.request.contextPath}/gen/raza" class="btn btn-link">Cancelar</a>
    </form>

    <br/>
    
    <table class="table table-striped">
        <tr>
            <th class="col-md-10">Raza</th>
            <th class="col-md-2">Acciones</th>
        </tr>
        <c:forEach items="${razas}" var="r"  >
            <tr>
                <td> 
                    ${r.nombre} <br/>
                    <span class="text-muted small"> ${r.especie.nombre}</span>
                </td>
                <td>
                    <a href="${pageContext.request.contextPath}/gen/raza/update/${r.id}">Editar</a> 
                    <a href="${pageContext.request.contextPath}/gen/raza/delete/${r.id}">Eliminar</a>
                </td>
            </tr>
        </c:forEach>
    </table>


</t:wrapper>