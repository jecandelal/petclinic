<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<t:wrapper title="Veterinario">
    <h1 class="page-header"> Veterinario </h1>

    <form action="${pageContext.request.contextPath}/gen/veterinario/save" method="post">
        
        <input type="hidden" name="id" value="${veterinario.id}"/>
       
        <jsp:include page="personaForm.jsp" />
       

        <div class="form-group text-center">
            <button type="submit" class="btn btn-primary">Guardar</button>
            <a href="${pageContext.request.contextPath}/gen/veterinario" class="btn btn-link">Cancelar</a>
        </div>
    </form>
            
</t:wrapper>