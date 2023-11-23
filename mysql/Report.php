<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type");

$db = mysqli_connect('localhost', 'root', '', 'bdcosmetic');

if (!$db) {
    echo "Error en la conexión a la base de datos.";
} else {
    $problem = $_POST['Problem_title'];
    $Affair = $_POST['Affair'];
    $Failed = $_POST['Failed'];
    $Description = $_POST['Description'];

    $problem = mysqli_real_escape_string($db, $problem);
    $Affair = mysqli_real_escape_string($db, $Affair);
    $Failed = mysqli_real_escape_string($db, $Failed);
    $Description = mysqli_real_escape_string($db, $Description);

    $insertQuery = "INSERT INTO technical_support(Problem_title, Affair, Failed, Description) 
                    VALUES ('$problem', '$Affair', '$Failed', '$Description')";
    
    $result = mysqli_query($db, $insertQuery);

    if ($result) {
        echo "Inserción exitosa";
    } else {
        echo "Error en la inserción: " . mysqli_error($db);
    }

    mysqli_close($db);
}
?>
