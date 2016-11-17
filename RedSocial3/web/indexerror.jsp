<%-- 
    Document   : index
    Created on : 28-oct-2015, 18:42:18
    Author     : Ycosio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <script>

  function valida_envio(){


   	if (document.fvalida.nCuenta.value.length==0)

 {
		alert("usuario no puede quedar en blanco")
		document.fvalida.nCuenta.focus()
                document.fvalida.nCuenta.value = ""
		return 0;
                
	}

         	if (document.fvalida.pass.value.length==0)

 {
		alert("contraseña no puede quedar en blanco")
		document.fvalida.pass.focus()
                document.fvalida.pass.value = ""
		return 0;
	}




   //el formulario se envia si todo esta correcto
	
	document.fvalida.submit();

}

    </script>
            <meta charset="UTF-8">
    <title>Bienvenido al Sistema de control de academias</title>
    
    <link rel='stylesheet prefetch' href='http://netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css'>
    <link rel="stylesheet" href="css/style.css">
  </head>
 

  <body>
      <div class="wrapper">
        <form class="form-signin" name="fvalida" action="Login" method="post">
            <h2 class="form-signin-heading">Acceso</h2>
              <input type="text" class="form-control" name="nCuenta" placeholder="Numero de cuenta" required="" autofocus="" />
              <input type="password" class="form-control" name="pass" placeholder="Contraseña" required=""/>      
              <span role="alert" class="error-msg" id="errormsg_0_Passwd"><strong style = "color:red;">El correo electrónico y la contraseña que ingresaste no coinciden.</strong></span>
        <button class="btn btn-lg btn-primary btn-block" style="margin-top: 8px;" type="submit">Iniciar Sesión</button> 
        </form>
  </div>
  </body>
</html>
