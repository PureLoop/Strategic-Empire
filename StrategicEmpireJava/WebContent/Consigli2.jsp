<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Video Tutorial - Nostro Sito di Giochi</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.3/css/bootstrap.min.css" rel="stylesheet">
    <link href="Consigli2.css" rel="stylesheet">
</head>
<body>
    <header>
        <%@ include file="/header/header.jsp"%>
    </header>

    <main class="container py-5">
        <section class="video-section">
            <div class="section-title-container text-center mb-5">
                <h2 class="section-title">Video Tutorial dei Giochi</h2>
                <div class="animated-lines">
                    <div class="line"></div>
                    <div class="line"></div>
                    <div class="line"></div>
                </div>
            </div>
            <div class="row g-4 justify-content-center">
                <div class="col-md-6">
                    <div class="card h-100 shadow-sm border-0">
                        <div class="video-container">
                            <iframe width="100%" height="315" src="https://www.youtube.com/embed/dWXIx9TDyoQ" title="Catan" allowfullscreen></iframe>
                        </div>
                        <div class="card-body text-center">
                            <p class="card-text">Guarda il nostro primo video tutorial per imparare a giocare a Catan!</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card h-100 shadow-sm border-0">
                        <div class="video-container">
                            <iframe width="100%" height="315" src="https://www.youtube.com/embed/MUjFWTbWu2c" title="Takenoko" allowfullscreen></iframe>
                        </div>
                        <div class="card-body text-center">
                            <p class="card-text">Scopri il nostro secondo video tutorial!</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card h-100 shadow-sm border-0">
                        <div class="video-container">
                            <iframe width="100%" height="315" src="https://www.youtube.com/embed/p8cJQqTSPuw" title="Exploding-Kittens" allowfullscreen></iframe>
                        </div>
                        <div class="card-body text-center">
                            <p class="card-text">Guarda il nostro video su Exploding-Kittenss e divertiti con noi!</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card h-100 shadow-sm border-0">
                        <div class="video-container">
                            <iframe width="100%" height="315" src="https://www.youtube.com/embed/D12sgqMEuvw" title="The Mind" allowfullscreen></iframe>
                        </div>
                        <div class="card-body text-center">
                            <p class="card-text">Scopri il nostro quarto video tutorial!</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <footer>
        <%@ include file="/footer/footer.jsp"%>
    </footer>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.3/js/bootstrap.bundle.min.js"></script>
</body>
</html>
