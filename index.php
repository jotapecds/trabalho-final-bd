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
        <div class="row as-center">
            <div class="col-4 mt-5">
                <h4 class="text-muted">Bem vindo!</h4>
            </div>
        </div>
        <div class="row">
            <div class="col-3 mt-3">
                <select id="select-bairro" class="form-select" aria-label="Selecionar bairro">
                    <option value="-1" selected>--Selecionar bairro--</option>
                    <?php 
                        include_once('database.php');

                        $sql = "SELECT id_bairro, nome FROM bairro";
                        $res = $conn->query($sql);

                        while($row = $res->fetch_object())
                        {
                            print "<option value={$row->id_bairro}> {$row->nome} </option>";
                        }
                    ?>
                </select>
            </div>
            <div class="col-3 mt-3">
                <button class="btn btn-primary" onclick="location.href='?page=loadBairros&id=' + document.getElementById('select-bairro').value">Buscar</button>
            </div>
        </div>
        <div class="row">
            <div class="col-4 mt-5">
                <h2 id="bairro-label" class="h2 text-muted"></h2>
            </div>
        </div>
    </div>
    <div class="container mt-5">
        <div class="row">
            <div class="col">
                <?php
                    include_once('database.php');
                    switch(@$_REQUEST['page'])
                    {
                        case 'loadBairros':
                            include('load-bairros.php');
                        break;
                        case 'loadBibliosBairro':
                            include('load-biblios-bairro.php');
                        break;
                        case 'loadMuseusBairro':
                            include('load-museus-bairro.php');
                        break;
                        case 'loadPatrimosBairro':
                            include('load-patrimos-bairro.php');
                        break;
                        default:
                            print('<p class="message">Realize um filtro</p>');
                    }
                ?>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-4 mt-5">
                <form class="form-control" action="cadastrar-patrimonio.php" method="POST">
                    <h4 class="h4 text-muted">Cadastrar Patrimonnio</h4>
                    nome: <input type="text" name="nome_patrimonio" id="nome_patrimonio"> <br>
                    endereço: <input type="text" name="endereco" id="endereco"> <br>
                    id bairro: <input type="number" name="id_bairro" id="id_bairro"> <br>
                    id esfera gov: <input type="number" name="id_esfera_gov" id="id_esfera_gov"> <br>
                    <input type="submit" class="btn btn-primary" value="Enviar">
                </form>
            </div>
        </div>
    </div>
    <!-- Scripts -->
    <script src="js/bootstrap.bundle.min.js"></script>    
</body>
</html>