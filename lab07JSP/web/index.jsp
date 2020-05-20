<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>X/O</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
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
      /*margin-left: auto;*/
      /*margin-right: auto;*/
      /*top: 20%;*/
      text-align: center;
      padding-top: 200px;
    }

    button {
      font-family: Proxima Nova;
      padding: 12px;
      border: none;
      margin: 10px 0;
      opacity: 0.85;
      display: inline-block;
      outline: none;
    }

    button:hover {
      opacity: 1;
      font-size: 18px;
    }

    button {
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

  </style>
</head>
<body>
  <div class="container">
    <i class="material-icons" style="font-size: 100px;">local_dining</i>
    <i class="material-icons" style="font-size: 100px;">radio_button_unchecked</i>
    <br>
    <button type="button" onclick="location.href='login.jsp'">TO LOGIN</button>
  </div>
</body>
</html>
