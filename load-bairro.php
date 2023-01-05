<?php
    # Recuperando o id do bairro pelo parâmetro passado na URL
    $id_bairro = $_REQUEST['id'];

    $sql = "SELECT * FROM bairros b
            LEFT JOIN bairro_biblioteca USING (id_bairro)
            LEFT JOIN bairro_museu USING (id_bairro) 
            LEFT JOIN bairro_patrimonio USING (id_bairro)
            WHERE b.id_bairro={$id_bairro}";

    $res = $conn->query($sql);

    # Transformando o retorno da consulta em SQL em um objeto PHP
    if (!$res) { printf("Error message: %s\n", $conn->error); } 
	else
    {
        $bairro = $res->fetch_object();
    }
?>

<div class="container">
    <!-- Gráficos -->
    <div class="row">
        <div id="chart_div" class="col"> <!-- Carrega grafico de barra --> </div>
        <div id="chart_div2" class="col"> <!-- Carrega grafico de Pizza --> </div>
    </div>

    <!-- Tabela de informações gerais sobre bibliotecas, museus e patrimônios do bairro -->
    <div class="row">
        <table id="bairro-table" class="table table-hover table-striped">
            <tr>
                <th>Bairro</th>
                <th>Ponto cultural</th>
                <th>Quantidade</th>
                <th></th>
            </tr>
            <tr>
                <td><?php print $bairro->nome ?></td>
                <td> Bibliotecas</td>
                <td><?php print $bairro->qtd_bibliotecas != null ? $bairro->qtd_bibliotecas : 0 ?></td>
                <td><?php print "<button class=\"btn btn-secondary\" onclick=\"toggleInfo('biblios-info')\">Ver mais</button>" ?></td>
            </tr>
            <tr>
                <td><?php print $bairro->nome ?></td>
                <td> Museus</td>
                <td><?php print $bairro->qtd_museus != null ? $bairro->qtd_museus : 0 ?></td>
                <td><?php print "<button class=\"btn btn-secondary\" onclick=\"toggleInfo('museus-info')\">Ver mais</button>" ?></td>
            </tr>
            <tr>
                <td><?php print $bairro->nome ?></td>
                <td> Patrimônios</td>
                <td><?php print $bairro->qtd_patrimonios != null ? $bairro->qtd_patrimonios : 0 ?></td>
                <td><?php print "<button class=\"btn btn-secondary\"onclick=\"toggleInfo('patrimos-info')\">Ver mais</button>" ?></td>
            </tr>
        </table>
    </div>

    <!-- Informações específicas  -->
    <div class="row">
        <!-- Bibliotecas -->
        <div class="col col-info overflow-auto d-none" id="biblios-info">
            <h3 class="h3 text-muted">Bibliotecas em <strong><?php print $bairro->nome?></strong></h3>
            <?php
                $sql = "SELECT SUM(acervo) AS tot_acervo, AVG(acervo) AS media_acervo
                        FROM biblioteca b WHERE b.id_bairro={$id_bairro}";
                $res = $conn->query($sql);

                # Transformando o retorno da consulta em SQL em um objeto PHP
                if (!$res) { printf("Error message: %s\n", $conn->error); } 
                else
                {
                    $result = $res->fetch_object();
                }
                
                // if ($result != null && $result->tot_acervo != null)
                //     $total_acervo = $result->tot_acervo;
                // else    
                //     $total_acervo = 0;

                if ($result != null)
                {
                    print("<h6 class='h6 text-muted'>Acervo total do bairro: {$result->tot_acervo}</h6>");
                    print("<h6 class='h6 text-muted'>Média do acervo das bibliotecas: {$result->media_acervo}</h6>");
                }
            ?>
            <table id="biblios-table" class="table table-hover" >
                <tr>
                    <th>Nome</th>
                    <th>Acervo</th>
                </tr>
                <?php
                    $sql = "SELECT * FROM biblioteca b WHERE b.id_bairro={$id_bairro}";
                    $res = $conn->query($sql);
        
                    # Transformando o retorno da consulta em SQL em um objeto PHP
                    if (!$res) { printf("Error message: %s\n", $conn->error); } 
                    else
                    {
                        while ($biblios = $res->fetch_object())
                        {
                            if ($biblios != null)
                            {
                                print "<tr>
                                        <td>" . ($biblios->nome != null ? $biblios->nome : '-sem registro-') . "</td>
                                        <td>" . ($biblios->acervo != null ? $biblios->acervo : '-sem registro-') . "</td>
                                      <tr>";
                            }
                        }
                    }
                ?>
            </table>
        </div>
        <!-- Museus -->
        <div class="col col-info overflow-auto d-none" id="museus-info">
            <h3 class="h3 text-muted">Museus em <strong><?php print $bairro->nome?></strong></h3>
            <table id="museus-table" class="table table-hover" >
                <tr>
                    <th>Nome</th>
                    <th>Tipo</th>
                    <th>Endereço</th>
                </tr>
                <?php
                    $sql = "SELECT * FROM museu m WHERE m.id_bairro={$id_bairro} ORDER BY m.tipo";
                    $res = $conn->query($sql);
        
                    # Transformando o retorno da consulta em SQL em um objeto PHP
                    if (!$res) { printf("Error message: %s\n", $conn->error); } 
                    else
                    {
                        while ($museus = $res->fetch_object())
                        {
                            if ($museus != null)
                            {
                                print "<tr>
                                        <td>" . ($museus->nome != null ? $museus->nome : '-sem registro-') . "</td>
                                        <td>" . ($museus->tipo != null ? $museus->tipo : '-sem registro-') . "</td>
                                        <td>" . ($museus->endereco != null ? $museus->endereco : '-sem registro-') . "</td>
                                      <tr>";
                            }
                        }
                    }
                ?>
            </table>
        </div>
        <!-- Patrimônios -->
        <div class="col col-info overflow-auto d-none" id="patrimos-info">
            <h3 class="h3 text-muted">Patrimônios em <strong><?php print $bairro->nome?></strong></h3>
            <table id="patrimos-table" class="table table-hover" >
                <tr>
                    <th>Nome</th>
                    <th>Esfera do Governo</th>
                    <th>Endereço</th>
                </tr>
                <?php
                    $sql = "SELECT * FROM patrimonio p 
                            INNER JOIN patrimonio_esfera_do_gov peg USING(id_patrimonio)
                            INNER JOIN esfera_do_gov eg USING(id_esfera_gov)
                            WHERE p.id_bairro={$id_bairro}";

                    $res = $conn->query($sql);
        
                    # Transformando o retorno da consulta em SQL em um objeto PHP
                    if (!$res) { printf("Error message: %s\n", $conn->error); } 
                    else
                    {
                        while ($patrimonio = $res->fetch_object())
                        {
                            if ($patrimonio != null)
                            {
                                print "<tr>
                                        <td>" . ($patrimonio->nome != null ? $patrimonio->nome : '-sem registro-') . "</td>
                                        <td>" . ($patrimonio->tipo != null ? $patrimonio->tipo : '-sem registro-') . "</td>
                                        <td>" . ($patrimonio->localizacao != null ? $patrimonio->localizacao : '-sem registro-') . "</td>
                                      <tr>";
                            }
                        }
                    }
                ?>
            </table>
    </div>
