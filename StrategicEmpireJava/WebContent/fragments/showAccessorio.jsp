<%@ page import="it.unisa.bean.AccessorioBean" %>
<%@ page import="java.util.Collection" %>

<% 
Collection<AccessorioBean> accessori = (Collection<AccessorioBean>) request.getAttribute("prodottiAP");
%>
<div class="row" id="allAccessories" style="margin-left: 3%; margin-right:3%;margin-top:2%;">
    <% if (accessori != null && !accessori.isEmpty()) { 
        for (AccessorioBean bean : accessori) { %>
            <div class="col-sm-3 mb-3" style="width: 25%;">
                <div class="card">
                    <div class="card-body">
                        <img src="<%= bean.getImmagineCop() %>" class="card-img-top">
                        <h5 class="card-title"><%= bean.getNomeaccessorio() %></h5>
                        <p class="card-text">Prezzo: <%= bean.getPrezzo() %></p>
                        <button class="edit-Acc-button" data-acc-id="<%= bean.getCod_Accessorio() %>">Modifica</button>
                        <button class="del-Acc-button" data-acc-id="<%= bean.getCod_Accessorio() %>">Elimina</button>
                    </div>
                </div>
            </div>
        <% } 
    } %>
</div>
