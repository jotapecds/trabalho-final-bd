<?php

# Criando objeto de conexão com o banco de dados
define('HOST', 'localhost');
define('USER', 'root');
define('PASS', '');
define('DB', 'projeto_final_bd');

$conn = new MySQLi(HOST, USER, PASS, DB); 
