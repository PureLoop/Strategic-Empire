<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi Siamo - Rolling DICES</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
    <!-- Aggiungere sempre quello sotto altrimenti non funziona la tendina -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="ChiSiamoStyle.css"> <!-- Collegamento al foglio di stile CSS -->
</head>
<body>

    <%@ include file="/header/header.jsp"%>

    <div class="container">
        <h1>Benvenuti nel mondo di Strategic Empire</h1>
        <p class="tagline">Esplora, Conquista, Vinci!</p>
        <h2>Il nostro Team - Rolling DICES</h2>

        <div class="intro">
            <p>Benvenuti nel cuore del nostro universo ludico, dove i giochi da tavolo prendono vita e le strategie si mescolano con l'emozione. Siamo il team di Strategic Empire, un gruppo di appassionati pronti a guidarti attraverso le avventure più epiche e i duelli più audaci. Scopri chi siamo e preparati a unirsi a noi in un viaggio senza fine attraverso mondi fantastici e sfide avvincenti.</p>
        </div>

        <div class="team">

                <div id="anna" class="member-content">
                    <img class="avatar" src="anna.jpg" alt="Foto di Anna">
                    <h3 class="name">Annarella</h3>
                    <p class="description">Conosciuta anche come Annarella, Anna è il genio strategico del nostro team. Con una mente analitica e un'abilità incredibile nel pianificare mosse audaci, è sempre pronta a guidare il gruppo verso la vittoria.</p>
                </div>

   
                <div id="antonio" class="member-content">
                    <img class="avatar" src="antonio.jpg" alt="Foto di Antonio">
                    <h3 class="name">Cherry</h3>
                    <p class="description">Conosciuto anche come Cherry, Antonio è il creativo del gruppo. Con la sua immaginazione vivace e la sua abilità nel pensiero laterale, porta un tocco di originalità a ogni strategia di gioco.</p>
                </div>
           
          
                <div id= "aldo" class="member-content">
                    <img class="avatar" src="aldo.jpg" alt="Foto di Aldo">
                    <h3 class="name">Alduccio</h3>
                    <p class="description">Conosciuto anche come Alduccio, Aldo è il collante che tiene insieme il nostro team. Con il suo senso dell'umorismo contagioso e la sua capacità di creare un'atmosfera rilassata, rende ogni partita un'esperienza divertente e memorabile.</p>
                </div>
           
            
                <div id="luigi"class="member-content">
                    <img class="avatar" src="luigi.jpg" alt="Foto di Luigi">
                    <h3 class="name">Gigi</h3>
                    <p class="description">Conosciuto anche come Gigi, Luigi è il nostro esperto di regole. Con la sua conoscenza dettagliata di ogni gioco, è sempre pronto a risolvere qualsiasi controversia e a garantire che ogni partita si svolga in modo equo e divertente.</p>
                </div>
            
        </div>
<div>
        <p class="team-description">Insieme, formiamo un team dinamico pronto a esplorare nuovi mondi e ad affrontare ogni sfida che Strategic Empire ci riserva. Unisciti a noi e scopri il divertimento infinito dei giochi da tavolo!</p>
    </div>
    </div>

    <footer>
        <%@ include file="/footer/footer.jsp"%>
    </footer>

</body>
</html>
