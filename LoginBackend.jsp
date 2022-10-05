<%@ page import="java.sql.*" %>
<%@include file="Header.jsp" %>
<style>
    *{
        color: azure;
    }
</style>
     <%
     String userId=request.getParameter("userId");
     String password=request.getParameter("password");
     Connection con=null; 
        Statement ins=null; 
       int flag=0;
         ResultSet rs;
        
        try{
            
           Class.forName("oracle.jdbc.driver.OracleDriver");
              
            con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","SYSTEM","system");
           
            ins=con.createStatement(); 
             
 
            String str="select type from login where userid='"+userId+"' and password='"+password+"'";
 
            rs=ins.executeQuery(str);
                 
                 rs.next();
                 String s=rs.getString(1);

                 if( s.equals("user")){
                  flag=1;
                    session.setAttribute("userId",userId);  
                    session.setAttribute("type","user");
                    response.sendRedirect("index.jsp") ;

                    
                 }
                 else if( s.equals("admin")){
                    flag=1;
                    
                    session.setAttribute("userId",userId); 
                    session.setAttribute("type","admin");
                     
                    response.sendRedirect("Admin.jsp") ;
                              
                 }
              
            con.close();
        }
        catch (Exception ex){
            session.setAttribute("message" , "\n !!!!  Wrong ID and Password ");
         
        }
        if(flag==0){

            response.sendRedirect("Login.jsp");
        }

 %>
