<?php
session_start();

// Proses login sederhana (Username: admin, Password: 123)
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username'];
    $password = $_POST['password'];

    // Cek username dan password
    if ($username == "admin" && $password == "123") {
        $_SESSION['username'] = $username; // Set session
        header("Location: dashboard.php"); // Redirect ke dashboard.html
        exit();
    } else {
        $error = "Username atau password salah!";
    }
}
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Bebas Tanggungan</title>
    <link rel="stylesheet" href="Login.css">
</head>
<body>
    <!-- Background dari img/picture.jpg -->
    <div class="background"></div>

    <!-- Kontainer Login -->
    <div class="login-container">
        <div class="login-box">
            <img src="img/polinema.png" alt="Logo Polinema" class="logo">
            <h2>BEBAS TANGGUNGAN</h2>
            <?php if (isset($error)) echo "<p class='error'>$error</p>"; ?>
            <form method="POST" action="dashboard.php" id="loginForm">
                <input type="text" name="username" placeholder="Username" required>
                <!-- Input Password dengan Toggle -->
                <div class="password-wrapper">
                    <input type="password" id="password" name="password" placeholder="Password" required>
                    <span id="togglePassword" onclick="togglePasswordVisibility()">👁️</span>
                </div>
                <button type="submit">Login</button>
            </form>
        </div>
    </div>

    <!-- JavaScript untuk Toggle Password -->
    <script>
        function togglePasswordVisibility() {
            const passwordInput = document.getElementById("password");
            const toggleIcon = document.getElementById("togglePassword");
            if (passwordInput.type === "password") {
                passwordInput.type = "text";
                toggleIcon.textContent = "🔒";
            } else {
                passwordInput.type = "password";
                toggleIcon.textContent = "👁️";
            }
        }
    </script>
</body>
</html>