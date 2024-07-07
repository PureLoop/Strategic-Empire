<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contatti - Strategic Empire</title>
    <link href="https://fonts.googleapis.com/css2?family=Lora:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="Contatti.css">
</head>
<style> 
<body>
    <header>
        <%@ include file="/header/header.jsp"%>

    </header>

    <div class="parallax"></div>
    <h1 class="main-title">Contattaci e Unisciti alla Nostra Avventura!</h1>
    <p>Hai domande, feedback o vuoi collaborare con noi? Siamo qui per te!</p>
    <main>
        <section id="contact-form">
            <h2>Contattaci</h2>
            <form id="contactForm">
                <label for="name">Nome:</label>
                <input type="text" id="name" name="name" required style="background: #f4f4f4 url('icons/icon-user.png') no-repeat 10px center;">
                
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required style="background: #f4f4f4 url('icons/icon-email.png') no-repeat 10px center;">
                
                <label for="subject">Oggetto:</label>
                <input type="text" id="subject" name="subject" required style="background: #f4f4f4 url('icons/icon-subject.png') no-repeat 10px center;">
                
                <label for="message">Messaggio:</label>
                <textarea id="message" name="message" required style="background: #f4f4f4 url('icons/icon-message.png') no-repeat 10px 10px;"></textarea>
                
                <button type="submit" class="btn-form">Invia il Tuo Messaggio</button>
            </form>
        </section>
        <section id="additional-contact">
            <h2>Altri Modi per Contattarci</h2>
            <p><img src="IMMAGINI/icons/icon-email.jpg" alt="Email Icon"> Email: <a href="mailto:info@strategicempire.com">info@strategicempire.com</a></p>
            <p><img src="IMMAGINI/icons/icon-phone.webp" alt="Phone Icon"> Telefono: <a href="tel:+123456789">+1 234 567 89</a></p>
        </section>
        <section id="social-media">
            <h2>Seguici sui Social</h2>
            <a href="https://www.facebook.com"><img src="IMMAGINI/icons/icon-facebook.jpeg" alt="Facebook"></a>
            <a href="https://www.twitter.com"><img src="IMMAGINI/icons/icon-twitter.jpg" alt="Twitter"></a>
            <a href="https://www.instagram.com"><img src="IMMAGINI/icons/icon-instagram.webp" alt="Instagram"></a>
        </section>
    </main>
    <script src="script.js"></script>
    <footer>
        <%@ include file="/footer/footer.jsp"%>
        <p>&copy; 2024 Strategic Empire. Tutti i diritti riservati.</p>
    </footer>

    <script>
        document.getElementById('contactForm').addEventListener('submit', function(event) {
            event.preventDefault();
            alert('Il form è stato inviato con successo!');

            // Pulisci i campi del form
            document.getElementById('name').value = '';
            document.getElementById('email').value = '';
            document.getElementById('subject').value = '';
            document.getElementById('message').value = '';
        });
    </script>
</body>
</html>
