<input type="hidden" name="persona.id" value="${persona.id}"/>

<div class="form-group">
    <label class="control-label"> Nombres </label>
    <input type="text" class="form-control"  name="persona.nombres" value="${persona.nombres}" required="">
</div>

<div class="form-group">
    <label class="control-label"> Apellidos </label>
    <input type="text" class="form-control" name="persona.apellidos" value="${persona.apellidos}" required="">
</div>


<div class="form-group">
    <label class="control-label"> Sexo </label>

    <div class="form-control-static">
        <label class="radio-inline">
            <input type="radio" name="persona.sexo" value="0" ${persona.sexo == 0 ? 'checked' : ''}> F
        </label>
        <label class="radio-inline">
            <input type="radio" name="persona.sexo" value="1" ${persona.sexo == 1 ? 'checked' : ''}> M
        </label>
    </div>
</div>

<div class="form-group">
    <label class="control-label"> Email </label>
    <input type="email" class="form-control" name="persona.email" value="${persona.email}" required="">
</div>

<div class="form-group">
    <label class="control-label"> Celular </label>
    <input type="text" class="form-control" name="persona.celular" value="${persona.celular}" required="">
</div>


<div class="form-group">
    <label class="control-label"> Teléfono </label>
    <input type="text" class="form-control" name="persona.telefono" value="${persona.telefono}">
</div>

<div class="form-group">
    <label class="control-label"> Dirección </label>
    <input type="text" class="form-control" name="persona.direccion" value="${persona.direccion}">
</div>