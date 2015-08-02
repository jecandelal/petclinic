<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<t:wrapper title="Mascota">
    <h1 class="page-header"> Mascota </h1>

    <form action="${pageContext.request.contextPath}/com/mascota/save" method="post">

        <input type="hidden" name="id" value="${mascota.id}"/>

        <div class="form-group">
            <label class="control-label"> Propietario </label>

            <select name="propietario.id" class="form-control" ${mascota.id !=  null ? 'disabled' : ""}> 
                <c:forEach items="${propietarios}" var="e" >
                    <option value="${e.id}"  ${mascota.propietario.id == e.id ? 'selected': '' }> ${e.persona.nombreCompleto} </option>
                </c:forEach>
            </select>
        </div>



        <div class="form-group">
            <label class="control-label"> Nombre </label>
            <input type="text" class="form-control"  name="nombre" value="${mascota.nombre}" required="">
        </div>



        <div class="form-group">
            <label class="control-label"> Nº Identificación </label>
            <input type="text" class="form-control" name="nroIdentificacion" value="${mascota.nroIdentificacion}" required="">
        </div>


        <div class="form-group">
            <label class="control-label"> Fecha de Nacimiento </label>
            <input type="date" class="form-control" name="fechaNacimiento" value="${mascota.fechaNacimiento}" required="">
        </div>



        <div class="form-group">
            <label class="control-label"> Sexo </label>

            <div class="form-control-static">
                <label class="radio-inline">
                    <input type="radio" name="sexo" value="0" ${mascota.sexo == 0 ? 'checked' : ''}> F
                </label>
                <label class="radio-inline">
                    <input type="radio" name="sexo" value="1" ${mascota.sexo == 1 ? 'checked' : ''}> M
                </label>
            </div>
        </div>


        <div class="form-group">
            <label class="control-label"> Especie </label>

            <select name="especie.id" class="form-control" id="especie">
                <c:forEach items="${especies}" var="e" >
                    <option value="${e.id}"  ${mascota.especie.id == e.id ? 'selected': '' }> ${e.nombre} </option>
                </c:forEach>
            </select>
        </div>

        <div class="form-group">
            <label class="control-label"> Raza </label>

            <select name="raza.id" class="form-control" id="raza">
                <c:forEach items="${razas}" var="e" >
                    <option value="${e.id}"  ${mascota.raza.id == e.id ? 'selected': '' } class="${e.especie.id}"> ${e.nombre} </option>
                </c:forEach>
            </select>
        </div>



        <div class="form-group">
            <label class="control-label"> Color </label>
            <input type="text" class="form-control" name="color" value="${mascota.color}" required="">
        </div>



        <div class="form-group text-center">
            <button type="submit" class="btn btn-primary">Guardar</button>
            <a href="${pageContext.request.contextPath}/com/mascota" class="btn btn-link">Cancelar</a>
        </div>
    </form>



    <script>
        $(function () {
            $('#raza').chained('#especie');
        })
    </script>


</t:wrapper>



