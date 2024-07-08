<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nostro Sito di Giochi - Consigli</title>
    
    <!-- Includi Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.3/css/bootstrap.min.css" rel="stylesheet"> 
    
    <!-- Includi FontAwesome CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" rel="stylesheet">
    
    <!-- Includi Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">

    <!-- Includi il tuo file CSS personalizzato -->
    <link href="css/Consigli/Consigli.css" rel="stylesheet">
</head>
<body>
<main>
    <header>
        <%@ include file="/header/header.jsp" %>
    </header>

    <div class="container my-5">
        <h1 class="text-center mb-4" style="color: #003366;">Consigli sui Giochi da Tavolo</h1>

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
                        <h3 class="card-title">TOP 10 dei giochi pi� ATTESI del 2024</h3>
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
                        <p>Portare uno o pi� giochi di societ� in viaggio o nello zaino pu� salvarti la serata!</p>
                        <a href="https://www.youtube.com/watch?v=dqPkE1qgIUE" class="btn btn-primary read-more" target="_blank">Guarda il video</a>
                    </div>
                </div>
            </div>
        </div>
        <center>
            <div class="col-md-6">
                <div class="video-card mb-4">
                    <div class="embed-responsive embed-responsive-16by9">
						<iframe src="https://www.youtube.com/embed/3iiLf4HOk5g" frameborder="0" allowfullscreen></iframe>
                    </div>
                    <div class="card-body">
                        <h3 class="card-title">Video introduttivo Strategic Empire.</h3>
                        <p>Scopri il nostro video introduttivo creato appositamente per voi.</p>
                        <a href="https://youtu.be/3iiLf4HOk5g" class="btn btn-primary read-more" target="_blank">Guarda il video</a>
                    </div>
                </div>
            </div>
            </center>
        <!-- Sezione YouTube aggiuntiva -->
        <div class="youtube-section text-center my-5">

            <h2 class="text-primary mb-4" style="font-size: 2rem; color:white !important;">Scopri il Nostro Canale YouTube</h2>

            <p class="text-dark" style="font-size: 1.2rem;">Iscriviti al nostro canale per non perdere i nostri video sui giochi da tavolo!</p>
            <a href="https://www.youtube.com/channel/yourchannel" class="btn btn-primary btn-lg" style="font-size: 1.2rem;" target="_blank">Visita il Canale</a>
        </div>

        <!-- Sezione Commenti Interattiva -->
        <h2 class="text-center mb-4" style="color: #003366;">Commenti degli utenti</h2>
        
        <!-- Contenitore per i commenti -->
        <div id="comment-container" class="comments-container mb-4">
            <!-- Qui verranno aggiunti dinamicamente i commenti -->
        </div>

        <!-- Form per inserire commenti -->
        <form id="comment-form" class="mb-5">
            <div class="mb-3">
                <input type="text" id="username" class="form-control" placeholder="Nome">
            </div>
            <div class="mb-3">
                <textarea id="comment" class="form-control" placeholder="Inserisci il tuo commento"></textarea>
            </div>
            <button type="submit" class="btn btn-primary">Invia Commento</button>
        </form>
    </div>

    <footer>
        <%@ include file="/footer/footer.jsp" %>
    </footer>
</main>

<!-- Includi jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Includi Bootstrap JavaScript -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.3/js/bootstrap.bundle.min.js"></script>

<!-- Includi il tuo file JavaScript personalizzato -->
<script src="consigli.js"></script>
</body>
</html>
