<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<t:wrapper>
    <h1 class="page-header"> Razas</h1>


    <table class="table table-striped">
        <tr>
            <th>Especie</th>
            <th>Raza</th>
            <th>Acciones</th>
        </tr>
        <c:forEach items="${razas}" var="r" varStatus="i" >
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