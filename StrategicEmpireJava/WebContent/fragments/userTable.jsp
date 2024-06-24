<%@ page import="it.unisa.User" %>
<%@ page contentType="text/html; charset=UTF-8"
	import="java.util.*"%>
<table class="table table-bordered table-striped user-table">
    <thead>
        <tr>
            <th>Username</th>
            <th>Nome</th>
            <th>Cognome</th>
            <th>Email</th>
            <th>Ruolo</th>
            <th>Indirizzo</th>
            <th>Numero Civico</th>
            <th>Modifica Ruolo</th> <!-- Aggiunta nuova colonna per azioni -->
        </tr>
    </thead>
    <tbody>
        <%
            Collection<User> userList = (Collection<User>) request.getAttribute("userList");
            if (userList != null) {
                for (User user : userList) {
        %>
        <tr>
            <td><%= user.getUsername() %></td>
            <td><%= user.getNome() %></td>
            <td><%= user.getCognome() %></td>
            <td><%= user.getEmail() %></td>
            <td><%= user.getRole() %></td>
            <td><%= user.getIndirizzo() %></td>
            <td><%= user.getncivico() %></td>
            <td>
                <form class="role-update-form" method="POST" data-username="<%= user.getUsername() %>">
                    <select name="role" class="form-select">
                        <option value="amministratore">Amministratore</option>
                        <option value="cliente">Cliente</option>
                    </select>
                    <button type="button" class="btn btn-sm btn-primary update-role-button">Invia</button>
                </form>
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="8" class="text-center">Nessun utente trovato</td>
        </tr>
        <%
            }
        %>
    </tbody>
</table>
