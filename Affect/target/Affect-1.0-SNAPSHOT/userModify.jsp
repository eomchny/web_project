<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Affect</title>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

    <!-- ViewPort -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!--AJAX-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

    <!--jQuery-->
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <title></title>
</head>

<style>
    body {
        background-color: black;
    }

    .row {
        text-align: center;
        color: white;
    }

    #logo{
        letter-spacing: 5px;
        font-size: 180%;
    }

    .notice{
        margin-top: 5%;
    }


    .information{
        margin-top: 5%;
    }

    input{
        background-color: black;
        border: none;
        border-bottom: 1px solid;
        margin-bottom: 10px;
        width: 40%;
    }

    #submit{
        background-color: white;
        color: black;
        margin-top: 15px;
        border-radius: 5px;
        padding: 3px;
    }
</style>

<body>
<div class="container">
    <div class="row notice">
        <p id="logo">AFFECT</p>
        アイディーとパスワードを正しく入力した後、修正したい情報を記入してください。<br>
        入力した情報に限って反映されます。<br>
        (アイディーが存在しない場合、アイディーとパスワードが正しくない場合は修正できません。)
    </div>

    <div class="row information">
        <form action="modify.user" method="post">
            <input type="text" name="id" placeholder="Account"><br>
            <input type="password" name="password" placeholder="Password" maxlength="20"><br>
            <br>

            <input type="text" name="name" placeholder="Name" maxlength="13"><br>
            <input type="text" name="mail" placeholder="Mail" maxlength="43"><br>
            <input type="password" name="newPassword" placeholder="New Password" maxlength="20" minlength="7"><br>

            <input type="submit" value="Modify" id="submit">
        </form>
    </div>
</div>
</body>

</html>