<?php
$db = mysqli_connect('localhost', 'root', '', 'bdcosmetic');

$username = $_POST['username'];
$password = $_POST['password'];

$sql = "SELECT * FROM user WHERE username=? AND password=?";
$stmt = mysqli_prepare($db, $sql);
if ($stmt === false) {

    echo json_encode(array("error" => "Error en la consulta."));
} else {

    mysqli_stmt_bind_param($stmt, "ss", $username, $password);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);

    $resul = array();

    if (mysqli_num_rows($result) > 0) {
        while ($data = mysqli_fetch_assoc($result)) {
            $resul[] = $data;
        }
        echo json_encode($resul);
    } else {
        echo json_encode(array("error" => "Usuario o contraseña incorrectos"));
    }
}

mysqli_stmt_close($stmt);
mysqli_close($db);

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: *");
?>
