<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        body {
            font-family: Proxima Nova;
            color: white;
            font-size: x-large;
            background-color: #191414;
        }

        .container {
            /*width: 20%;*/
            /*height: 20%;*/
            /*position: absolute;*/
            /*left: 37%;*/
            /*top: 20%;*/
            text-align: center;
            padding-top: 100px;
        }

        input,
        .btn {
            font-family: Proxima Nova;
            padding: 12px;
            border: none;
            margin: 10px 0;
            opacity: 0.85;
            display: inline-block;
            outline: none;
            font-weight: normal;
        }

        input:hover,
        .btn:hover {
            opacity: 1;
            background-color: #657478;
        }

        input[type=submit] {
            font-family: Proxima Nova;
            letter-spacing: 2px;
            background-color: #1DB954;
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
            border-radius: 5px;
            width: 20%;
            height: 6%;
            background-color: #373e42;
            color: white;
            text-align: center;
            font-size: 17px;
            margin-bottom: 2px;
            text-align: start;
            text-indent: 30px;
        }

        input[type=password] {
            border-radius: 5px;
            width: 20%;
            height: 6%;
            background-color: #373e42;
            color: white;
            text-align: center;
            font-size: 17px;
            margin-bottom: 2px;
            text-align: start;
            text-indent: 30px;
        }

        input[type=submit]:hover {
            background-color: #37d570;
        }

        ::placeholder {
            color: rgba(255, 255, 255, 0.71);
        }

        input:focus {
            background-color: #657478;
        }

    </style>
</head>
<body>
    <div class="container">
        <i class="material-icons" style="font-size: 50px;">face</i>
        <h3 style="font-size: 35px">Sign in to play</h3>
        <form action="LoginServlet" method="post">
            <input type="text" name="username" placeholder="username"> <BR>
            <input type="password" name="password" placeholder="password"> <BR>
            <input type="submit" value="LOG IN"/>
        </form>
    </div>
</body>
</html>