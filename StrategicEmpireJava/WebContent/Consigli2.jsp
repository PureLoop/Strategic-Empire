<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Video e Tutorial - Consigli di Gioco</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.3/css/bootstrap.min.css" rel="stylesheet">
    <link href="consigli.css" rel="stylesheet">
</head>
<body>

<main>
    <header>
        <%@ include file="/header/header.jsp"%>
    </header>

    <div class="container my-5">
        <h1 class="text-center mb-4">Video e Tutorial - Consigli di Gioco</h1>

        <!-- Video e Card -->
        <div class="row">
            <div class="col-md-6">
                <div class="card video-card mb-4">
                    <div class="embed-responsive embed-responsive-16by9">
                        <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/VIDEO_ID_1" allowfullscreen></iframe>
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">Guida ai Migliori Giochi del 2024</h5>
                        <p class="card-text">Scopri i migliori giochi da tavolo del 2024 in questa guida completa.</p>
                        <a href="#" class="btn btn-primary stretched-link" data-bs-toggle="modal" data-bs-target="#videoModal1">Guarda il video</a>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card video-card mb-4">
                    <div class="embed-responsive embed-responsive-16by9">
                        <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/VIDEO_ID_2" allowfullscreen></iframe>
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">Strategie per Vincere a Catan</h5>
                        <p class="card-text">Impara le migliori strategie per vincere a Catan con questo video tutorial.</p>
                        <a href="#" class="btn btn-primary stretched-link" data-bs-toggle="modal" data-bs-target="#videoModal2">Guarda il video</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modali per i Video -->
        <div class="modal fade" id="videoModal1" tabindex="-1" aria-labelledby="videoModal1Label" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="videoModal1Label">Guida ai Migliori Giochi del 2024</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="embed-responsive embed-responsive-16by9">
                            <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/VIDEO_ID_1" allowfullscreen></iframe>
                        </div>
                        <p>Scopri i migliori giochi da tavolo del 2024 in questa guida completa.</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="videoModal2" tabindex="-1" aria-labelledby="videoModal2Label" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="videoModal2Label">Strategie per Vincere a Catan</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="embed-responsive embed-responsive-16by9">
                            <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/VIDEO_ID_2" allowfullscreen></iframe>
                        </div>
                        <p>Impara le migliori strategie per vincere a Catan con questo video tutorial.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <footer>
        <%@ include file="/footer/footer.jsp"%>
    </footer>
</main>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.bundle.min.js"></script>
</body>
</html>
