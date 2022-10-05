 
<%@page import="java.sql.*"%>
<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
if(session.getAttribute("userId")==null || !(session.getAttribute("type").toString().equals("admin")))
{ response.sendRedirect("Login.jsp"); 
}else if(session.getAttribute("type").equals("admin")){
%>
<%session.setAttribute("type",session.getAttribute("type"));
String title=request.getParameter("moviename");
 
Connection con=null; 
   Statement ins=null; 
   
   try{
       
      Class.forName("oracle.jdbc.driver.OracleDriver");
         
       con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","SYSTEM","system");
      
       ins=con.createStatement(); 
        

       String str="delete from moviedetails where title='"+title+"'";
       out.print(str);

       ins.executeQuery(str);}
       catch(Exception ex){
         session.setAttribute("message",ex.toString()+"\n !!! NO Movie  Deleted");

       }
       response.sendRedirect("Admin.jsp");
      }        
%>