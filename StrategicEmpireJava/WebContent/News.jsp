<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Notizie e Aggiornamenti - Nostro Sito di Giochi</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.3/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/News.css" rel="stylesheet">
</head>
<body>

<main>
    <header>
        <%@ include file="/header/header.jsp"%>
    </header>

    <!-- Carosello di Immagini -->
    <div id="imageCarousel" class="carousel slide mb-5" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="https://via.placeholder.com/1200x400" class="d-block w-100" alt="Game Image 1">
            </div>
            <div class="carousel-item">
                <img src="https://via.placeholder.com/1200x400" class="d-block w-100" alt="Game Image 2">
            </div>
            <div class="carousel-item">
                <img src="https://via.placeholder.com/1200x400" class="d-block w-100" alt="Game Image 3">
            </div>
            <!-- Aggiungi altre immagini qui -->
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#imageCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#imageCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>

    <!-- Card delle News -->
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <div class="news-card">
                    <img src="https://via.placeholder.com/400x300" alt="Game Image 1" class="img-fluid">
                    <h3>Avventure Epiche</h3>
                    <p>Un nuovo gioco di avventure epiche con componenti di alta qualità e storie coinvolgenti.</p>
                    <a href="#" class="read-more btn btn-primary">Leggi di più</a>
                </div>
            </div>
            <div class="col-md-4">
                <div class="news-card">
                    <img src="https://via.placeholder.com/400x300" alt="Game Image 2" class="img-fluid">
                    <h3>Regni Perduti</h3>
                    <p>Esplora terre misteriose e scopri antichi segreti in questo gioco di strategia.</p>
                    <a href="#" class="read-more btn btn-primary">Leggi di più</a>
                </div>
            </div>
            <div class="col-md-4">
                <div class="news-card">
                    <img src="https://via.placeholder.com/400x300" alt="Game Image 3" class="img-fluid">
                    <h3>Battaglie Galattiche</h3>
                    <p>Combatti epiche battaglie spaziali con flotte di astronavi personalizzabili.</p>
                    <a href="#" class="read-more btn btn-primary">Leggi di più</a>
                </div>
            </div>
            <div class="col-md-4">
                <div class="news-card">
                    <img src="https://via.placeholder.com/400x300" alt="Game Image 4" class="img-fluid">
                    <h3>Misteri d'Oriente</h3>
                    <p>Un intrigante gioco di investigazione ambientato in un antico regno orientale.</p>
                    <a href="#" class="read-more btn btn-primary">Leggi di più</a>
                </div>
            </div>
            <div class="col-md-4">
                <div class="news-card">
                    <img src="https://via.placeholder.com/400x300" alt="Game Image 5" class="img-fluid">
                    <h3>Terre di Fantasia</h3>
                    <p>Costruisci il tuo impero in un mondo fantasy ricco di magia e creature mitiche.</p>
                    <a href="#" class="read-more btn btn-primary">Leggi di più</a>
                </div>
            </div>
            <!-- Aggiungi altre card qui -->
        </div>
    </div>

    <div class="newsletter-container text-center my-5">
        <h2>Iscriviti alla nostra Newsletter</h2>
        <form action="#" method="post" class="d-inline-block">
            <div class="input-group">
                <input type="email" class="form-control" id="email" name="email" placeholder="Inserisci la tua email" required>
                <button type="submit" class="btn btn-primary">Iscriviti</button>
            </div>
        </form>
    </div>

    <footer>
        <%@ include file="/footer/footer.jsp"%>
    </footer>
</main>
</body>
</html>
