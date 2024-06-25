<%@ page import="it.unisa.GiocoBean" %>
<%
GiocoBean bean = (GiocoBean) request.getAttribute("bean");
%>
<link rel="stylesheet" href="css/modForm.css">
<form id='ModifyGameForm' action='updateGame' method='POST' enctype='multipart/form-data' class='form-container'>
    <div class="form-group">
        <input type='hidden' name='gameId' value='<%= bean.getCod_Gioco() %>'>
    </div>
    <div class="form-group">
        <label for="codice">Codice:</label>
        <input type='text' id="codice" name='codice' value='<%= bean.getCod_Gioco() %>'>
    </div>
    <div class="form-group">
        <label for="nome">Nome:</label>
        <input type='text' id="nome" name='nome' value='<%= bean.getNomegioco() %>'>
    </div>
    <div class="form-group">
        <label for="prezzo">Prezzo:</label>
        <input type='number' step='0.01' id="prezzo" name='prezzo' value='<%= bean.getPrezzo() %>'>
    </div>
    <div class="form-group">
        <label for="edizione">Edizione:</label>
        <input type='text' id="edizione" name='edizione' value='<%= bean.getEdizione() %>'>
    </div>
    <div class="form-group">
        <label for="tipologia">Tipologia:</label>
        <input type='text' id="tipologia" name='tipologia' value='<%= bean.getTipologia() %>'>
    </div>
    <div class="form-group">
        <label for="min_gio">Numero di giocatori minimi:</label>
        <input type='number' id="min_gio" name='min_gio' value='<%= bean.getN_giocatori_min() %>'>
    </div>
    <div class="form-group">
        <label for="max_gio">Numero di giocatori massimi:</label>
        <input type='number' id="max_gio" name='max_gio' value='<%= bean.getN_giocatori_max() %>'>
    </div>
    <div class="form-group">
        <label for="descrizione">Descrizione:</label>
        <textarea rows='7' cols='100' id="descrizione" name='descrizione'><%= bean.getDescrizione() %></textarea>
    </div>
    <div class="button-group">
        <button type='button' onclick='showCopertinaInputs()'>Modifica Copertina</button>
        <button type='button' onclick='showImg2Inputs()'>Modifica Immagine 2</button>
    </div>
    <div id='copertinaInputs' class='form-group' style='display:none;'>
        <label for='imgCopertina'>Copertina:</label>
        <input type='file' id='imgCopertina' name='imgCopertina' accept='.jpeg, .jpg, .png'>
    </div>
    <div id='img2Inputs' class='form-group' style='display:none;'>
        <label for='img2'>Seconda Immagine:</label>
        <input type='file' id='img2' name='img2' accept='.jpeg, .jpg, .png'>
    </div>
    <div class="button-group">
        <input type='button' onclick='submitGameForm()' value='Invia'>
    </div>
</form>
