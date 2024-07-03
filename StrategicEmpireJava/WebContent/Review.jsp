<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
boolean visualizza = true;
List<RecensioneBean> recensioni = (List<RecensioneBean>) request.getAttribute("recensioni");


	RecensioneBean recensione = (RecensioneBean) request.getAttribute("recensione");
%>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.bean.RecensioneBean"%>
    <title>Recensioni dei Clienti</title>
    <%@ page import="java.text.SimpleDateFormat" %>
    
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }
        .container-review {
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
        }
        .review {
            flex: 0 0 30%;
            background-color: #f2f2f2;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
            position: relative;
        }
        .review .rating {
            color: #f39c12;
            font-size: 20px;
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }
        .review .rating .username {
            margin-left: 10px;
            color: black;
            font-size: 16px; 
        }
        .review .text {
            margin-top: 10px;
            font-size: 16px;
        }
        .date {
            position: absolute;
            bottom: 10px;
            left: 10px;
            font-size: 12px;
            color: #888;
        }
    </style>
</head>
<body>
    <div class="container-review">
    <% 
    if (recensioni != null && recensioni.size() != 0) { 
        Iterator<?> it = recensioni.iterator(); 
        int countReview = 0;
        while (it.hasNext()&&countReview<3) { 
        	countReview++;
            RecensioneBean r = (RecensioneBean) it.next(); 
    %>
        <div class="review">
            <div class="rating">
                <% int countStar = r.getValutazione();
                while(countStar!=0){ %>
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
 					 <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.56.56 0 0 0-.163-.505L1.71 6.745l4.052-.576a.53.53 0 0 0 .393-.288L8 2.223l1.847 3.658a.53.53 0 0 0 .393.288l4.052.575-2.906 2.77a.56.56 0 0 0-.163.506l.694 3.957-3.686-1.894a.5.5 0 0 0-.461 0z"/>
				</svg>
				<% countStar--;
				} %>
                <span class="username"><%=r.getUsername() %></span>
            </div>
            <div class="text">
                <p><%=r.getTitolo() %></p>
                <p><%=r.getDescrizione() %></p>
             </div>
            <div class="date">
        </div>
        </div>
       <%}} %>
    </div>
</body>
</html>
