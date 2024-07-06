<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consigli per il mio sito di giochi da tavolo</title>
    <link rel="stylesheet" href="Consigli3.css">
    <!-- Font Awesome per le icone (sostituisci con il tuo percorso o CDN) -->
</head>
<header>
        <%@ include file="/header/header.jsp"%>
    </header>

<body>
    
    <!-- Contenuto principale della pagina -->
    <main class="container py-5">
        <!-- Sezione del video -->
        <section class="video-section">
            <!-- Contenitore del titolo della sezione -->
            <div class="section-title-container text-center mb-5">
                <h2 class="section-title">Suggerimenti e recensioni</h2>
            </div>
            <!-- Linee animate -->
            <div class="animated-lines">
                <div class="line"></div>
                <div class="line"></div>
                <div class="line"></div>
            </div>
        </section>

        <!-- Suggerimenti visivi -->
        <section class="visual-tips">
            <!-- Gioco 1: Catan -->
            <div class="visual-tip">
                <img src="IMMAGINI/IMMAGINI_CONSIGLI/Catan.jpg" alt="Catan">
                <div class="visual-tip-content">
                    <h3>Catan</h3>
                    <p>Un classico gioco di strategia e negoziazione in cui i giocatori colonizzano un'isola, cercando risorse e costruendo insediamenti.</p>
                </div>
            </div>

            <!-- Gioco 2: Scythe -->
            <div class="visual-tip">
                <img src="IMMAGINI/IMMAGINI_CONSIGLI/Scythe.jpg" alt="Scythe">
                <div class="visual-tip-content">
                    <h3>Scythe</h3>
                    <p>Un gioco di strategia ambientato in un'Europa alternativa degli anni '20, con mechs e azioni asimmetriche.</p>
                </div>
            </div>

            <!-- Gioco 3: Ticket to Ride -->
            <div class="visual-tip">
                <img src="IMMAGINI/IMMAGINI_CONSIGLI/TicketToRide.jpg" alt="Ticket to Ride">
                <div class="visual-tip-content">
                    <h3>Ticket to Ride</h3>
                    <p>Un gioco di costruzione ferroviaria in cui i giocatori competono per completare rotte tra le città nordamericane.</p>
                </div>
            </div>

            <!-- Gioco 4: Pandemic -->
            <div class="visual-tip">
                <img src="IMMAGINI/IMMAGINI_CONSIGLI/Pandemic.jpg" alt="Pandemic">
                <div class="visual-tip-content">
                    <h3>Pandemic</h3>
                    <p>Un gioco cooperativo in cui i giocatori lottano insieme contro epidemie globali, cercando di salvare il mondo.</p>
                </div>
            </div>

            <!-- Gioco 5: Azul -->
            <div class="visual-tip">
                <img src="IMMAGINI/IMMAGINI_CONSIGLI/Azul.jpg" alt="Azul">
                <div class="visual-tip-content">
                    <h3>Azul</h3>
                    <p>Un gioco di posizionamento dei tessere in cui i giocatori competono per creare bellissimi mosaici.</p>
                </div>
            </div>
        </section>
    </main>

    <!-- Inclusione del piè di pagina -->
    <footer>
        <%@ include file="/footer/footer.jsp" %>
    </footer>

</body>
</html>

