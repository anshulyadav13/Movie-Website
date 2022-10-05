<!DOCTYPE html>
<html lang="en">

<head>
    <link rel="stylesheet" href="style/style.css">
    <link
        href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&family=Sen:wght@400;700;800&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
    <title>Movies-Time</title>
</head>

<body>
    <% session.setAttribute("MovieCatagory","New Release"); %>
        <%@include file="MoviePage.jsp" %>
            <% if(session.getAttribute("message")!=null){ String e=session.getAttribute("message").toString(); %><input
                    type="hidden" id="expp" value="<%=e%>" />
                <script>
                    var e = document.getElementById("expp").value;
                    alert(e);
                </script>
                <%} session.setAttribute("message", null); %>

</body>

</html>