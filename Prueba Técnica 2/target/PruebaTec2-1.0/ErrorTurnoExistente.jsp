<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Error - ID de turno existente</title>
    </head>
    <body>
        <h2>Error - ID de turno existente</h2>
        <p>La ID de turno que intenta usar ya está ocupada. Por favor, elija otra ID única.</p>
        <script>
            var mensaje = "La ID de turno que intenta usar ya está ocupada. Por favor, elija otra ID única.";
            alert(mensaje);
            window.location.href = "CrearTurno.jsp";
        </script>
    </body>
</html>
