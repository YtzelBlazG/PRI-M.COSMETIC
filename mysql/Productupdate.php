<?php
$db = mysqli_connect('localhost', 'root', '', 'bdcosmetic');

if (!$db) {
    echo "Error en la conexión a la base de datos.";
} else {
    $id = $_POST['Id'];
    $name = $_POST['name_product'];
    $description = $_POST['description_product'];
    $catalogue = $_POST['Catalogue'];
    $price = $_POST['price_base'];
    $priceOffer = $_POST['price_ofert'];

    $id = mysqli_real_escape_string($db, $id);
    $name = mysqli_real_escape_string($db, $name);
    $description = mysqli_real_escape_string($db, $description);
    $catalogue = mysqli_real_escape_string($db, $catalogue);
    $price = mysqli_real_escape_string($db, $price);
    $priceOffer = mysqli_real_escape_string($db, $priceOffer);

    $updateQuery = "UPDATE product SET 
                    name_product = '$name', 
                    description_product = '$description', 
                    Catalogue = '$catalogue', 
                    price_base = '$price', 
                    price_ofert = '$priceOffer'
                    WHERE Id = $id";
    
    $result = mysqli_query($db, $updateQuery);

    if ($result) {
        echo "Actualización exitosa";
    } else {
        echo "Error en la actualización: " . mysqli_error($db);
    }

    mysqli_close($db);
}
?>
