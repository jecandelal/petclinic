<!-- http://getbootstrap.com/javascript/#modals-examples -->
<div class="modal fade" id="ingreso">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-primary">
                <h4 class="modal-title">Nuevo Ingreso</h4>
            </div>

            <form action="${pageContext.request.contextPath}/com/atencion/save" method="post">
                <input type="hidden" name="id"/>

                <div class="modal-body">

                    <div class="form-group">
                        <label class="control-label"> Propietario </label>

                        <select class="form-control" id="propietario"> 
                            <c:forEach items="${propietarios}" var="e" >
                                <option value="${e.id}"> ${e.persona.nombreCompleto} </option>
                            </c:forEach>
                        </select>
                    </div>


                    <div class="form-group">
                        <label class="control-label"> Mascota </label>

                        <select name="mascota.id" class="form-control" id="mascota"> 
                            <c:forEach items="${mascotas}" var="e" >
                                <option value="${e.id}" class="${e.propietario.id}"> ${e.nombre} </option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="form-group">
                        <label class="control-label"> Motivo </label>

                        <textarea class="form-control" name="motivo"></textarea>
                    </div>


                    <div class="form-group">
                        <label class="control-label"> Veterinario </label>

                        <select name="veterinario.id" class="form-control" > 
                            <c:forEach items="${veterinarios}" var="e" >
                                <option value="${e.id}"> ${e.persona.nombreCompleto} </option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-link" data-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-primary">Generar Ingreso</button>
                </div>

            </form>
        </div>
    </div>
</div>
