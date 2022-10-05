<%@include file="Header.jsp" %>

<% 
  session.invalidate();  
 response.sendRedirect("index.jsp");
%>