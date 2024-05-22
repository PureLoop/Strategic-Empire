<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Fonts and Icons -->
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<!-- Custom CSS -->
<style>
.login-container {
	max-width: 400px;
	margin: 0 auto;
	padding: 40px;
	border-radius:2%;
	box-shadow: 0 10px 34px rgba(0, 0, 0, 0.1);
	background: rgba(255, 255, 255, 0.2); /* Maggiore trasparenza */
	backdrop-filter: blur(10px);
}

.login-container h2 {
	margin-bottom: 20px;
	text-align: center;
	font-weight: 700;
}

.form-group {
	position: relative;
	margin-bottom: 20px; /* Aggiungiamo spazio sotto il form */
}

.form-control {
	padding: 20px 45px 20px 15px; /* Aggiungiamo spazio per l'icona */
	border: 1px solid #ccc;
	border-radius: 2rem !important;
	background: rgba(255, 255, 255, 0.5) !important;
	/* Trasparenza forzata */
	backdrop-filter: blur(10px); /* Effetto blur per il contenuto */
	color: #000; /* Colore del testo per maggiore leggibilità */
}

.toggle-icon {
	position: absolute;
	top: 50%;
	right: 15px; /* Posizioniamo l'icona a destra */
	transform: translateY(-50%);
	cursor: pointer;
}

.toggle-password {
	position: absolute;
	top: 50%;
	right: 20px;
	/* Posizioniamo l'icona leggermente più vicina al campo password */
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

/* Aggiunta di regole per il form mail */
.with-icon {
	padding-right: 40px; /* Aggiungiamo spazio per l'icona */
}

.toggle-password {
	position: absolute;
	top: 50%;
	right: 15px; /* Posizioniamo l'icona a destra */
	transform: translateY(-50%);
	cursor: pointer;
}
</style>

</head>
<body class="img js-fullheight"
	style="background-image: url('IMMAGINI/bg.jpg');">
	<%@ include file="/header/header.jsp"%>
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section"></h2>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-6 col-lg-4">
					<div class="login-container">
						<h2>Login</h2>
						<form action="Richiesta_Login.jsp" method="post"
							class="signin-form">
							<div class="form-group position-relative">
								<input type="text" id="email" name="email"
									class="form-control with-icon" placeholder="Email" required>
								<i class="fa fa-envelope-open-o toggle-icon"></i>
							</div>
							
							<div class="form-group">
								<div class="password-container">
									<input type="password" id="password-field" name="password"
										class="form-control" placeholder="Password" required>
									<span toggle="#password-field"
										class="fa fa-fw field-icon toggle-password fa-eye"></span>
								</div>
							</div>
							<div class="form-group">
								<button type="submit"
									class="form-control btn btn-primary submit px-3">Login</button>
							</div>
						</form>
						<div class="register-link">

							<p>
								Non sei ancora registrato? <a href="Register.jsp">Registrati</a>
							</p>
						</div>
						<p class="w-100 text-center">&mdash; O accedi con &mdash;</p>
						<div class="social d-flex text-center">
							<a href="#" class="px-2 py-2 mr-md-1 rounded"><span
								class="ion-logo-facebook mr-2"></span> Facebook</a> <a href="#"
								class="px-2 py-2 ml-md-1 rounded"><span
								class="ion-logo-twitter mr-2"></span> Twitter</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<%@ include file="/footer/footer.jsp"%>

	<!-- Bootstrap JS and dependencies -->
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

	<!-- Custom JS -->
	<script src="js/main.js"></script>
</body>
</html>
