<%@ page import="java.sql.*" %>
    <%@include file="Header.jsp" %>
<html>
    <head>
         
    
        <style>
            body {
                color: lightgray;
                font-family: sans-serif;

            }

            .movielist {
                display: block;
                width: 700px;
                margin: auto;
                font-size: 17px;
                text-align: center;
            }

            .movieimg {
                margin-top: 50px;
                width: 560px;
                height: 650px;

            }

            .movietitle {
                display: block;
                font-size: 20px;
                font-weight: bold;
                width: 100%;
                text-align: center;
                margin: auto;
                margin-top: 10px;
                color: goldenrod;
            }

            .moviedesc,
            .moviecomments {
                display: block;
                font-size: 20px;
                font-weight: bold;
                width: 100%;
                /* margin: auto ; */
                margin: 15px auto;

            }

            .moviecomments {
                position: relative;
                width: 250px;
                height: 40px;
                font-size: 16px;
                background-color: #ffffff;
                padding: 5px 15px;
                font-weight: lighter;
                color: rgb(10, 10, 10);
                border: 1px solid black;
                border-radius: 9px;

            }

            table,
            tr {
                /* border: 1px solid rgb(36, 35, 35);
                border-radius: 8px; */
                width: 100%;
                margin: auto;
            }

            /* table {
                border-collapse: collapse;
            } */
            textarea {

                background-color: #d0e2bc;
                color: rgb(0, 0, 0);
                margin: 0;
                border: 1px solid red;
                border-radius: 5px;
                font-size: 17px;


            }
        </style>
</head>


        <% String movieTitle="" ; session.setAttribute("type",session.getAttribute("type"));
            response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
          
    if(session.getAttribute("message")!=null){
       String e=session.getAttribute("message").toString();
          %>
          <input type="hidden" id="expp" value="<%=e%>" />
          <script>
              var e=document.getElementById("expp").value;
              alert(e);
              </script>
       <%  }
       session.setAttribute("message", null); 
              movieTitle=request.getParameter("movieName");
                if(movieTitle==null)
                {
                     movieTitle=session.getAttribute("title").toString();
                      }
                session.setAttribute("title",movieTitle);
                 Connection con=null; 
                 Statement ins=null; 
                 ResultSet rs,rs2;
                try{ Class.forName("oracle.jdbc.driver.OracleDriver");
                con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","SYSTEM","System");
                ins=con.createStatement();
                 String str="select * from moviedetails where title='" +movieTitle+"'";
                //out.print(str); 
                String str2="select * from moviecomments where title='" +movieTitle+"'";
                rs=ins.executeQuery(str); while(rs.next()){ %>

                <div class="movielist">
                    <img class="movieimg" src="<%=rs.getString(1) %>" alt="">
                    <span class="movietitle">
                        <%= rs.getString(2) %>
                    </span>
                    <title><%= rs.getString(2) %></title>

                    <p class="moviedesc">
                        <%= rs.getString(3) %>
                    </p>

                </div>


                <% } %> <span class="movietitle">Comments<span>
                            <% rs2=ins.executeQuery(str2); while(rs2.next()){ %>

                                <table class="movielist">
                                    <tr>
                                        <th>
                                            <span style="font-weight:lighter ;color: rgb(231, 231, 123);">
                                                <%= rs2.getString(1) %> :
                                            </span>
                                        </th>
                                        <th>
                                            <span class="moviecomments">
                                                <%= rs2.getString(3) %>
                                            </span>
                                        </th>
                                    </tr>

                                </table>

                                <% } session.setAttribute("title",movieTitle);
                                    session.setAttribute("userId",session.getAttribute("userId")); %>
                                    <div>
                                        <form method="post" action="AddCommentBackend.jsp">
                                            <table>
                                                <tr>

                                                    <td>
                                                        <textarea class="textarea" placeholder="Add your Comment here"
                                                            name="comment" rows="4" cols="40"></textarea>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <span>Add Comment:</span>
                                                        <input class="button" type="submit" value="Submit">


                                                    </td>
                                                </tr>

                                            </table>
                                        </form>

                                    </div>
                                    <% con.close(); } catch (Exception e){  
                                        

                                        }
                                        %>
  </html>