<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <title>Projeto BD</title>
</head>
<body>
    <div class="container">
        <!-- <div class="row">
            <div class="col mt-5">
                <h1 class="text-muted">Bem vindo!</h1>
            </div>
        </div> -->

        <div class="row">
            <div class="col mt-5">
                <h2 class="text-muted mt-3">Informações gerais</h2>
            </div>
        </div>

        <div class="row mt-3 ms-3">
            <div class="col mt-3  table-custom">
            <table id="bairros-table" class="table table-hover" >
                <tr>
                    <th>Bairro</th>
                    <th># de Familias beneficiárias do PBF</th>
                    <th># de Familias em extrema pobreza</th>
                </tr>
                <?php
                    require_once('database.php');
                    $sql = "SELECT * FROM bairros b";
                    $res = $conn->query($sql);
        
                    # Transformando o retorno da consulta em SQL em um objeto PHP
                    if (!$res) { printf("Error message: %s\n", $conn->error); } 
                    else
                    {
                        while ($bairro = $res->fetch_object())
                        {
                            if ($bairro != null)
                            {
                                print "<tr>
                                        <td>" . ($bairro->nome != null ? $bairro->nome : '-sem registro-') . "</td>
                                        <td>" . ($bairro->qtd_beneficiarios_pbf != null ? $bairro->qtd_beneficiarios_pbf : '-sem registro-') . "</td>
                                        <td>" . ($bairro->qtd_extrema_pobreza != null ? $bairro->qtd_extrema_pobreza : '-sem registro-') . "</td>
                                      <tr>";
                            }
                        }
                    }
                ?>
            </table>
            </div>
        </div>

        <div class="row">
            <div class="col mt-5">
                <h2 class="text-muted mt-3" id="espec-info-label">Informações específicas</h2>
            </div>
        </div>

        <div class="row mt-3 ms-3">
            <div class="col-3">
                <select id="select-bairro" class="form-select" aria-label="Selecionar bairro">
                    <option value="-1" selected>--Selecionar bairro--</option>
                    <?php 
                        include_once('database.php');

                        $sql = "SELECT id_bairro, nome FROM bairros";
                        $res = $conn->query($sql);

                        while($row = $res->fetch_object())
                        {
                            print "<option value={$row->id_bairro}> {$row->nome} </option>";
                        }
                    ?>
                </select>
            </div>
            <div class="col-3">
                <button class="btn btn-primary" onclick="location.href='?page=loadBairro&id=' + document.getElementById('select-bairro').value">Buscar</button>
            </div>
        </div>

        <div class="row mt-3 ms-3">
            <div class="col mt-3">
                <h3 id="bairro-label" class="h3 text-muted"></h3>
            </div>
        </div>

        <div class="row mt-3 ms-3">
            <div class="col">
                <?php
                    include_once('database.php');
                    switch(@$_REQUEST['page'])
                    {
                        case 'loadBairro':
                            include('load-bairro.php');
                            break;
                        case 'loadBibliosBairro':
                            include('load-biblios-bairro.php');
                            break;
                        default:
                            print('<p class="alert">Realize um filtro!</p>');
                    }
                ?>
            </div>
        </div>

        <!-- <div class="row">
            <div class="col mt-5">
                <form class="form-control" action="cadastrar-patrimonio.php" method="POST">
                    <h4 class="h4 text-muted">Cadastrar Patrimonnio</h4>
                    nome: <input type="text" name="nome_patrimonio" id="nome_patrimonio"> <br>
                    endereço: <input type="text" name="endereco" id="endereco"> <br>
                    id bairro: <input type="number" name="id_bairro" id="id_bairro"> <br>
                    id esfera gov: <input type="number" name="id_esfera_gov" id="id_esfera_gov"> <br>
                    <input type="submit" class="btn btn-primary" value="Enviar">
                </form>
            </div>
        </div> -->
    </div>
    <!-- Scripts -->
    <script src="js/bootstrap.bundle.min.js"></script>    
</body>
</html>