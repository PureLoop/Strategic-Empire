<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registrazione</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Fonts and Icons -->
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <!-- Custom CSS -->
    <style>
        .login-container {
            max-width: 400px;
            margin: 0 auto;
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
            position: relative;
            top: -23px;
            right: -90%;
            transform: translateY(-50%);
            cursor: pointer;
        }

        .toggle-password {
            position: absolute;
            top: 50%;
            right: 20px;
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

        .password-requirements {
            font-size: 0.875rem;
            color: #666;
        }

        .password-requirements .valid {
            color: green;
        }

        .password-requirements .invalid {
            color: red;
        }

        .error-message {
            color: red;
            font-size: 0.875rem;
        }

        .img {
            background-size: cover;
            background-position: center;
        }
    </style>
</head>
<body class="img js-fullheight" style="background-image: url('IMMAGINI/bg.jpg');">
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
                        <h2>Registrazione</h2>
                        <form action="RegisterControl" method="post">
                            <c:if test="${not empty errorMessage}">
                                <div class="error-message">${errorMessage}</div>
                            </c:if>
                            <div class="form-group">
                                <input type="text" id="username" name="username" class="form-control with-icon" placeholder="Username" required>
                            </div>
                            <div class="form-group">
                                <input type="text" id="nome" name="nome" class="form-control with-icon" placeholder="Nome" required>
                            </div>
                            <div class="form-group">
                                <input type="text" id="cognome" name="cognome" class="form-control with-icon" placeholder="Cognome" required>
                            </div>
                            <div class="form-group position-relative">
                                <input type="email" id="email" name="email" class="form-control with-icon" placeholder="E-mail" required>
                                <i class="fa fa-envelope-open-o toggle-icon"></i>
                                <div id="emailError" class="error-message"></div>
                            </div>
                            <div class="form-group position-relative">
                                <input type="password" id="password" name="password" class="form-control" placeholder="Password" required>
                                <span class="fa fa-fw fa-eye field-icon toggle-password" onclick="togglePasswordVisibility()"></span>
                            </div>
                            <div class="form-group">
                                <div id="passwordRequirements" class="password-requirements">
                                    <span id="reqLength" class="invalid">8-16 caratteri</span>
                                    <span id="reqUpperCase" class="invalid">Almeno una lettera maiuscola</span>
                                    <span id="reqNumber" class="invalid">Almeno un numero</span>
                                    <span id="reqSpecialChar" class="invalid">Almeno un carattere speciale</span>
                                </div>
                            </div>
                            <div class="form-group position-relative">
                                <input type="password" id="cpassword" name="cpassword" class="form-control with-icon" placeholder="Conferma Password" required>
                                <div id="passwordError" class="error-message"></div>
                            </div>
                            <div class="form-group">
                                <input type="text" id="indirizzo" name="indirizzo" class="form-control with-icon" placeholder="Indirizzo" required>
                            </div>
                            <div class="form-group">
                                <input type="number" id="ncivico" name="ncivico" class="form-control with-icon" placeholder="Numero Civico" required>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="form-control btn btn-primary submit px-3">Registrati</button>
                            </div>
                        </form>
                        <div class="register-link">
                            <p>
                                Sei già registrato? <a href="Login.jsp">Accedi</a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <%@ include file="/footer/footer.jsp"%>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <!-- Custom JS -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const passwordInput = document.getElementById('password');
            const cpasswordInput = document.getElementById('cpassword');
            const requirements = document.getElementById('passwordRequirements');
            const reqLength = document.getElementById('reqLength');
            const reqUpperCase = document.getElementById('reqUpperCase');
            const reqNumber = document.getElementById('reqNumber');
            const reqSpecialChar = document.getElementById('reqSpecialChar');
            const emailInput = document.getElementById('email');
            const emailError = document.getElementById('emailError');
            const passwordError = document.getElementById('passwordError');

            function validatePassword(password) {
                const minLength = 8;
                const maxLength = 16;
                const hasUpperCase = /[A-Z]/.test(password);
                const hasNumber = /\d/.test(password);
                const hasSpecialChar = /[!@#$%^&*(),.?":{}|<>]/.test(password);

                updateRequirement(reqLength, password.length >= minLength && password.length <= maxLength);
                updateRequirement(reqUpperCase, hasUpperCase);
                updateRequirement(reqNumber, hasNumber);
                updateRequirement(reqSpecialChar, hasSpecialChar);

                return password.length >= minLength && password.length <= maxLength && hasUpperCase && hasNumber && hasSpecialChar;
            }

            function updateRequirement(element, isValid) {
                if (isValid) {
                    element.classList.add('valid');
                    element.classList.remove('invalid');
                } else {
                    element.classList.add('invalid');
                    element.classList.remove('valid');
                }
            }

            passwordInput.addEventListener('input', function() {
                validatePassword(passwordInput.value);
            });

            cpasswordInput.addEventListener('input', function() {
                const password = passwordInput.value;
                const cpassword = cpasswordInput.value;

                if (password !== cpassword) {
                    passwordError.textContent = 'Le password non corrispondono';
                } else {
                    passwordError.textContent = '';
                }
            });

            emailInput.addEventListener('input', function() {
                const email = this.value;

                if (email.trim() === '') {
                    emailError.textContent = '';
                    return;
                }

                fetch('/RegisterControl?action=checkEmail&email=' + encodeURIComponent(email))
                    .then(response => response.json())
                    .then(data => {
                        if (data.exists) {
                            emailError.textContent = 'Email già registrata';
                        } else {
                            emailError.textContent = '';
                        }
                    })
                    .catch(error => console.error('Error:', error));
            });

            document.querySelector('form').addEventListener('submit', function(event) {
                const email = emailInput.value;
                const password = passwordInput.value;
                const cpassword = cpasswordInput.value;

                if (cpassword.trim() !== '' && password !== cpassword) {
                    alert('Le password non corrispondono');
                    event.preventDefault();
                    return false;
                }

                if (!validateEmail(email)) {
                    alert('L\'indirizzo email non è valido');
                    event.preventDefault();
                    return false;
                }

                if (emailError.textContent !== '') {
                    alert('Correggi gli errori nel form prima di inviare.');
                    event.preventDefault();
                    return false;
                }

                if (!validatePassword(password)) {
                    alert('Errore nel campo password!');
                    event.preventDefault();
                    return false;
                }
            });

            function validateEmail(email) {
                const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                return re.test(String(email).toLowerCase());
            }
        });

        function togglePasswordVisibility() {
            const passwordField = document.getElementById('password');
            const toggleIcon = document.querySelector('.toggle-password');
            if (passwordField.type === 'password') {
                passwordField.type = 'text';
                toggleIcon.classList.remove('fa-eye');
                toggleIcon.classList.add('fa-eye-slash');
            } else {
                passwordField.type = 'password';
                toggleIcon.classList.remove('fa-eye-slash');
                toggleIcon.classList.add('fa-eye');
            }
        }
    </script>
</body>
</html>
