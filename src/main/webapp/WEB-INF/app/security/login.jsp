<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:wrapper title="Login">
    <style>
        body{
            background-color: #eee;
        }
    </style>


    <form class="form-signin" action="${pageContext.request.contextPath}/j_spring_security_check" method='post'>
        <h2 class="form-signin-heading"> Pet Clinic</h2>

        <label class="sr-only">Usuario</label>
        <input type="text" class="form-control" placeholder="Usuario" name="j_username"  required="true">

        <label class="sr-only">Contraseña</label>
        <input type="password" class="form-control" placeholder="Contraseña" name="j_password" required="true">


        <button class="btn btn-lg btn-primary btn-block" type="submit">Ingresar</button>
    </form>

</t:wrapper>