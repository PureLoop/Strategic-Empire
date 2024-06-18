<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Fonts and Icons -->
<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
<!-- Custom CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

<style>
html, body {
    height: 100%;
    margin: 0;
    padding: 0;
}

body {
    background-image: url('IMMAGINI/bg.jpg');
    background-size: cover;
    background-position: center;
    display: flex;
 flex-direction: column;
}

.main-content {
    flex-grow: 1;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 20px;
}

.login-container {
    max-width: 400px;
    width: 100%;
    padding: 40px;
    border-radius: 2%;
    box-shadow: 0 10px 34px rgba(0, 0, 0, 0.1);
    background: rgba(255, 255, 255, 0.2);
    backdrop-filter: blur(10px);
}

.login-container h2 {
    margin-bottom: 20px;
    text-align: center;
    font-weight: 700;
}

.form-group {
    position: relative;
    margin-bottom: 20px;
}

.form-control {
    padding: 20px 45px 20px 15px;
     border: 1px solid #ccc;
    border-radius: 2rem !important;
    background: rgba(255, 255, 255, 0.5) !important;
    backdrop-filter: blur(10px);
    color: #000;
}

.toggle-icon {
    position: absolute;
    top: 50%;
    right: 15px;
    transform: translateY(-50%);
    cursor: pointer;
}

.submit {
    border-radius: 50%;
    padding: 10px 20px;
    background-color: #007bff;
    color: #fff;
    border: none;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.submit:hover {
    background-color: #0056b3;
}

.register-link p {
    margin-top: 20px;
}

.img {
    background-size: cover;
    background-position: center;
}

.footer {
    text-align: center;
    padding: 10px 0;
    background-color: rgba(255, 255, 255, 0.5);
    backdrop-filter: blur(10px);
}
</style>

</head>
<body>
<%@ include file="/header/header.jsp"%>
<br><br><br>
<div class="main-content">
    <div class="login-container" id="insert">
        <h2>Login</h2>
        <form action="Richiesta_Login.jsp" method="post" class="signin-form">
            <div class="form-group position-relative">
                <input type="text" id="email" name="email" class="form-control with-icon" placeholder="Email" required>
                <i class="fa fa-envelope-open-o toggle-icon"></i>
            </div>
            
            <div class="form-group">
                <div class="password-container">
                    <input type="password" id="password-field" name="password" class="form-control" placeholder="Password" required>
                    <span toggle="#password-field" class="fa fa-fw field-icon toggle-password fa-eye"></span>
                </div>
            </div>
            <div class="form-group">
                <button type="submit" class="form-control btn btn-primary submit px-3">Login</button>
            </div>
        </form>
        <div class="register-link">
            <p>Non sei ancora registrato? <a href="Register.jsp">Registrati</a></p>
        </div>
        <p class="w-100 text-center">&mdash; Ricordiamo ai nostri clienti che il trattamento dei dati sensibili come credenziali,
        o carte di credito verranno cryptate come da regolamento U.E. &mdash;</p>
    </div>
</div>
<br><br><br>
<footer class="footer">
    <%@ include file="/footer/footer.jsp"%>
</footer>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<!-- Custom JS -->
<script src="js/main.js"></script>
</body>
</html>