<%@ page import="Model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Lost</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
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
            letter-spacing: 2px;
            color: white;
            cursor: pointer;
            border-radius: 25px;
            width: 20%;
            height: 7%;
            font-weight: bolder;
            font-size: 17px;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="centered">
    <%
        User user = (User) session.getAttribute("user");
        out.println("<br><br><br><br>");
        out.println(" “A champion is afraid of losing. Everyone else is afraid of winning.” - Billie Jean King ");
        out.println("<br><br>");
        out.println("You are a winner, " + user.getUsername() + "! (you lost this game though)");
        out.println("<br><br>");

    %>
</div>
</body>
<div class="centered">
    <form action="LogOutServlet" method="get">
        <input type="submit" value="LOGOUT"/>
    </form>
</div>
</body>
</html>
