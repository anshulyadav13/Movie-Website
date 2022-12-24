<%@ page import="java.sql.*" %>
    <%@include file="Header.jsp" %>
 
 
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
                    <center><span class="movietitle"> &nbsp; &nbsp;    <%= rs.getString(2) %> </span></center>
                    <img class="movieimg" src="<%=rs.getString(1) %>" alt="">
                   
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
                              <center>      
                                <table class="movielist">
                                    <tr>
                                        <th style="text-align:left ;">
                                            <span style="font-weight:lighter ;margin-bottom:1px ; margin-top:8px ;display:inline-block;color:red;">
                                              <%= rs2.getString(1) %>
                                            </span>
                                        </th> <th></th> </tr>    <tr>
                                        <td>
                                            <span class="moviecomments" >
                                                <%= rs2.getString(3) %>
                                                
                                                  
                                            </span>
                                        </td>
                                        <td>
                                            <span>
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
                            </center>
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
 