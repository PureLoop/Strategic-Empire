<link rel="stylesheet" href="css/modForm.css">
<form id="insertForm" action="insertProduct" method="POST" enctype="multipart/form-data" class="form-container">
    <div class="form-group">
        <input type="text" name="codice" value="" placeholder="Codice">
    </div>
    <div class="form-group">
        <input type="text" name="nome" value="" placeholder="Nome">
    </div>
    <div class="form-group">
        <input type="number" step="0.01" name="prezzo" value="" placeholder="Prezzo">
    </div>
    <div class="form-group">
        <input type="file" id="imgCopertina" name="imgCopertina" accept=".jpeg, .jpg, .png">
        <label for="imgCopertina">COPERTINA</label>
    </div>
    <div class="form-group">
        <input type="file" id="img2" name="img2" accept=".jpeg, .jpg, .png">
        <label for="img2">SECONDA IMG</label>
    </div>
    
    <% if (request.getAttribute("insType") != null && request.getAttribute("insType").equals("gioco")) { %>
    <div class="form-group">
        <input type="text" name="edizione" value="" placeholder="Edizione">
    </div>
    <div class="form-group">
        <select id="tipologia" name="tipologia">
            <option value="tavolo">TAVOLO</option>
            <option value="carte">CARTE</option>
        </select>
    </div>
    <div class="form-group">
        <input type="number" name="min_gio" value="" placeholder="Minimo giocatori">
    </div>
    <div class="form-group">
        <input type="number" name="max_gio" value="" placeholder="Massimo giocatori">
    </div>
    <input type="hidden" name="prodType" value="giochi">
    <% } else if (request.getAttribute("insType") != null && request.getAttribute("insType").equals("accessorio")) { %>
    <div class="form-group">
        <select id="tipologia" name="tipologia">
            <option value="altri brand">ALTRI BRAND</option>
            <option value="esclusivi">ESCLUSIVI</option>
        </select>
    </div>
    <input type="hidden" name="prodType" value="accessori">
    <% } else if (request.getAttribute("insType") != null && request.getAttribute("insType").equals("espansione")) { %>
    <div class="form-group">
        <input type="text" name="codGioco" value="" placeholder="Codice Gioco">
    </div>
    <input type="hidden" name="prodType" value="espansioni">
    <% } %>

    <div class="form-group">
        <textarea rows="7" cols="100" name="descrizione" placeholder="Descrizione"></textarea>
    </div>
    <div class="button-group">
        <input type="button" onclick="submitInsForm()" value="Invia">
    </div>
</form>

