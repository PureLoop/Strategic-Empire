<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

<style>
    body {
        font-family: Arial, sans-serif;
    }
    .login-container {
        max-width: 400px;
        margin: 0 auto;
        margin-top: 50px;
        padding: 40px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    .login-container h2 {
        margin-bottom: 20px;
        text-align: center;
    }
    .form-group {
        margin-bottom: 20px;
    }
    .form-group label {
        display: block;
        font-weight: bold;
    }
    .form-group input[type="text"],
    .form-group input[type="password"] {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
    .form-group button {
        width: 100%;
        padding: 10px;
        background-color: #007bff;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }
    .form-group button:hover {
        background-color: #0056b3;
    }
    .register-link {
        text-align: center;
        margin-top: 20px;
    }
    .register-link a {
        color: #007bff;
        text-decoration: none;
    }
    .register-link a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>
    <%@ include file="/header/header.jsp" %>
<div class="login-container">
    <h2>Login</h2>
    <form action="Richiesta_Login.jsp" method="post">
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="text" id="email" name="email" required>
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <div class="form-group">
            <button type="submit">Login</button>
        </div>
    </form>
    <div class="register-link">
        <p>Non sei ancora registrato? <a href="Register.jsp">Registrati</a></p>
    </div>
</div>
<%@ include file="/footer/footer.jsp" %>
</body>
</html>
