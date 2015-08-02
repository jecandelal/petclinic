<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  

<!-- http://getbootstrap.com/javascript/#modals-examples -->
<div class="modal fade" id="proceso">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-primary">
                <h4 class="modal-title">Atención a ${visita.mascota.nombre}</h4>
                <p class="small">
                    Propietario: ${visita.mascota.propietario.persona.nombreCompleto} <br/>
                    Veterinario: ${visita.veterinario.persona.nombreCompleto} <br/>
                    Ingreso: <fmt:formatDate value="${visita.fechaIngreso}" pattern="dd/MM/yyyy hh:mm aa" /> - 
                    Salida:  <fmt:formatDate value="${visita.fechaSalida}" pattern="dd/MM/yyyy hh:mm aa" />
                </p>
            </div>
            <div class="modal-body">

                <div class="form-group">
                    <label class="control-label"> Motivo </label>
                    <p class="form-control-static"> ${visita.motivo}</p>
                </div>

                <div class="form-group">
                    <label class="control-label"> Diagnóstico </label>
                    <p class="form-control-static"> ${visita.diagnostico}</p>

                </div>

                <div class="form-group">
                    <label class="control-label"> Tratamiento </label>
                    <p class="form-control-static"> ${visita.tratamiento}</p>
                </div>

                <div class="form-group">
                    <label class="control-label"> Dieta </label>
                    <p class="form-control-static"> ${visita.dieta}</p>
                </div>

                <div class="form-group">
                    <label class="control-label"> Próxima Visita </label>
                    <p class="form-control-static"><fmt:formatDate value="${visita.proximaVisita}" pattern="dd/MM/yyyy" /></p>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-link" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>
