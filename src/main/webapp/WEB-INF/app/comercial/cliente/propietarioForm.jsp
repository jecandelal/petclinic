<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<t:wrapper  title="Propietario">
    <h1 class="page-header"> Propietario </h1>

    <form action="${pageContext.request.contextPath}/com/propietario/save" method="post">

        <input type="hidden" name="id" value="${propietario.id}"/>

        <jsp:include page="../../general/persona/personaForm.jsp" />

        <div class="form-group text-center">
            <button type="submit" class="btn btn-primary">Guardar</button>
            <a href="${pageContext.request.contextPath}/com/propietario" class="btn btn-link">Cancelar</a>
        </div>
    </form>

</t:wrapper>