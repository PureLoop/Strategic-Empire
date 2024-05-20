<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
            margin-top: 2%;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .login-container h2 {
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
        .error-message {
            color: red;
            margin-bottom: 20px;
        }
        .password-requirements {
            margin-top: 10px;
        }
        .password-requirements span {
            display: block;
            font-size: 14px;
            color: red;
        }
        .password-requirements span.valid {
            color: green;
        }
    </style>
   <script>
    document.addEventListener('DOMContentLoaded', function() {
        const passwordInput = document.getElementById('password');
        const requirements = document.getElementById('passwordRequirements');
        const reqLength = document.getElementById('reqLength');
        const reqUpperCase = document.getElementById('reqUpperCase');
        const reqNumber = document.getElementById('reqNumber');
        const reqSpecialChar = document.getElementById('reqSpecialChar');

        passwordInput.addEventListener('input', function() {
            const password = passwordInput.value;
            validatePassword(password);
        });

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

        document.getElementById('email').addEventListener('input', function() {
            const email = this.value;
            const xhr = new XMLHttpRequest();
            xhr.open('GET', 'RegisterServlet?action=checkEmail&email=' + encodeURIComponent(email), true);
            xhr.onload = function() {
                if (xhr.status === 200) {
                    const response = JSON.parse(xhr.responseText);
                    const emailError = document.getElementById('emailError');
                    if (response.emailExists) {
                        emailError.textContent = 'Email già registrataaaaa';
                    } else {
                        emailError.textContent = '';
                    }
                }
            };
            xhr.send();
        });

        document.getElementById('cpassword').addEventListener('input', function() {
            const password = passwordInput.value;
            const cpassword = this.value;
            const passwordError = document.getElementById('passwordError');

            if (password !== cpassword) {
                passwordError.textContent = 'Le password non corrispondono';
            } else {
                passwordError.textContent = '';
            }
        });

        document.querySelector('form').addEventListener('submit', function(event) {
            const email = document.getElementById('email').value;
            const password = passwordInput.value;
            const cpassword = document.getElementById('cpassword').value;

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

            const emailError = document.getElementById('emailError');
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
</script>

</head>
<body>
    <%@ include file="/header/header.jsp" %>
    <div class="login-container">
        <h2>Register</h2>
        <form action="RegisterServlet" method="post">
            <c:if test="${not empty errorMessage}">
                <div class="error-message">${errorMessage}</div>
            </c:if>
            <div class="form-group">
                <label for="nome">Nome:</label>
                <input type="text" id="nome" name="nome" required>
            </div>
            <div class="form-group">
                <label for="cognome">Cognome:</label>
                <input type="text" id="cognome" name="cognome" required>
            </div>
            <div class="form-group">
                <label for="email">E-mail:</label>
                <input type="text" id="email" name="email" required>
                <div id="emailError" class="error-message"></div>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
                <div id="passwordRequirements" class="password-requirements">
                    <span id="reqLength" class="invalid">8-16 caratteri</span>
                    <span id="reqUpperCase" class="invalid">Almeno una lettera maiuscola</span>
                    <span id="reqNumber" class="invalid">Almeno un numero</span>
                    <span id="reqSpecialChar" class="invalid">Almeno un carattere speciale</span>
                </div>
            </div>
            <div class="form-group">
                <label for="cpassword">Conferma Password:</label>
                <input type="password" id="cpassword" name="cpassword" required>
                <div id="passwordError" class="error-message"></div>
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
</html>
