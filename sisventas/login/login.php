<?php
ob_start();
session_start();
require_once $_SERVER['DOCUMENT_ROOT'] . "/sisventas/controlador/UsuarioControlador.php";

$error = "";

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $usuario = trim($_POST["nomusuario"] ?? '');
    $password = $_POST["password"] ?? '';

    $controlador = new UsuarioControlador();
    $usuarioDatos = $controlador->verificarLogin($usuario, $password);

    if ($usuarioDatos) {
        $_SESSION["idusuario"] = $usuarioDatos["idusuario"];
        $_SESSION["nomusuario"] = $usuarioDatos["nomusuario"];
        header("Location: /sisventas/index.php");
        exit;
    } else {
        $error = "❌ Usuario o contraseña incorrectos.";
    }
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Iniciar Sesión</title>
    <link href="/sisventas/assets/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #f0f2f5, #dcdcdc);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .login-container {
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 16px rgba(0,0,0,0.1);
            padding: 30px 40px;
            max-width: 480px;
            width: 100%;
        }
        .form-title {
            font-size: 24px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 25px;
        }
        .btn-primary i {
            margin-right: 5px;
        }
    </style>
</head>
<body>

<div class="login-container">
    <div class="form-title">🔐 Iniciar Sesión</div>

    <?php if ($error): ?>
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <?= $error ?>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Cerrar"></button>
        </div>
    <?php endif; ?>

    <form method="POST" class="needs-validation" novalidate>
        <div class="mb-3">
            <label for="nomusuario" class="form-label">Nombre de Usuario</label>
            <input type="text" name="nomusuario" id="nomusuario" class="form-control" required>
            <div class="invalid-feedback">Por favor, ingresa tu nombre de usuario.</div>
        </div>

        <div class="mb-3">
            <label for="password" class="form-label">Contraseña</label>
            <input type="password" name="password" id="password" class="form-control" required>
            <div class="invalid-feedback">Por favor, ingresa tu contraseña.</div>
        </div>

        <div class="d-grid gap-2 mt-3">
            <button type="submit" class="btn btn-primary"><i class="bi bi-box-arrow-in-right"></i> Ingresar</button>
            <a href="registrarse.php" class="btn btn-link">¿No tienes cuenta? Regístrate</a>
        </div>
    </form>
</div>

<script src="/sisventas/assets/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
<script>
(() => {
  'use strict';
  const forms = document.querySelectorAll('.needs-validation');
  Array.from(forms).forEach(form => {
    form.addEventListener('submit', event => {
      if (!form.checkValidity()) {
        event.preventDefault();
        event.stopPropagation();
      }
      form.classList.add('was-validated');
    }, false);
  });
})();
</script>

</body>
</html>

