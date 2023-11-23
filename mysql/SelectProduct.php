<?php

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET");
header("Content-Type: application/json");

$servername = 'localhost';
$username = 'root';
$password = '';
$dbname = 'bdcosmetic';


$conn = new mysqli($servername, $username, $password, $dbname);


if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}


$sql = "SELECT id, name_product, Image, price_base, description_product, price_ofert FROM product";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $productos = array();

    while ($row = $result->fetch_assoc()) {
        $producto = array(
            "id" => $row["id"],
            "name_product" => $row["name_product"],
            "Image" => $row["Image"],
            "price_base" => $row["price_base"],
            "price_ofert" => $row["price_ofert"],
            "description_product" => $row["description_product"],
        );
        array_push($productos, $producto);
    }

    echo json_encode($productos);
} else {
    echo "No se encontraron productos.";
}

$conn->close();
?>
