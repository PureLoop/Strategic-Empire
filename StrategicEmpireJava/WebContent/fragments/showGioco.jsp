<%@ page import="it.unisa.GiocoBean" %>
<%@ page import="java.util.Collection" %>

<% 
Collection<GiocoBean> giochi = (Collection<GiocoBean>) request.getAttribute("prodottiAP");
%>
<div class="row" id="allGames" style="margin-left: 3%; margin-right:3%;margin-top:2%;">
    <% if (giochi != null && !giochi.isEmpty()) { 
        for (GiocoBean bean : giochi) { %>
            <div class="col-sm-3 mb-3" style="width: 25%;">
                <div class="card">
                    <div class="card-body">
                        <img src="<%= bean.getImmagineCop() %>" class="card-img-top">
                        <h5 class="card-title"><%= bean.getNomegioco() %></h5>
                        <p class="card-text">Prezzo: <%= bean.getPrezzo() %></p>
                        <button class="edit-Game-button" data-game-id="<%= bean.getCod_Gioco() %>">Modifica</button>
                        <button class="del-Gioco-button" data-game-id="<%= bean.getCod_Gioco() %>">Elimina</button>
                    </div>
                </div>
            </div>
        <% } 
    } %>
</div>
