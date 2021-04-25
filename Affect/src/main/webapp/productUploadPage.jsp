<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="productInsert.product" method="post" enctype="multipart/form-data">
    file: <input type="file" name="file"><br>

    name : <input type="text" name="productName"> <br>
    price : <input type="text" name="productPrice"> <br>

    category : <select name="category">
                    <option value="top">top</option>
                    <option value="bottom">bottom</option>
                    <option value="headwear">headwear</option>
                    <option value="acc">acc</option>
                    <option value="shoes">shoes</option>
                    <option value="etc">etc</option>
            </select>


    <input type="submit" value="product upload">
</form>
</body>
</html>