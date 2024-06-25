<%@ page import="it.unisa.espansioneBean" %>
<%
espansioneBean bean = (espansioneBean) request.getAttribute("bean");
%>
<link rel="stylesheet" href="css/modForm.css">
<form id='ModifyEspForm' action='updateEspansione' method='POST' enctype='multipart/form-data' class='form-container'>
    <div class="form-group">
        <input type='hidden' name='espId' value='<%= bean.getCod_espansione() %>'>
    </div>
    <div class="form-group">
        <label for="codice">Codice:</label>
        <input type='text' id="codice" name='codice' value='<%= bean.getCod_espansione() %>'>
    </div>
    <div class="form-group">
        <label for="nome">Nome:</label>
        <input type='text' id="nome" name='nome' value='<%= bean.getNomeespansione() %>'>
    </div>
    <div class="form-group">
        <label for="prezzo">Prezzo:</label>
        <input type='number' step='0.01' id="prezzo" name='prezzo' value='<%= bean.getPrezzo() %>'>
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
        <input type='button' onclick='submitEspForm()' value='Invia'>
    </div>
</form>
