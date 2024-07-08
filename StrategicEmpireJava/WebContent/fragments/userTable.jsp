<%@ page import="it.unisa.bean.User" %>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*"%>
<style>
    /* Stile per tabella responsive */
    .user-table {
        overflow-x: auto;
        white-space: nowrap;
    }
    
    /* Stile per centrare il messaggio nessun utente trovato */
    .text-center {
        text-align: center;
    }
    
    /* Stile per il pulsante di modifica ruolo */
    .update-role-button {
        margin-top: 5px;
    }
    
    /* Stile per il form di aggiornamento ruolo */
    .role-update-form {
        display: flex;
        align-items: center;
    }
    
    /* Regole di stile aggiuntive per rendere la tabella più leggibile */
    .table th, .table td {
        vertical-align: middle;
    }

    /* Media Queries per la reattività */
    @media (max-width: 768px) {
        .table thead {
            display: none;
        }

        .table, .table tbody, .table tr, .table td {
            display: block;
            width: 100%;
        }

        .table tr {
            margin-bottom: 15px;
        }

        .table td {
            text-align: right;
            padding-left: 50%;
            position: relative;
        }

        .table td::before {
            content: attr(data-label);
            position: absolute;
            left: 0;
            width: 50%;
            padding-left: 15px;
            font-weight: bold;
            text-align: left;
        }

        .update-role-button {
            width: 100%;
            margin-top: 10px;
        }

        .role-update-form {
            flex-direction: column;
            align-items: flex-start;
        }
    }
</style>

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
            <th>Modifica Ruolo</th>
        </tr>
    </thead>
    <tbody>
        <%
            Collection<User> userList = (Collection<User>) request.getAttribute("userList");
            if (userList != null && !userList.isEmpty()) {
                for (User user : userList) {
        %>
        <tr>
            <td data-label="Username"><%= user.getUsername() %></td>
            <td data-label="Nome"><%= user.getNome() %></td>
            <td data-label="Cognome"><%= user.getCognome() %></td>
            <td data-label="Email"><%= user.getEmail() %></td>
            <td data-label="Ruolo"><%= user.getRole() %></td>
            <td data-label="Indirizzo"><%= user.getIndirizzo() %></td>
            <td data-label="Numero Civico"><%= user.getncivico() %></td>
            <td data-label="Modifica Ruolo">
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
