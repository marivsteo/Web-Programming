<%@ page import="Model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Playing</title>
    <style>
        body {
            font-family: Proxima Nova;
            color: white;
            font-size: x-large;
            background-color: #191414;
        }

        .centered {
            text-align: center;
            font-size: large;
        }

        input {
            font-family: Proxima Nova;
            padding: 12px;
            border: none;
            margin: 10px 0;
            opacity: 0.85;
            display: inline-block;
            outline: none;
        }

        input:hover {
            opacity: 1;
        }

        input[type=submit] {
            background-color: #1DB954;
            font-family: Proxima Nova;
            letter-spacing: 2px;
            color: white;
            cursor: pointer;
            border-radius: 25px;
            width: 20%;
            height: 7%;
            font-weight: bold;
            font-size: 17px;
            margin-top: 20px;
        }

        input[type=text] {
            border-radius: 25px;
            width: 20%;
            height: 7%;
            background-color: #373e42;
            color: white;
            text-align: center;
            font-size: 17px;
            margin-bottom: 2px;
            text-align: start;
            text-indent: 30px;
        }
    </style>
</head>
<body>
<div class="centered">
<%
    String board = (String) session.getAttribute("Board");
    User user = (User) session.getAttribute("user");
    int activePlayer = (Integer) session.getAttribute("player");
    out.println("<br><br><br><table style=margin-left:auto;margin-right:auto; width:50%; height: 50%;>");
    for(int i=0;i<3;i++) {
        out.println("<tr>");
        for (int j = 0; j < 3; j++) {
            out.println("<td style=width:20px; height:20px; font-size: 20px;>");
            out.println(board.charAt(i * 3 + j));
            out.println("</td>");
        }
        out.println("</tr>");
    }
    out.println("</table>");
    out.println("<br><br><br><br>");
    if( activePlayer == user.getPlayerNo())
    {
        out.println("Your turn! Move quick!");
    }
    else
    {
        out.println("Patience you must have, my young padawan (and refresh often)");
        out.println("<br><br>");
    }
%>
</div>

<div class="centered">
<form name="myForm" action="MoveServlet" onsubmit="return validateForm()" method="post">
    <input type="text" name="column" placeholder="column: 1 to 3"> <BR>
    <input type="text" name="row" placeholder="row: 1 to 3"> <BR>
    <input type="submit" value="MOVE/REFRESH"/>
</form>
</div>
</body>
</html>

<script>
    function validateForm() {
        var x = document.forms["myForm"]["column"].value;
        var y = document.forms["myForm"]["row"].value;
        if (x == "" && y == "")
            return true;
        if (isNaN(x) || x < 1 || x > 4 || isNaN(y) || y < 1 || y > 4) {
            return false;
        } else {
            return true;
        }
    }
</script>