<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type');

$db = mysqli_connect('localhost', 'root', '', 'bdcosmetic');
if (!$db) {
    echo json_encode(["error" => "Error en la conexión a la base de datos: " . mysqli_connect_error()]);
} else {
    $username = $_POST['username'];
    $password = $_POST['password'];

    $response = []; // Crear un arreglo para almacenar mensajes

    $response[] = "Datos recibidos: Usuario: $username, Contraseña: $password";

    $selectQuery = "SELECT * FROM user WHERE username = ? AND password = ?";
    $stmtSelect = mysqli_prepare($db, $selectQuery);

    if (!$stmtSelect) {
        $response[] = "Error en la preparación de la consulta SELECT.";
    } else {
        mysqli_stmt_bind_param($stmtSelect, "ss", $username, $password);
        mysqli_stmt_execute($stmtSelect);
        $result = mysqli_stmt_get_result($stmtSelect);

        $count = mysqli_num_rows($result);

        if ($count > 0) {
            $response[] = "Error: Este usuario ya existe.";
        } else {
            $insertQuery = "INSERT INTO user(username, password) VALUES(?, ?)";
            $stmtInsert = mysqli_prepare($db, $insertQuery);

            if (!$stmtInsert) {
                $response[] = "Error en la preparación de la consulta INSERT.";
            } else {
                mysqli_stmt_bind_param($stmtInsert, "ss", $username, $password);
                $queryResult = mysqli_stmt_execute($stmtInsert);

                if ($queryResult) {
                    $response[] = "Success: Registro exitoso.";
                } else {
                    $response[] = "Error en la ejecución de la consulta INSERT.";
                }
            }
            mysqli_stmt_close($stmtInsert);
        }
        mysqli_stmt_close($stmtSelect);
    }
    mysqli_close($db);

    // Imprimir la respuesta JSON final
    echo json_encode($response);
}
?>
