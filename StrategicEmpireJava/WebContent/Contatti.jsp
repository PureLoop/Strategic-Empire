<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contattaci - Nostro Sito di Giochi</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.3/css/bootstrap.min.css" rel="stylesheet">
    <link href="style.css" rel="stylesheet">
</head>
<body>

<main>
    <header>
        <%@ include file="/header/header.jsp" %>
    </header>

    <div class="container my-5">
        <h1 class="text-center mb-4">Contattaci</h1>
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card contact-card">
                    <div class="card-body">
                        <h2 class="card-title">Hai domande? Siamo qui per aiutarti!</h2>
                        <p class="card-text">Compila il modulo sottostante o contattaci tramite email o telefono. Il nostro team sarà felice di rispondere a tutte le tue domande.</p>
                        <form>
                            <div class="mb-3">
                                <label for="name" class="form-label">Nome</label>
                                <input type="text" class="form-control" id="name" required>
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label">Email</label>
                                <input type="email" class="form-control" id="email" required>
                            </div>
                            <div class="mb-3">
                                <label for="subject" class="form-label">Oggetto</label>
                                <input type="text" class="form-control" id="subject" required>
                            </div>
                            <div class="mb-3">
                                <label for="message" class="form-label">Messaggio</label>
                                <textarea class="form-control" id="message" rows="5" required></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary">Invia</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <footer>
        <%@ include file="/footer/footer.jsp" %>
    </footer>
</main>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.bundle.min.js"></script>
</body>
</html>
