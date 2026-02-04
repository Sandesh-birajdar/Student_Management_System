<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login | Student Management</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body {
    background: linear-gradient(135deg, #667eea, #764ba2);
    min-height: 100vh;
    font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
}

.login-card {
    background: rgba(255, 255, 255, 0.15);
    backdrop-filter: blur(12px);
    border-radius: 20px;
    color: white;
}

.login-card input {
    background: rgba(255, 255, 255, 0.9);
}

.login-card input:focus {
    box-shadow: 0 0 8px rgba(102, 126, 234, 0.8);
}

.btn-login {
    background: linear-gradient(to right, #36d1dc, #5b86e5);
    border: none;
    color: white;
}

.btn-login:hover {
    transform: scale(1.03);
    transition: 0.3s;
}

.error-box {
    background: rgba(255, 0, 0, 0.15);
    border: 1px solid rgba(255, 0, 0, 0.4);
    border-radius: 10px;
}
</style>
</head>

<body>

<div class="container d-flex justify-content-center align-items-center vh-100">

    <div class="card login-card shadow-lg p-4" style="width: 24rem;">

        <h3 class="text-center mb-4">🔐 Login</h3>

        <!-- ERROR MESSAGE -->
        <c:if test="${not empty login_fail}">
            <div class="alert alert-danger text-center error-box">
                ${login_fail}
            </div>
        </c:if>

        <form action="login" method="post">

            <div class="mb-3">
                <label class="form-label">Username</label>
                <input type="text" class="form-control" name="username"
                       placeholder="Enter username" required>
            </div>

            <div class="mb-4">
                <label class="form-label">Password</label>
                <input type="password" class="form-control" name="password"
                       placeholder="Enter password" required>
            </div>

            <div class="d-grid">
                <button type="submit" class="btn btn-login btn-lg">
                    Login
                </button>
            </div>

        </form>

        <p class="text-center mt-3 text-light" style="font-size: 13px;">
            © 2026 Student Management System
        </p>

    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
