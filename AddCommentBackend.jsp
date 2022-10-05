<%@ page import="java.sql.*" %>
 <%@include file="Header.jsp" %>
<%

response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
if(session.getAttribute("userId")==null)
{ response.sendRedirect("Login.jsp"); 
}else{
 session.setAttribute("type",session.getAttribute("type"));
 String comment=request.getParameter("comment");
  
  Connection con=null;
Statement ins=null;
 ResultSet rs,rs2;
  try{ Class.forName("oracle.jdbc.driver.OracleDriver");
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","SYSTEM","System");
ins=con.createStatement();

String sql="insert into moviecomments values('"+session.getAttribute("userId")+"','"+session.getAttribute("title") +"','"+comment+"')"; 
ins.executeQuery(sql); 

%>
<input type="hidden" name="movieName" value="<%=session.getAttribute("title") %>">
<%
con.close(); }
 catch (Exception ex){  
    out.print(ex);
    session.setAttribute("message",ex.toString()+"\n Record not Inserted");

    }
    session.setAttribute("userId",session.getAttribute("userId"));  
session.setAttribute("title",session.getAttribute("title"));
    response.sendRedirect("MovieDetail.jsp");

}
%>