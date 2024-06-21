<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contatti - Strategic Empire</title>
    <link href="https://fonts.googleapis.com/css2?family=Lora:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
    <%@ include file="/header/header.jsp"%>
  
    </header>
    <h1>Unisciti alla Nostra Avventura!</h1>
        <p>Hai domande, feedback o vuoi collaborare con noi? Siamo qui per te!</p>
    <main>
        <section id="contact-form">
            <h2>Contattaci</h2>
            <form>
                <label for="name">Nome:</label>
                <input type="text" id="name" name="name" required style="background: #f4f4f4 url('icon-user.png') no-repeat 10px center;">
                
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required style="background: #f4f4f4 url('icon-email.png') no-repeat 10px center;">
                
                <label for="subject">Oggetto:</label>
                <input type="text" id="subject" name="subject" required style="background: #f4f4f4 url('icon-subject.png') no-repeat 10px center;">
                
                <label for="message">Messaggio:</label>
                <textarea id="message" name="message" required style="background: #f4f4f4 url('icon-message.png') no-repeat 10px 10px;"></textarea>
                
                <button type="submit">Invia il Tuo Messaggio</button>
            </form>
        </section>
        <section id="additional-contact">
            <h2>Altri Modi per Contattarci</h2>
            <p>Email: <a href="mailto:info@strategicempire.com">info@strategicempire.com</a></p>
            <p>Telefono: <a href="tel:+123456789">+1 234 567 89</a></p>
            <p>Indirizzo: Via dei Giochi 123, 00100 Roma, Italia</p>
        </section>
        <section id="social-media">
            <h2>Seguici sui Social</h2>
            <a href="#"><img src="icon-facebook.png" alt="Facebook"></a>
            <a href="#"><img src="icon-twitter.png" alt="Twitter"></a>
            <a href="#"><img src="icon-instagram.png" alt="Instagram"></a>
        </section>
        <section id="faq">
            <h2>Domande Frequenti</h2>
            <div class="faq-item">
                <h3>Come posso acquistare un gioco?</h3>
                <p>Puoi acquistare i nostri giochi direttamente dal nostro <a href="/shop">shop online</a>.</p>
            </div>
            <!-- Aggiungi altre domande e risposte qui -->
        </section>
    </main>
    <footer>
     <%@ include file="/footer/footer.jsp"%>
        <p>&copy; 2024 Strategic Empire. Tutti i diritti riservati.</p>
    
    </footer>
</body>
</html>
