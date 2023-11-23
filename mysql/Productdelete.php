<?php
$db = mysqli_connect('localhost', 'root', '', 'bdcosmetic');

if (!$db) {
    echo "Error en la conexión a la base de datos.";
} else {
    $id = $_POST['Id'];

    $id = mysqli_real_escape_string($db, $id);

    $deleteQuery = "UPDATE Product SET Status = 0 WHERE Id = $id";
    
    $result = mysqli_query($db, $deleteQuery);

    if ($result) {
        echo "Eliminación exitosa";
    } else {
        echo "Error en la eliminación: " . mysqli_error($db);
    }

    mysqli_close($db);
}
?>

