<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

    <!-- ViewPort -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Affect</title>
</head>

<style>
    .uploadContainer{
        padding-top: 10px;
        padding-bottom: 10px;
    }
    
    .lookInformation{
        margin: 0px;
        padding-top: 5px;
        font-weight: bold;
    }
    
    .lookInput{
        width: 100%;
        border: none;
        border-bottom: 1px solid;
    }
    
    #submitBtn{
        width: 100%;
        border: none;
        padding: 10px;
        background-color: #e0e0e0;
        color: black;
        font-weight: bold;
    }
    
    .lookImg{
        width: 100%;
    }
</style>

<script>
function setImage(event){
    var reader = new FileReader();
    reader.onload = function(event){
        var img = document.createElement("img");
        img.setAttribute("class","lookImg");
        img.setAttribute("src",event.target.result);
        document.getElementById("imageContainer").appendChild(img);
    };
    reader.readAsDataURL(event.target.files[0]);
}
</script>

<body>
<%@ include file="lookbookHeader.jsp" %>

    <div class="container uploadContainer">
        <form action="upload.lookbook" method="post" enctype="Multipart/form-data">
            <div class="row">
                <div class="col-sm-7" id="imageContainer">
                </div>
                
                
                <div class="col-sm-5">
                    <p class="lookInformation">HEADWEAR</p>
                    <input type="text" name="headwear" class="lookInput" placeholder="please enter the information" maxlength="15">
                    <p class="lookInformation">EYEWEAR</p>
                    <input type="text" name="eyewear" class="lookInput" placeholder="please enter the information" maxlength="15">
                    <p class="lookInformation">PIERCING</p>
                    <input type="text" name="piercing" class="lookInput" placeholder="please enter the information" maxlength="15">
                    <p class="lookInformation">NECKLACE</p>
                    <input type="text" name="necklace" class="lookInput" placeholder="please enter the information" maxlength="15">
                    <p class="lookInformation">OUTER</p>
                    <input type="text" name="outer" class="lookInput" placeholder="please enter the information" maxlength="15">
                    <p class="lookInformation">TOP</p>
                    <input type="text" name="top" class="lookInput" placeholder="please enter the information" maxlength="15">
                    <p class="lookInformation">BOTTOM</p>
                    <input type="text" name="bottom" class="lookInput" placeholder="please enter the information" maxlength="15">
                    <p class="lookInformation">SHOES</p>
                    <input type="text" name="shoes" class="lookInput" placeholder="please enter the information" maxlength="15">
                    <p class="lookInformation">ACC</p>
                    <input type="text" name="acc" class="lookInput" placeholder="please enter the information" maxlength="15">
                    <p class="lookInformation">ETC</p>
                    <input type="text" name="etc" class="lookInput" placeholder="please enter the information" maxlength="15">
                </div>
            </div>
            
            <div class="row">
                <div class="col-xs-12">
                    <input type="file" name="fileName" required onchange="setImage(event)">
                </div>
            </div>
            
            <div class="row">
                <div class="col-xs-12">
                    <input type="submit" value="SUBMIT" id="submitBtn">
                </div>
            </div>
        </form>
    </div>

<%@ include file="footer.jsp" %>
</body></html>