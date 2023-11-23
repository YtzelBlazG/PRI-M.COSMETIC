<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST, GET, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: *');

$db = mysqli_connect('localhost', 'root', '', 'bdcosmetic');
if (!$db) {
    echo "Error en la conexión a la base de datos.";
} else {

    $name = $_POST['name_product'];
    $image = $_POST['image_product'];
    $description = $_POST['description_product'];
    $catalogue = $_POST['Catalogue'];
    $price = $_POST['price_base'];
    $priceOffer = $_POST['price_ofert'];
    $stocks = $_POST['Stock'];
    $categoryId = $_POST['category_id'];

    $name = mysqli_real_escape_string($db, $name);
    $image = mysqli_real_escape_string($db, $image);
    $description = mysqli_real_escape_string($db, $description);
    $catalogue = mysqli_real_escape_string($db, $catalogue);
    $price = mysqli_real_escape_string($db, $price);
    $priceOffer = mysqli_real_escape_string($db, $priceOffer);
    $stocks = mysqli_real_escape_string($db, $stocks);
    $categoryId = mysqli_real_escape_string($db, $categoryId);


    $stmt = $db->prepare("INSERT INTO product(name_product, Image, description_product, Catalogue, price_base, price_ofert, Stock, category_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("ssssdddi", $name, $image, $description, $catalogue, $price, $priceOffer, $stocks, $categoryId);

    try {
        $stmt->execute();
    } catch (Exception $e) {
        echo 'Excepción capturada: ',  $e->getMessage(), "\n";
    }
    echo "Conexión exitosa";

    if ($stmt->affected_rows > 0) {
        echo json_encode(array('message' => 'Inserción exitosa'));
    } else {
        echo json_encode(array('error' => 'Error en la inserción: ' . $stmt->error));
    }

    $stmt->close();
    mysqli_close($db);
}
?>