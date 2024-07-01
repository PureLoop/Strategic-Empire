<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nostro Sito di Giochi - Consigli</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.3/css/bootstrap.min.css" rel="stylesheet">
    <link href="consigli.css" rel="stylesheet">
</head>
<body>

<main>
    <header>
        <%@ include file="/header/header.jsp"%>
    </header>

    <div class="container my-5">
        <h1 class="text-center mb-4">Consigli sui Giochi da Tavolo</h1>

        <!-- Bottoni per le pagine dedicate -->
        <div class="text-center mb-5">
            <a href="Consigli1.jsp" class="btn btn-primary mx-3">Consigli sui giochi da tavolo</a>
            <a href="Consigli2.jsp" class="btn btn-primary mx-3">Video e tutorial</a>
            <a href="Consigli3.jsp" class="btn btn-primary mx-3">Recensioni e Suggerimenti</a>
        </div>

        <!-- Qui va il contenuto della pagina principale -->
        <p class="intro-text text-center">Benvenuti nella nostra sezione dedicata ai consigli sui giochi da tavolo! Qui troverete video, recensioni e suggerimenti per migliorare la vostra esperienza di gioco.</p>
        
        <!-- Galleria di Immagini -->
        <div class="row mb-5">
            <div class="col-md-4">
                <div class="image-card">
                    <img src="https://via.placeholder.com/400x300" alt="Game Image 1" class="img-fluid">
                    <h3>Avventure Epiche</h3>
                </div>
            </div>
            <div class="col-md-4">
                <div class="image-card">
                    <img src="https://via.placeholder.com/400x300" alt="Game Image 2" class="img-fluid">
                    <h3>Regni Perduti</h3>
                </div>
            </div>
            <div class="col-md-4">
                <div class="image-card">
                    <img src="https://via.placeholder.com/400x300" alt="Game Image 3" class="img-fluid">
                    <h3>Battaglie Galattiche</h3>
                </div>
            </div>
        </div>

        <!-- Video e Card -->
        <div class="row">
            <div class="col-md-6">
                <div class="video-card mb-4">
                    <iframe src="https://www.youtube.com/embed/VIDEO_ID_1" frameborder="0" allowfullscreen></iframe>
                    <h3>Guida ai Migliori Giochi del 2024</h3>
                    <p>Scopri i migliori giochi da tavolo del 2024 in questa guida completa.</p>
                    <a href="#" class="read-more btn btn-primary">Leggi di più</a>
                </div>
            </div>
            <div class="col-md-6">
                <div class="video-card mb-4">
                    <iframe src="https://www.youtube.com/embed/VIDEO_ID_2" frameborder="0" allowfullscreen></iframe>
                    <h3>Strategie per Vincere a Catan</h3>
                    <p>Impara le migliori strategie per vincere a Catan con questo video tutorial.</p>
                    <a href="#" class="read-more btn btn-primary">Leggi di più</a>
                </div>
            </div>
        </div>

        <!-- Sezione Commenti -->
        <div class="comments-section my-5">
            <h2 class="text-center">Commenti degli Utenti</h2>
            <div class="comment">
                <p><strong>Mario Rossi:</strong> Adoro questo sito! Ho trovato tantissimi consigli utili.</p>
            </div>
            <div class="comment">
                <p><strong>Luisa Bianchi:</strong> Grazie per le recensioni dettagliate, mi hanno aiutato a scegliere il mio prossimo gioco!</p>
            </div>
            <form action="#" method="post" class="comment-form">
                <div class="mb-3">
                    <label for="username" class="form-label">Nome</label>
                    <input type="text" class="form-control" id="username" name="username" required>
                </div>
                <div class="mb-3">
                    <label for="comment" class="form-label">Commento</label>
                    <textarea class="form-control" id="comment" name="comment" rows="3" required></textarea>
                </div>
                <button type="submit" class="btn btn-primary">Invia Commento</button>
            </form>
        </div>
    </div>

    <footer>
        <%@ include file="/footer/footer.jsp"%>
    </footer>
</main>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.bundle.min.js"></script>
</body>
</html>
