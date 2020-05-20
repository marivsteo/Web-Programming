<%@ page import="Model.User" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.Enumeration" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Waiting room</title>
    <style>
        body {
            font-family: Proxima Nova;
            color: white;
            font-size: x-large;
            background-color: #191414;
        }

        .centered {
            text-align: center;
        }

        input[type=submit] {
            font-family: Proxima Nova;
            letter-spacing: 2px;
            padding: 12px;
            border: none;
            margin: 10px 0;
            opacity: 0.85;
            display: inline-block;
            outline: none;
        }

        input[type=submit]:hover {
            opacity: 1;
        }

        input[type=submit] {
            background-color: #1DB954;
            color: white;
            cursor: pointer;
            border-radius: 25px;
            width: 20%;
            height: 10%;
            font-weight: bold;
            font-size: 17px;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="centered">
<%
    User user = (User) session.getAttribute("user");
    if (user.getPlayerNo()==0) {
        boolean ok=true;
        out.println("<br><br><br><br>");
        out.println("Good day to you, " + user.getUsername()+". Finding a worthy opponent...");
        out.println("<br><br>");

    }
    else if(user.getPlayerNo()==1)
    {
        out.println("<br><br><br><br>");
        out.println("START THE GAME NOW!!!");
        out.println("<br><br>");
    }
    else
    {
        out.println("<br><br><br><br>");
        out.println("This is embarrassing, " + user.getUsername() + ". You've come third in a two player event :(");
        out.println("<br><br>");

    }
%>
</div>
<div class="centered">
<form action="StartGameServlet" method="get">
    <input type="submit" value="START GAME"/>
</form>
<form action="LogOutServlet" method="get">
    <input type="submit" value="LOGOUT"/>
</form>
</div>
</body>
</html>