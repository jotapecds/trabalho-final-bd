<?php
include_once 'database.php';

$nome_patrimonio = $_POST["nome_patrimonio"];
$endereco = $_POST["endereco"];
$id_bairro = $_POST["id_bairro"];
$id_esfera_gov = $_POST["id_esfera_gov"];

$sql = "INSERT INTO patrimonio (nome, localizacao, id_bairro) VALUES ('{$nome_patrimonio}', '{$endereco}', {$id_bairro})";

$res = $conn->query($sql);

if (!$res) { printf("Error message: %s\n", $conn->error); } 
else
{
    $sql = "INSERT INTO patrimonio_esfera_do_gov 
                SELECT id_patrimonio, id_esfera_gov
                FROM patrimonio p, esfera_do_gov eg
                WHERE p.nome LIKE '{$nome_patrimonio}' 
                    AND p.localizacao LIKE '{$endereco}' 
                    AND p.id_bairro={$id_bairro} 
                    AND eg.id_esfera_gov={$id_esfera_gov}";

    $res = $conn->query($sql);

    if (!$res) { printf("Error message: %s\n", $conn->error); } 
    else
    {
        print "SUCESSO!";
    }
    
}

?>