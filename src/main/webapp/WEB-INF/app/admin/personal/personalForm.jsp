<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<t:wrapper title="Personal">
    <h1 class="page-header"> Personal </h1>

    <form action="${pageContext.request.contextPath}/adm/personal/save" method="post">

        <input type="hidden" name="id" value="${usuario.id}"/>

        <jsp:include page="../../general/persona/personaForm.jsp" />


        <div class="form-group">
            <label class="control-label"> Perfil </label>

            <div class="form-control-static">
                <label class="radio-inline">
                    <input type="radio" name="perfil" value="ADMIN" 
                           ${usuario.perfil == "ADMIN" ? 'checked' : ''}> Administrador
                </label>

                <label class="radio-inline">
                    <input type="radio" name="perfil" value="ASIS" 
                           ${usuario.perfil == "ASIS" ? 'checked' : ''}> Asistente
                </label>
            </div>
        </div>

        <c:if test="${usuario.id != null}">
            <div class="form-group">
                <label class="control-label"> Estado </label>

                <div class="form-control-static">
                    <label class="radio-inline">
                        <input type="radio" name="estado" value="ACT" 
                               ${usuario.estado == "ACT" ? 'checked' : ''}> Activo
                    </label>

                    <label class="radio-inline">
                        <input type="radio" name="estado" value="INA" 
                               ${usuario.estado == "INA" ? 'checked' : ''}> Inactivo
                    </label>
                </div>
            </div>
        </c:if>


        <div class="form-group text-center">
            <button type="submit" class="btn btn-primary">Guardar</button>
            <a href="${pageContext.request.contextPath}/adm/personal" class="btn btn-link">Cancelar</a>
        </div>
    </form>

</t:wrapper>