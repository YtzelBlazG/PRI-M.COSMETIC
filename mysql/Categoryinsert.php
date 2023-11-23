<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST, GET, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type');
header('Content-Type: application/json');

$db = mysqli_connect('localhost', 'root', '', 'bdcosmetic');

if (!$db) {
    echo json_encode(["error" => "Error en la conexión a la base de datos: " . mysqli_connect_error()]);
} else {
    $method = $_SERVER['REQUEST_METHOD'];

    switch ($method) {
        case 'GET':
            // Get products by category ID
            if (isset($_GET['category_id'])) {
                $category_id = mysqli_real_escape_string($db, $_GET['category_id']);
                $query = "SELECT * FROM product WHERE category_id = '$category_id'";
                $result = mysqli_query($db, $query);
                if ($result) {
                    $products = mysqli_fetch_all($result, MYSQLI_ASSOC);
                    echo json_encode($products);
                } else {
                    echo json_encode(["error" => "Error al obtener los productos: " . mysqli_error($db)]);
                }
            } 
            // Get category details based on a product ID
            elseif (isset($_GET['product_id'])) {
                $product_id = mysqli_real_escape_string($db, $_GET['product_id']);
                $query = "SELECT c.id, c.name_category FROM category c JOIN product p ON c.id = p.category_id WHERE p.id = '$product_id'";
                $result = mysqli_query($db, $query);
                if ($result) {
                    $category = mysqli_fetch_assoc($result);
                    echo json_encode($category);
                } else {
                    echo json_encode(["error" => "Error al obtener la categoría: " . mysqli_error($db)]);
                }
            } 
            // Get all categories
            else {
                $result = mysqli_query($db, "SELECT * FROM category");
                if ($result) {
                    $categories = mysqli_fetch_all($result, MYSQLI_ASSOC);
                    echo json_encode($categories);
                } else {
                    echo json_encode(["error" => "Error al obtener las categorías: " . mysqli_error($db)]);
                }
            }
            break;
        

        case 'POST':
            $data = json_decode(file_get_contents("php://input"), true);
            $name_category = $data['name_category'];

            $insertQuery = "INSERT INTO category (name_category) VALUES ('$name_category')";
            if (mysqli_query($db, $insertQuery)) {
                echo json_encode(["message" => "Registro insertado con éxito"]);
            } else {
                echo json_encode(["error" => "Error al insertar el registro: " . mysqli_error($db)]);
            }
            break;

        case 'PUT':
            $data = json_decode(file_get_contents("php://input"), true);
            $id = $data['id'];
            $name_category = $data['name_category'];

            $updateQuery = "UPDATE category SET name_category='$name_category' WHERE id=$id";
            if (mysqli_query($db, $updateQuery)) {
                echo json_encode(["message" => "Registro actualizado con éxito"]);
            } else {
                echo json_encode(["error" => "Error al actualizar el registro: " . mysqli_error($db)]);
            }
            break;

        case 'DELETE':
            $data = json_decode(file_get_contents("php://input"), true);
            $idToDelete = $data['id'];

            $deleteQuery = "DELETE FROM category WHERE id=$idToDelete";
            if (mysqli_query($db, $deleteQuery)) {
                echo json_encode(["message" => "Registro eliminado con éxito"]);
            } else {
                echo json_encode(["error" => "Error al eliminar el registro: " . mysqli_error($db)]);
            }
            break;

        default:
            echo json_encode(["error" => "Método no permitido"]);
            break;
    }
    mysqli_close($db);
}
?>