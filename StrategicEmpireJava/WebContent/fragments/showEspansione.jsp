<%@ page import="it.unisa.bean.espansioneBean" %>
<%@ page import="java.util.Collection" %>

<% 
Collection<espansioneBean> espansioni = null;
if(request.getAttribute("pageType").equals("catalogo")){
	espansioni = (Collection<espansioneBean>) request.getAttribute("prodotti");
}else if(request.getAttribute("pageType").equals("AreaPersonale")){
	espansioni = (Collection<espansioneBean>) request.getAttribute("prodottiAP");
}
%>
<div class="row" id="allAccessories" style="margin-left: 3%; margin-right:3%;margin-top:2%;">
    <% if (espansioni != null && !espansioni.isEmpty()) { 
        for (espansioneBean bean : espansioni) { %>
            <div class="col-sm-3 mb-3" style="width: 25%;">
                <div class="card">
                <%if(request.getAttribute("pageType").equals("catalogo")){ %>
                <a class="no-underline card-link" href="DettagliControl?cod_espansione=<%= bean.getCod_espansione()%>&DES=3">
                <%} %>
                    <div class="card-body">
                        <img src="<%= bean.getImmagineCop() %>" class="card-img-top">
                        <h5 class="card-title"><%= bean.getNomeespansione() %></h5>
                        <p class="card-text">Prezzo: <%= bean.getPrezzo() %></p>
                        <%if(request.getAttribute("pageType").equals("AreaPersonale")) {%>
                        <button class="edit-Esp-button" data-esp-id="<%= bean.getCod_espansione() %>">Modifica</button>
                        <button class="del-Esp-button" data-esp-id="<%= bean.getCod_espansione() %>">Elimina</button>
                        <%}else if(request.getAttribute("pageType").equals("catalogo")){ %>
                        <a href="javascript:void(0);" data-cod-espansione="<%= bean.getCod_espansione()%>"
                                class="add-esp-to-cart">
                                <img src="IMMAGINI/carrelloICON.png" class="icon-carrello">
                            </a>
                                <script src="js/addToCart.js"></script>
                         <%} %>
                    </div>
                    <%if(request.getAttribute("pageType").equals("catalogo")){ %>
                </a>
                <%} %>
                </div>
            </div>
        <% } 
    } %>
</div>
