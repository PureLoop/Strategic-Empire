<%@ page import="it.unisa.bean.espansioneBean" %>
<%@ page import="java.util.Collection" %>

<% 
Collection<espansioneBean> espansioni = (Collection<espansioneBean>) request.getAttribute("prodottiAP");
%>
<div class="row" id="allAccessories" style="margin-left: 3%; margin-right:3%;margin-top:2%;">
    <% if (espansioni != null && !espansioni.isEmpty()) { 
        for (espansioneBean bean : espansioni) { %>
            <div class="col-sm-3 mb-3" style="width: 25%;">
                <div class="card">
                    <div class="card-body">
                        <img src="<%= bean.getImmagineCop() %>" class="card-img-top">
                        <h5 class="card-title"><%= bean.getNomeespansione() %></h5>
                        <p class="card-text">Prezzo: <%= bean.getPrezzo() %></p>
                        <button class="edit-Esp-button" data-esp-id="<%= bean.getCod_espansione() %>">Modifica</button>
                        <button class="del-Esp-button" data-esp-id="<%= bean.getCod_espansione() %>">Elimina</button>
                    </div>
                </div>
            </div>
        <% } 
    } %>
</div>
