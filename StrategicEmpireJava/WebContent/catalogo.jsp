<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Catalogo</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 
<link rel="stylesheet" href="GiocoStyle.css">
</head>
<body>
<header>
<%@ include file="/header/header.jsp" %>
</header>
<div class="container search-bar">
    <form class="d-flex" role="search">
    <input type="hidden" id="searchType" name="searchType" value="gioco">
      <input class="form-control me-2" type="search" id="searchInput" placeholder="Cerca" aria-label="Cerca">
      <button class="btn btn-outline-success" id="filter" type="button">Filtra</button>
    </form>
</div>
<div class="container search-bar">
    <form method="post" id="form-filtro">
        <input type="hidden" name="action" value="filter">
        <table id="game-table" style="width: 100%;">
            <tr>
                <td style="width: 33%;" id="game-type-td"><select id="game-type" name="tipologia" required style="width: 100%;">
                    <option value="" selected>Tipo di gioco</option>
                    <option value="Tutti">Tutti</option>
                    <option value="tavolo">Tavolo</option>
                    <option value="carte">Carte</option>
                </select></td>
                <td style="width: 33%;" id="num-players-td"><input type="number" name="N_giocatori" id="num-players" min="1" max="10" placeholder="Numero giocatori" style="width: 100%;" ></td>
                <td style="width: 33%;" id="price-input-td"><input type="number" name="prezzo" id="priceInput" min="1" max="1000" placeholder="Prezzo" style="width: 100%;"></td>
                <td style="width: 25%;">
                    <button type="button" class="btn btn-outline-success" style="width: 100%;" id="submitFilter">Filtra</button>
                </td>
            </tr>
        </table>
    </form>
</div>

<div id="choiceProdotti" class="button-group justify-content-around">
    <button type="button" id="accessori" class="btn btn-outline-success">Accessori</button>
    <button type="button" id="giochi" class="btn btn-outline-success">Giochi</button>
    <button type="button" id="espansioni" class="btn btn-outline-success">Espansioni</button>
</div>
<div id="sezioneProdotti"></div>

<div class="toast-container position-fixed top-0 end-0 p-3">
    <div id="cartToast" class="toast align-items-center border border-success" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="d-flex bg-white rounded p-2">
            <div class="toast-body">
                <span id="toastMessage">Oggetto aggiunto al carrello!</span>
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check-circle text-success ms-2" viewBox="0 0 16 16">
                    <path d="M8 0a8 8 0 1 0 0 16A8 8 0 0 0 8 0ZM6.406 11.328L4.47 9.414a.5.5 0 1 1 .707-.708l1.666 1.667 3.75-3.75a.5.5 0 0 1 .708.708l-4.167 4.167a.5.5 0 0 1-.708 0Z" />
                </svg>
            </div>
        </div>
    </div>
</div>
<script>
$(document).ready(function() {
    function loadGiochi() {
        $.ajax({
            url: 'catalogoControl',
            method: 'GET',
            data: {
                action: 'ShowGioco',
                type: 'gioco',
            },
            success: function(response) {
                $('#sezioneProdotti').html(response);
            },
            error: function(xhr, status, error) {
                console.error('Errore: ' + error);
            }
        });
    }

    loadGiochi();
    
    $('#searchInput').on('input', function() {
        var searchQuery = $(this).val().trim();
        var searchType = $('#searchType').val(); // Get the current search type

        $.ajax({
            url: 'catalogoControl',
            method: 'GET',
            data: {
                action: 'search',
                searchParam: searchQuery,
                searchType: searchType // Include the search type
            },
            success: function(response) {
                $('#sezioneProdotti').html(response);
            },
            error: function(xhr, status, error) {
                console.error('Errore: ' + error);
            }
        });
    });

    $('#filter').click(function(event) {
        event.preventDefault(); // Prevent form submission
        $('#form-filtro').toggle(); // Toggle visibility of the filter form
        if ($('#searchType').val() === 'accessorio') {
            $('#game-type').html(`
                <option value="" selected>Tipo di accessorio</option>
                <option value="altri brand">Altri Brand</option>
                <option value="esclusivi">Esclusivi</option>
            `);
            $('#game-type-td').show();
            $('#num-players-td').hide();
            $('#game-type-td').css({'margin-left': 'auto', 'margin-right': '0'});
            $('#price-input-td').css({'margin-left': 'auto', 'margin-right': '0'});
        } else if ($('#searchType').val() === 'espansione') {
            $('#game-type-td').hide();
            $('#num-players-td').hide();
            $('#price-input-td').show();
            $('#price-input-td').css({'margin-left': 'auto', 'margin-right': '0'});
        }else {
            $('#game-type').html(`
                <option value="" selected>Tipo di gioco</option>
                <option value="Tutti">Tutti</option>
                <option value="tavolo">Tavolo</option>
                <option value="carte">Carte</option>
            `);
            $('#priceInput').attr('placeholder', 'Prezzo');
            $('#num-players-td').show();
            $('#game-type-td').css({'margin': '0'});
            $('#price-input-td').css({'margin': '0'});
        }
    });

    $('#submitFilter').click(function(event) {
        event.preventDefault();
        var searchType = $('#searchType').val(); // Get the current search type
        console.log(searchType);
        var data = {
            action: 'filter',
            tipologia: $('#game-type').val(),
            prezzo: $('#priceInput').val(),
            searchType: searchType
        };
        
        if (searchType === 'gioco') {
            data.N_giocatori = $('#num-players').val();
        }

        $.ajax({
            url: 'catalogoControl',
            method: 'POST',
            data: data,
            success: function(response) {
                $('#sezioneProdotti').html(response);
            },
            error: function(xhr, status, error) {
                console.error('Errore: ' + error);
            }
        });
    });

    $('#giochi, #accessori, #espansioni').click(function(event) {
        event.preventDefault();
        var actionType = $(this).attr('id'); // Ottieni l'azione da eseguire
        var actionParam;

        if (actionType === 'giochi') {
            actionParam = 'ShowGioco';
            $('#searchType').val('gioco');
        } else if (actionType === 'accessori') {
            actionParam = 'ShowAccessorio';
            $('#searchType').val('accessorio');
        } else if (actionType === 'espansioni') {
            actionParam = 'ShowEspansione';
            $('#searchType').val('espansione');
        }

        $.ajax({
            url: 'catalogoControl',
            method: 'GET',
            data: {
                action: actionParam
            },
            success: function(response) {
                $('#sezioneProdotti').html(response);
            },
            error: function(xhr, status, error) {
                console.error('Errore: ' + error);
            }
        });
    });
});
</script>
	<!-- FOOTER -->
    <footer>
      <%@ include file="/footer/footer.jsp" %>
    </footer>
</body>
</html>
