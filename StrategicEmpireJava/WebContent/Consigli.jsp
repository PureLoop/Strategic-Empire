<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nostro Sito di Giochi - Consigli</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.3/css/bootstrap.min.css" rel="stylesheet"> 
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
<!-- Includi Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

<!-- Includi Bootstrap JavaScript (opzionale, se necessario per componenti specifici) -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.3/js/bootstrap.bundle.min.js"></script>
    
    <link href="Consigli.css" rel="stylesheet">
    
    <!-- Includi jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Includi Bootstrap CSS per gli alert -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Includi Bootstrap JS per gli alert -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- Includi il tuo file JavaScript personalizzato -->
    <script src="Consigli.js"></script>
</head>
<body>

<main>
    <header>
        <%@ include file="/header/header.jsp" %>
    </header>

    <div class="container my-5">
        <h1 class="text-center mb-4" style="color: #ff2600;">Consigli sui Giochi da Tavolo</h1>
        

        <!-- Qui va il contenuto della pagina principale -->
        <p class="intro-text text-center">Benvenuti nella nostra sezione dedicata ai consigli sui giochi da tavolo! Qui troverete video, recensioni e suggerimenti per migliorare la vostra esperienza di gioco.</p>
        
        <!-- Galleria di Immagini con Effetti di Hover -->
        <div class="row mb-5">
            <div class="col-md-4">
                <a href="Consigli1.jsp">
                    <div class="image-card position-relative">
                        <img src="IMMAGINI/IMMAGINI_CONSIGLI/Giochi vari.jpeg" alt="Game Image 1" class="img-fluid">
                        <div class="image-overlay">
                            <h3>Consigli per una serata giochi da tavolo</h3>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-md-4">
                <a href="Consigli2.jsp">
                    <div class="image-card position-relative">
                        <img src="IMMAGINI/IMMAGINI_CONSIGLI/Giochi2.jpeg" alt="Game Image 2" class="img-fluid">
                        <div class="image-overlay">
                            <h3>Video e tutorial</h3>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-md-4">
                <a href="Consigli3.jsp">
                    <div class="image-card position-relative">
                        <img src="IMMAGINI/IMMAGINI_CONSIGLI/GIOCHI.jpeg" alt="Game Image 3" class="img-fluid">
                        <div class="image-overlay">
                            <h3>Recensioni e Suggerimenti</h3>
                        </div>
                    </div>
                </a>
            </div>
        </div>

        <!-- Video e Card con Effetti Interattivi -->
        <div class="row">
            <div class="col-md-6">
                <div class="video-card mb-4">
                    <div class="embed-responsive embed-responsive-16by9">
                        <iframe src="https://www.youtube.com/embed/HC6UmG4ItVE" frameborder="0" allowfullscreen></iframe>
                    </div>
                    <div class="card-body">
                        <h3 class="card-title">TOP 10 dei giochi più ATTESI del 2024</h3>
                        <p>Scopri la top 10 dei giochi da tavolo.</p>
                        <a href="https://www.youtube.com/watch?v=HC6UmG4ItVE" class="btn btn-primary read-more" target="_blank">Guarda il video</a>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="video-card mb-4">
                    <div class="embed-responsive embed-responsive-16by9">
                        <iframe src="https://www.youtube.com/embed/dqPkE1qgIUE" frameborder="0" allowfullscreen></iframe>
                    </div>
                    <div class="card-body">
                        <h3 class="card-title">Giochi da Tavolo Tascabili e da Viaggio - 5 Consigli</h3>
                        <p>Portare uno o più giochi di società in viaggio o nello zaino può salvarti la serata!</p>
                        <a href="https://www.youtube.com/watch?v=dqPkE1qgIUE" class="btn btn-primary read-more" target="_blank">Guarda il video</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Sezione YouTube aggiuntiva -->
        <div class="youtube-section">
    <h2 class="text-white mb-4" style="font-size: 2rem;">Scopri il Nostro Canale YouTube</h2>
    <p class="text-white" style="font-size: 1.2rem;">Iscriviti al nostro canale per non perdere i nostri video sui giochi da tavolo!</p>
    <a href="https://www.youtube.com/channel/yourchannel" class="btn btn-primary btn-lg" style="font-size: 1.2rem;" target="_blank">Visita il Canale</a>
</div>
        

        <!-- Sezione Commenti Interattiva -->
          <h2 class="text-center mb-4" style="color: #ff2600;">Commenti degli utenti</h2>
        
         <!-- Contenitore per i commenti -->
          <div id="comment-container" class="comments-container">
            <!-- Qui verranno aggiunti dinamicamente i commenti -->
        </div>
       <!-- Form per inserire commenti -->
    </div>

  <form id="comment-form">
        <input type="text" id="username" placeholder="Nome">
        <textarea id="comment" placeholder="Inserisci il tuo commento"></textarea>
        <button type="submit">Invia Commento</button>
    </form>
  
        
    <footer>
        <%@ include file="/footer/footer.jsp" %>
    </footer>
</main>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.bundle.min.js"></script>
<script src="consigli.js"></script>
</body>
</html>

