<!DOCTYPE html>
<html lang="en">

<head>
    <title>Delete Movies</title>
    <style>
        .movietable {
            width: 1200px;
            margin-left: 100px;
        }

        .movietable table {
            margin-top: 30px;
            color: white;
            border: 3px solid rgb(70, 53, 53);
        }

        .movietable table tr td,
        .movietable table tr th {
            border: 1px solid rgb(255, 250, 250);
        }

        a:hover {
            color: red !important;

        }

        .movieTitle {
            color: green !important;
        }

        .movieURL {
            color: rgb(76, 79, 240);
        }
    </style>

</head>

<body>
    <%@include file="Header.jsp" %>
        <%@page import="java.sql.*" %>
            <%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
                if(session.getAttribute("userId")==null || !(session.getAttribute("type").toString().equals("admin")))
                 {
                response.sendRedirect("Login.jsp"); 
                }else if(session.getAttribute("type").equals("admin")){
                session.setAttribute("type",session.getAttribute("type"));
                 %>
                <div class="movietable">
                    <table>
                        <caption>Movie Table </caption>
                        <tr>
                            <!-- <th>URL</th> -->
                            <th>TITLE</th>
                            <th>DISCRIPTION</th>

                            <th>CATAGORY</th>
                            <th>OPERATION</th>
                        </tr>
                        <% Connection con=null; Statement ins=null; ResultSet rs; try{
                            Class.forName("oracle.jdbc.driver.OracleDriver");
                            con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","SYSTEM","system");
                            ins=con.createStatement(); String str="select * from moviedetails" ;
                            rs=ins.executeQuery(str); while(rs.next()){ %>
                            <tr>
                                <!-- <td class="movieTitle">
                                    <%=rs.getString(1)%>
                                </td> -->

                                <td class="movieTitle">
                                    <%=rs.getString(2)%>
                                </td>
                                <td>
                                    <%=rs.getString(3)%>
                                </td>
                                <td>
                                    <%=rs.getString(4)%>
                                </td>

                                <td>
                                    <form method="get" action="DeleteMoviesBackend.jsp">
                                        <button class="button" type="submit" name="moviename"
                                            value="<%=rs.getString(2)%>">Delete</button>
                                    </form>
                                </td>
                            </tr>
                            <%} con.close();
                         }
                         catch(Exception ex)
                         {
                             out.print(ex); 
                            }
                         }
                          %>
                    </table>
                </div>
</body>

</html>