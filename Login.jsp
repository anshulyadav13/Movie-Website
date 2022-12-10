<!DOCTYPE html>
<html lang="en">

<head>

    <title>Login</title>
    <link rel="stylesheet" href="./style/styleform.css">
</head>

<body>
    <%@include file="Header.jsp" %>
    <%  
    if(session.getAttribute("message")!=null){
       String e=session.getAttribute("message").toString();
          %><input type="hidden" id="expp" value="<%=e%>" />
          <script>
              var e=document.getElementById("expp").value;
              alert(e);
              </script>
          <%}session.setAttribute("message", null);%>
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

</body>

</html>