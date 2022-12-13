<!DOCTYPE html>
<html lang="en">

<head>
    <title>Admin Controls</title>
    <link rel="stylesheet" href="./style/styleform.css">
    <style>
        .likebox tr td a {
            margin-left: 30px;
            padding: 7px;
            /* width: 1500px !important; */

            background-color: #4dbf00;

            border-radius: 10px;
        }
    </style>

</head>

<body>
    <%@include file="Header.jsp" %>
        <% response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
            if(session.getAttribute("userId")==null || !(session.getAttribute("type").toString().equals("admin")) ) {
            response.sendRedirect("Login.jsp"); } 

             
            session.setAttribute("type",session.getAttribute("type"));
            if(session.getAttribute("message")!=null)
            {
                 String e=session.getAttribute("message").toString();
                  %>
            <input  type="hidden" id="expp" value="<%=e%>" />
            <script>
                var e = document.getElementById("expp").value;
                alert(e);
            </script>
            <% session.setAttribute("message", null); 
            }
             session.setAttribute("userId",session.getAttribute("userId"));%>
       
                <div class="loginform">
                <div class="likebox">
                        <table>
                            <tr>
                                <th></th>
                                <th></th>
                            </tr>
                            <tr>
                                <td>
                                    <a class="button" style="color: white;" href="DeleteMovies.jsp">Delete Movies</a>
                                </td>
                                <td>
                                    <a class="button" style="color: white;" href="AddMovies.jsp">Add Movies</a>

                                </td>
                            </tr>
                        </table>
                    </div>
                    <br><br>
                    <hr>
                    <br>
                <center>
                    <h1 style="margin: 40px 0px; ">Create New Admin</h1>
                </center>
                    <form method="post" action="CreateAccountBackend.jsp">
                        <table>
                            <tr>
                                <td>
                                    userId:
                                </td>
                                <td>
                                    <input type="text" class="textbox" name="userId" placeholder="enter your user id">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    password:
                                </td>
                                <td>
                                    <input type="password" class="textbox" name="password" placeholder="enter password">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Re enter password:
                                </td>
                                <td>
                                    <input type="password" name="repassword" class="textbox"
                                        placeholder="re enter password">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                 
                                        <input type="hidden" name="type" value="admin"> 
                          
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="submit" class="button" value="Create">

                                </td>
                                <td>
                                    <input type="reset" class="button" value="Reset">
                                </td>
                            </tr>



                        </table>
                    </form>
                    
                    
                </div>


</body>

</html>
 
 
   