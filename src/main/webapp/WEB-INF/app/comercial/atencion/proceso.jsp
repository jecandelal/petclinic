<!-- http://getbootstrap.com/javascript/#modals-examples -->
<div class="modal fade" id="proceso">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-primary">
                <h4 class="modal-title">Atención a ${visita.mascota.nombre}</h4>
                <p class="small">
                    Propietario: ${visita.mascota.propietario.persona.nombreCompleto} <br/>
                    Veterinario: ${visita.veterinario.persona.nombreCompleto}
                </p>
            </div>

            <form action="${pageContext.request.contextPath}/com/atencion/save" method="post">
                <input type="hidden" name="id" value="${visita.id}"/>

                <div class="modal-body">

                    <div class="form-group">
                        <label class="control-label"> Motivo </label>
                        <p class="form-control-static"> ${visita.motivo}</p>
                    </div>

                    <div class="form-group">
                        <label class="control-label"> Diagnóstico </label>

                        <textarea class="form-control" name="diagnostico">${visita.diagnostico}</textarea>
                    </div>

                    <div class="form-group">
                        <label class="control-label"> Tratamiento </label>

                        <textarea class="form-control" name="tratamiento">${visita.tratamiento}</textarea>
                    </div>

                    <div class="form-group">
                        <label class="control-label"> Dieta </label>

                        <textarea class="form-control" name="dieta">${visita.dieta}</textarea>
                    </div>

                    <div class="form-group">
                        <label class="control-label"> Próxima Visita </label>
                        <input type="date" class="form-control" name="proximaVisita" value="${visita.proximaVisita}">
                    </div>

                    <div class="form-group ">
                        <input type="checkbox" name="finalizado" value="true" /> Realizar entrega
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-link" data-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-primary">Actualizar</button>
                </div>

            </form>
        </div>
    </div>
</div>
