<!DOCTYPE html>
<html lang="en">

<head>
    <link rel="stylesheet" href="style/style.css">
    <link
        href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&family=Sen:wght@400;700;800&display=swap"
        rel="stylesheet">

    <link rel="preconnect" href="https://fonts.googleapis.com">

    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@300&display=swap" rel="stylesheet">

    
</head>

<body>
    <%@page import="java.sql.*" %>
        <%@ page import=" java.util.* " %>
            <div class="navbar">
                <div class="navbar-container">


                    <div class="logo-container">
                        <a href="index.jsp">
                            <h1 class="logo">Movies<sup style="font-size:9px; color: red;">Time</sup></h1>
                        </a>
                    </div>
                    <div class="menu-container">
                        <ul class="menu-list">
                            <li class="menu-list-item active"><a href="index.jsp">Home</a></li>

                            <li class="menu-list-item"><a href="Anime.jsp">Anime</a></li>

                            <li class="menu-list-item"><a href="Trends.jsp">Trends</a></li>
                            <% session.setAttribute("type",session.getAttribute("type"));
                                if(session.getAttribute("userId")==null || session.getAttribute("type")==null)
                                 {} 
                                 else
                                if(session.getAttribute("type").equals("admin")){ %>

                                <li class="menu-list-item"> <a href="Admin.jsp">Admin Controls</a></li>
                                <% }%>
                        </ul>
                    </div>
                    <div class="profile-container">



                        <div class="profile-text-container">
                            <% if((String)session.getAttribute("userId")==null)
                             { 
                                %> 
                                <span class="login"><a href="Login.jsp">Log In</a></span>
                                <% } 
                                else{
                                    %>

                                    <span style="color: rgb(4, 238, 255);">
                                        <%= (String)session.getAttribute("userId")%>
                                    </span>&nbsp;
                                    <span class="logout"><a href="Logout.jsp">Log Out</a></span>
                                    <%
                                    } 
                                    %>
                        </div>
                    </div>
                </div>
            </div>
</body>

</html>