<%@include file="Header.jsp" %>
    <% session.setAttribute("type",session.getAttribute("type"));
        session.setAttribute("userId",session.getAttribute("userId"));
        response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
                if(session.getAttribute("userId")==null || !(session.getAttribute("type").toString().equals("admin")))
                 {
                response.sendRedirect("Login.jsp"); 
                } 
                else if(session.getAttribute("type").equals("admin")){
                session.setAttribute("userId",session.getAttribute("userId"));
                }
         %>
        <!DOCTYPE html>
        <html lang="en">
           
        <head> 
        <title>Add Movies</title>
            <link rel="stylesheet" href="./style/styleform.css">
        </head>

        <body>
            <div class="loginform">
                <form method="post" action="AddMoviesBackend.jsp">
                    <table>
                        <tr>
                            <td>
                                URL:
                            </td>
                            <td>
                                <input type="text" class="textbox" name="URL" placeholder="enter URL of Image">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Title:
                            </td>
                            <td>
                                <input type="text" class="textbox" name="title" placeholder="enter movie Title">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                discription:
                            </td>
                            <td>
                                <input type="text" name="discription" class="textbox" placeholder="Movie Details ">
                            </td>
                        </tr>

                        <tr>
                            <td>
                                MovieCatagory:
                            </td>
                            <td>
                                <select name="catagory">
                                    <option selected>Select</option>
                                    <option value="New Release">New Release</option>
                                    <option value="TRENDING">TRENDING</option>
                                    <option value="ANIME">ANIME</option>
                                </select>
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