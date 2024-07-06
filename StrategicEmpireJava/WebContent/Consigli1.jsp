<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consigli per il mio sito di giochi da tavolo</title>
    <link rel="stylesheet" href="Consigli1.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <header>
        <%@ include file="/header/header.jsp" %>
    </header>

    <main class="container py-5">
        <section class="video-section">
            <div class="section-title-container text-center mb-5">
                <h2 class="section-title">Consigli</h2>
                <div class="animated-lines">
                    <div class="line"></div>
                    <div class="line"></div>
                    <div class="line"></div>
                </div>
            </div>
        <section class="tips">
            <div class="tip" data-aos="fade-up">
                <i class="fas fa-lightbulb"></i>
                <h2>Consiglio #1</h2>
                <p>Organizza lo spazio di gioco in modo che sia comodo per tutti i partecipanti.</p>
            </div>
            <div class="tip" data-aos="fade-up" data-aos-delay="100">
                <i class="fas fa-gamepad"></i>
                <h2>Consiglio #2</h2>
                <p>Leggi le regole del gioco in anticipo per evitare lunghe pause durante la partita.</p>
            </div>
            <div class="tip" data-aos="fade-up" data-aos-delay="200">
                <i class="fas fa-users"></i>
                <h2>Consiglio #3</h2>
                <p>Invita giocatori di diversi livelli di esperienza per rendere il gioco più interessante.</p>
            </div>
            <div class="tip" data-aos="fade-up" data-aos-delay="300">
                <i class="fas fa-clock"></i>
                <h2>Consiglio #4</h2>
                <p>Prepara degli snack e bevande in anticipo per evitare interruzioni durante il gioco.</p>
            </div>
            <div class="tip" data-aos="fade-up" data-aos-delay="400">
                <i class="fas fa-list"></i>
                <h2>Consiglio #5</h2>
                <p>Fai una lista dei giochi da provare per variare le serate di gioco.</p>
            </div>
            <div class="tip" data-aos="fade-up" data-aos-delay="500">
                <i class="fas fa-chalkboard-teacher"></i>
                <h2>Consiglio #6</h2>
                <p>Spiega chiaramente le regole ai nuovi giocatori per evitare confusione.</p>
            </div>
            <div class="tip" data-aos="fade-up" data-aos-delay="600">
                <i class="fas fa-cogs"></i>
                <h2>Consiglio #7</h2>
                <p>Assicurati che tutti i componenti del gioco siano presenti e in buone condizioni.</p>
            </div>
            <div class="tip" data-aos="fade-up" data-aos-delay="700">
                <i class="fas fa-dice"></i>
                <h2>Consiglio #8</h2>
                <p>Prova giochi di diversi generi per trovare quelli che ti piacciono di più.</p>
            </div>
            <div class="tip" data-aos="fade-up" data-aos-delay="800">
                <i class="fas fa-trophy"></i>
                <h2>Consiglio #9</h2>
                <p>Organizza tornei per aggiungere un elemento competitivo alle tue serate di gioco.</p>
            </div>
            <div class="tip" data-aos="fade-up" data-aos-delay="900">
                <i class="fas fa-smile"></i>
                <h2>Consiglio #10</h2>
                <p>Ricorda di divertirti e di goderti il tempo trascorso con amici e famiglia.</p>
            </div>
        </section>
    </main>

    <footer>
        <%@ include file="/footer/footer.jsp" %>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.js"></script>
    <script>
        AOS.init();
    </script>
</body>
</html>

