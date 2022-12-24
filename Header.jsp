<!DOCTYPE html>
<html lang="en">

<head>
    <link rel="stylesheet" href="./style/style.css">
    <link rel="stylesheet" type="text/css" href="./style/styleform.css">
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
                            <li class="menu-list-item active home"><a href="index.jsp">Home</a></li>

                            <li class="menu-list-item anime"><a href="Anime.jsp">Anime</a></li>

                            <li class="menu-list-item trends"><a href="Trends.jsp">Trends</a></li>
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
                                <span class="login"  id="login-button">Log In</span>
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
            <!-- <div class="login-box "> -->
                <div class="login-box-main toggleit" id="toggle-it">
                   
                        <div class="loginform">
                            <form method="post" action="LoginBackend.jsp">
                                <h2 style="width: 145px;margin:auto">Log IN</h3> <br><br>
                                    <table>
                
                
                                        <tr>
                                            <th>
                                                User Id:
                                                </td>
                                            <th>
                                                <input class="textbox" placeholder="userid" type="text" name="userId">
                                            </th>
                                        </tr>
                                        <tr>
                                            <th>
                                                Password:
                                                </td>
                                            <th>
                                                <input type="password" placeholder="password" class="textbox" name="password">
                                            </th>
                                        </tr>
                                        <tr>
                                            <th>
                                                <input class="button" type="submit" value="Login">
                                                </td>
                                            <th>
                                                <input type="reset" class="button" name="Reset">
                                            </th>
                                        </tr>
                                        <tr>
                                            <td><br>
                                            </td>
                                        </tr>
                                    </table>
                                    <a class="cereate_acc_text"href="RegisterUser.jsp"> New User Create Account </a>
                
                
                
                
                            </form>
                </div>
                </div>

            <!-- </div> -->
            <script>
                loginButton=document.getElementById("login-button");
                toggleIt=document.getElementById("toggle-it");
                loginButton.addEventListener("click",login);
                function login(){
                    toggleIt.classList.toggle("toggleit");
                }
            </script>

            
</body>

</html>