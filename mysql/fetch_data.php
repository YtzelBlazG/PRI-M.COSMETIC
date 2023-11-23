<?php
include 'conexion.php';

// Configuración CORS
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: *");

$query = "SELECT * FROM Product";
$result = mysqli_query($con, $query);

if ($result) {
    $data = array();

    while ($row = mysqli_fetch_assoc($result)) {
        $data[] = $row;
    }

    echo json_encode($data);
} else {
    echo "Error: " . mysqli_error($con);
}

mysqli_close($con);
?>

