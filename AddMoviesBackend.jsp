<%@page import="java.sql.*"%>
<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
     if(session.getAttribute("userId")==null || !(session.getAttribute("type").toString().equals("admin")))
         {
              response.sendRedirect("Login.jsp"); 
                 }
                 else if(session.getAttribute("type").equals("admin")){
      session.setAttribute("userId",session.getAttribute("userId"));
String URL=request.getParameter("URL").trim();
String title=request.getParameter("title").trim();
String discription=request.getParameter("discription").trim();
 
String catagory=request.getParameter("catagory").trim();
  Connection con=null;
    Statement ins=null;
  
    try{

    Class.forName("oracle.jdbc.driver.OracleDriver");

    con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","SYSTEM","system");

    ins=con.createStatement();
    String sql1="insert into  moviedetails  values('"+URL+"','"+title+"','"+discription+"','"+catagory+"')";
     out.print(sql1);
    ins.execute(sql1);

    con.close();
    }
    catch (Exception ex){
       session.setAttribute("message",ex.toString()+"\n Record not Inserted");   
      out.print(ex);
    } 
     
      response.sendRedirect("Admin.jsp");

  }
%>