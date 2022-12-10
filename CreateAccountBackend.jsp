<%@ page import="java.sql.*" %>
<%@include file="Header.jsp" %>
  <%   
  String userId=request.getParameter("userId");
 
  String password=request.getParameter("password");
 
  String repassword=request.getParameter("repassword");
  //out.print(repassword);
  if(password.equals(repassword)){

  
  String type=request.getParameter("type");
  Connection con=null;
    Statement ins=null;
 


    try{

    Class.forName("oracle.jdbc.driver.OracleDriver");

    con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","SYSTEM","system");

    ins=con.createStatement();
    String sql1="insert into login values('"+userId+"','"+password+"','"+type+"')";
     
    ins.execute(sql1);

    con.close();
    }
    catch (Exception ex){
  
      session.setAttribute("message",ex.toString()+"\n Account  not Created");
    }%>
    <script>alert("Account Created");</script><%
    
   response.sendRedirect("Login.jsp");
  }
  else{
    %>
    <script>
      alert("password are not same");
    </script><%
  }


    %>