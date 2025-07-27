<?php
ob_start();
session_start();
require_once $_SERVER['DOCUMENT_ROOT'] . "/sisventas/controlador/UsuarioControlador.php";

$mensaje = "";
$error = "";

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $controlador = new UsuarioControlador();

    $nomusuario = $_POST["nomusuario"] ?? '';
    $password = $_POST["password"] ?? '';
    $confirmar = $_POST["confirmar"] ?? '';

    $data = [
        "nomusuario" => $nomusuario,
        "password"   => $password,
        "estado"     => "A"
    ];

    if (empty($nomusuario) || empty($password) || empty($confirmar)) {
        $error = "❌ Todos los campos son obligatorios.";
    } elseif ($password !== $confirmar) {
        $error = "❌ Las contraseñas no coinciden.";
    } else {
        if ($controlador->registrarUsuario($data)) {
            $mensaje = "✅ Usuario registrado correctamente. <a href='login.php'>Inicia sesión aquí</a>";
        } else {
            $error = "❌ Error: El nombre de usuario ya existe o faltan datos.";
        }
    }
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registro de Usuario</title>
    <link href="/sisventas/assets/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: #f0f2f5;
        }
        .register-container {
            max-width: 480px;
            margin: 80px auto;
            padding: 30px;
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0 0 20px rgba(0,0,0,0.05);
        }
        .form-title {
            font-size: 24px;
            text-align: center;
            margin-bottom: 25px;
            font-weight: bold;
        }
        .btn-success {
            background-color: #28a745;
        }
    </style>
</head>
<body>
<div class="register-container">
    <div class="form-title">Registro de Usuario</div>

    <?php if ($mensaje): ?>
        <div class="alert alert-success"><?= $mensaje ?></div>
    <?php elseif ($error): ?>
        <div class="alert alert-danger"><?= $error ?></div>
    <?php endif; ?>

    <form method="POST" class="row g-3">
        <div class="col-12">
            <label class="form-label">Nombre de Usuario</label>
            <input type="text" name="nomusuario" class="form-control" required>
        </div>

        <div class="col-12">
            <label class="form-label">Contraseña</label>
            <input type="password" name="password" class="form-control" required>
        </div>

        <div class="col-12">
            <label class="form-label">Confirmar Contraseña</label>
            <input type="password" name="confirmar" class="form-control" required>
        </div>

        <div class="col-12 d-grid gap-2 mt-3">
            <button type="submit" class="btn btn-success">Registrarme</button>
            <a href="login.php" class="btn btn-link">¿Ya tienes cuenta? Inicia sesión</a>
        </div>
    </form>
</div>
</body>
</html>
