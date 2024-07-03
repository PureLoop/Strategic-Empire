<%@ page import="it.unisa.bean.AccessorioBean" %>
<%@ page import="java.util.Collection" %>

<% 
Collection<AccessorioBean> accessori = null;
if(request.getAttribute("pageType").equals("catalogo")){
	accessori = (Collection<AccessorioBean>) request.getAttribute("prodotti");
}else if(request.getAttribute("pageType").equals("AreaPersonale")){
	accessori = (Collection<AccessorioBean>) request.getAttribute("prodottiAP");
}
%>
<div class="row" id="allAccessories" style="margin-left: 3%; margin-right:3%;margin-top:2%;">
    <% if (accessori != null && !accessori.isEmpty()) { 
        for (AccessorioBean bean : accessori) { %>
            <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                <div class="card">
                <%if(request.getAttribute("pageType").equals("catalogo")) {%>
                <a class="no-underline card-link" href="DettagliControl?cod_accessorio=<%= bean.getCod_Accessorio()%>&DES=2">
                 <%} %>
                    <div class="card-body">
                        <img src="<%= bean.getImmagineCop() %>" class="card-img-top">
                        <h5 class="card-title"><%= bean.getNomeaccessorio() %></h5>
                        <p class="card-text">Prezzo: <%= bean.getPrezzo() %></p>
                        <%if(request.getAttribute("pageType").equals("AreaPersonale")) {%>
                        <button class="edit-Acc-button" data-acc-id="<%= bean.getCod_Accessorio() %>">Modifica</button>
                        <button class="del-Acc-button" data-acc-id="<%= bean.getCod_Accessorio() %>">Elimina</button>
                        <%}else if(request.getAttribute("pageType").equals("catalogo")) {%>
                        <a href="javascript:void(0);" data-cod-accessorio="<%= bean.getCod_Accessorio()%>"
                                class="add-acc-to-cart">
                                <img src="IMMAGINI/carrelloICON.png" class="icon-carrello">
                            </a>
                             <script src="js/addToCart.js"></script>
                        <%}%>
                    </div>
                    <%if(request.getAttribute("pageType").equals("catalogo")){ %>
                </a>
                <%} %>
                </div>
            </div>
        <% } 
    } %>
</div>
