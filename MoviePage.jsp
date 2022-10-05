<%@include file="Header.jsp" %>
    <%@ page import="java.sql.*" %>
        <% session.setAttribute("type",session.getAttribute("type"));
            response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
            session.setAttribute("userId",session.getAttribute("userId")); %>
            <form method="GET" action="MovieDetail.jsp">
                <div class="container">
                    <div class="content-container">
                        <div class="featured-content"
                            style="background: linear-gradient(to bottom, rgba(0,0,0,0), #151515), url('img/doctor.jpg');">
                            <img class="featured-title" src="img/stlogo.png" alt="">
                            <p class="featured-desc">Doctor Strange teams up with a mysterious teenage girl from his
                                dreams who
                                can
                                travel across multiverses, to battle multiple threats, including other-universe versions
                                of
                                himself,
                                which threaten to wipe out millions across the multiverse.They seek help from Wanda the
                                Scarlet
                                Witch,
                                Wong and others.

                            </p>

                        </div>

                        <div class="movie-list-container">
                            <h1 class="movie-list-title">
                                <%=session.getAttribute("MovieCatagory")%>
                            </h1>
                            <div class="movie-list-wrapper">
                                <div class="movie-list">
                                    <% Connection con=null;
                                     Statement ins=null;
                                      ResultSet rs1;
                                       try{
                                        Class.forName("oracle.jdbc.driver.OracleDriver");
                                        con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","SYSTEM","System");
                                        ins=con.createStatement(); String
                                        str="select * from moviedetails where CATAGORY='"+session.getAttribute("MovieCatagory")+"'"; rs1=ins.executeQuery(str);
                                        while(rs1.next())
                                        {
                                             String title=rs1.getString(2); 
                                             %>

                                        <div class="movie-list-item">
                                            <img class="movie-list-item-img" src=<%=rs1.getString(1) %> alt="">
                                            <span class="movie-list-item-title">
                                                <%=title %>
                                            </span>

                                            <button type="submit" name="movieName" class="movie-list-item-button" value="<%=title%>">Open</button>
                                        </div>


                                        <%
                                        } 
                                        con.close();
                                         } 
                                         catch (Exception e)
                                         { 
                                            out.print(e);
                                             }
                                         %>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </form>