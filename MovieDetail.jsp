<%@ page import="java.sql.*" %>
    <%@include file="Header.jsp" %>
<html>
    <head>
         
    
        <style>
            body {
                color: #4dbf00;
                font-family: sans-serif;

            }

            .movielist {
                display: block;
                width: auto;
                margin-left:30% ;
                margin-right:30% ;
                font-size: 17px;
               
            }

            .movieimg {
                margin-top: 50px;
                width: 600px;
                height: 850px;

            }

            .movietitle {
                display: block;
                font-size: 20px;
                font-weight: bold;
                width: 100%;
               
                margin: 25px auto;
              
                color: #fbff00;
            }

            .moviedesc,
            .moviecomments {
                display: block;
                font-size: 20px;
                font-weight: bold;
                width: 100%;
          
                margin: 15px auto;

            }

            .moviecomments {
                position: relative;
                width: 250px;
                font-family: 'Times New Roman', Times, serif;
                height: 40px;
                display: inline-block;
                margin-top:0;
                font-size: 16px;
                background-color: #ffffff;
                padding: 5px 20px;
             
                color:  black;
                border: 1px solid black;
                border-radius: 9px;

            }

            table,
            tr {
             
                width: 100%;
                margin: auto;
            }

            
            textarea {
                outline:none;
                background-color: #d0e2bc;
                color: rgb(0, 0, 0);
                margin: 0;
                padding: 3px 10px;
                border: 1px solid red;
                border-radius: 5px;
                font-size: 17px;


            }
            .centered-div{
                text-align: center;
                
            }
            .hidden-delete-comment{
                display: inline;
                 float: right;
                 /* visibility: hidden; */
                 margin: 0 2px 5px auto;
                color: white;
                padding: 5px 10px;
                border-radius: 10px;
                border: none;
                outline: none;
                font-weight: bold;

            }
            .hidden-delete-comment:hover{
               
                 
                background-color: red;
          
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
                    <!-- <%=rs.getString(4)%> -->
                    <br>
                    <span ><a style="color: red !important; font-size:22px" href="./videos/video1.mp4">Click Here to Watch video</a></span>
                    <title><%= rs.getString(2) %></title>

                    <p class="moviedesc">
                        <%= rs.getString(3) %>
                    </p>

                </div>


                <% } %> <center><span class="movietitle">Comments<span></center>
                            <% rs2=ins.executeQuery(str2); while(rs2.next()){ 

                                
                                %>
                                    
                                <table class="movielist">
                                    <tr>
                                        <th style="text-align:left ;">
                                            <span style="font-weight:lighter ;margin-bottom:1px ; margin-top:8px ;display:inline-block;color:red;">
                                                <%= rs2.getString(1) %>
                                            </span>
                                        </th>  </tr>    <tr>
                                        <td>
                                            <span class="moviecomments" >
                                                <%= rs2.getString(3) %>
                                                
                                                <form action="DeleteCommentBackend.jsp">
                                                    <input type="hidden" name="deletecommentuserid" value="<%= rs2.getString(1) %>">
                                                    <input type="hidden" name="deletecomment" value="<%= rs2.getString(3) %>">
                                                    <% 
                                                
                                                    if(session.getAttribute("userId")!=null && rs2.getString(1).equals(session.getAttribute("userId"))){ %>
                                                <button class="hidden-delete-comment" type="submit">Delete</button> <% } %>
                                            </form>
                                            </span>
                                        </td></tr>
                                   

                                </table>

                                <% } session.setAttribute("title",movieTitle);
                                    session.setAttribute("userId",session.getAttribute("userId")); %>
                                    <div class="centered-div">
                                        <form method="post" action="AddCommentBackend.jsp">
                                            <table>
                                                <tr>

                                                    <td style="display: inline-block;" >
                                                        <textarea class="textarea" placeholder="Add your Comment here"
                                                            name="comment" rows="4" cols="40"></textarea>
                                                    </td>
                                                 
                                                    <td style="display: inline-block;" >
                                                      
                                                        <input class="button" style="display: inline-block;margin-left: 10px !important;" type="submit" value="Submit">


                                                    </td>
                                                </tr>

                                            </table>
                                        </form>

                                    </div>
                                    <% con.close(); } catch (Exception e){  
                                        

                                        }
                                        %>
  </html>