</div>

<?php 
    if ($bairro == null) 
    {
        # Caso não seja encontrada nenhuma outra entidade relacionada ao bairro, informa ao usuário

        print "<script>document.getElementById('bairro-table').classList.add('d-none')</script>";
        print("<p class='message'>Nenhum registro encontrado</p>");
    }
    else
    {
        # Exibindo o nome do bairro selecionado
        print(" <script>
                    location.href='#espec-info-label';
                    document.getElementById('bairro-label').innerHTML='&#10095; {$bairro->nome}';
                </script>");
    

        # Função toggle das informações específicas sobre bibliotecas, museus e patrimônios
        print("<script>
                    function toggleInfo(sourceID)
                    {
                        document.getElementById('biblios-info').classList.add('d-none');
                        document.getElementById('museus-info').classList.add('d-none');
                        document.getElementById('patrimos-info').classList.add('d-none');

                        document.getElementById(sourceID).classList.remove('d-none');
                        location.href='#' + sourceID;
                    }
            </script>");
    
        # Configurando e chamando a API do google charts para exibir os gráficos
        print "<!--Load the AJAX API-->
        <script type='text/javascript' src='https://www.gstatic.com/charts/loader.js'></script>
        <script>
            // Load the Visualization API and the corechart package.
            google.charts.load('current', {'packages':['corechart']});

            // Set a callback to run when the Google Visualization API is loaded.
            google.charts.setOnLoadCallback(drawChart);

            // Callback that creates and populates a data table,
            // instantiates the pie chart, passes in the data and
            // draws it.
            function drawChart() {

                // Create the data table.
                var data = new google.visualization.DataTable();
                data.addColumn('string', 'Familia');
                data.addColumn('number', 'Total');
                data.addRows([
                    ['Familias beneficiárias do PBF', {$bairro->qtd_beneficiarios_pbf}],
                    ['Familias em extrema pobreza', {$bairro->qtd_extrema_pobreza}],
                    ['Familias em EP cadastradas no PBF', {$bairro->qtd_ep_cadastrado}],
                    ['Familias em pobreza', {$bairro->qtd_pobreza}],
                    ['Familias baixa renda', {$bairro->qtd_baixa_renda}],
                    ['Familias que recebem +1/2 salário mín', {$bairro->qtd_acima_meio_sal_min}]
                ]);

                // Set chart options
                var options = {'title':'Situação das famílias do bairro',
                                'width':500,
                                'height':300};

                // Instantiate and draw our chart, passing in some options.
                var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
                chart.draw(data, options);

                var chart = new google.visualization.PieChart(document.getElementById('chart_div2'));
                chart.draw(data, options);
            }
        </script>";
    }
?>
