<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registrazione</title>


	
	 <style>
        body {
            font-family: Arial, sans-serif;
        }
        .login-container {
            max-width: 400px;
            margin: 0 auto;
            margin-top: 50px;
            padding: 120px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .login-container h2 {
            margin-bottom: 20px;
            text-align: center;
        }
        .form-group {
            margin-bottom: 80px;
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
    </style>
</head>
<body>
	<%@ include file="/header/header.jsp" %>
<div class="login-container">
    <h2>Register</h2>
    <form action="RegisterServlet" method="post">
        <div class="form-group">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <div class="form-group">
            <label for="email">E-mail:</label>
            <input type="email" id="email" name="email" required>
        </div>
        <div class="form-group">
            <label for="ruolo">Ruolo:</label>
            <input type="text" id="ruolo" name="ruolo" required>
        </div>
        <div class="form-group">
            <button type="submit">Register</button>
        </div>
    </form>
</div>

		<%@ include file="/footer/footer.jsp" %>
</body>

</body>
</html>