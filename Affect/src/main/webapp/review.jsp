<%@ page import="java.util.ArrayList" %>
<%@ page import="DAO.review_DAO" %>
<%@ page import="DTO.review_dto" %>
<!DOCTYPE html>
<html lang="en">

<style>
    .reviewContainer {
        margin-top: 15px;
        margin-bottom: 15px;
    }

    .inputArea {
        padding-top: 5px;
        border-top: 1px solid black;
    }

    #area {
        width: 100%;
    }

    #reviewAddBtn {
        width: 100%;
        border: none;
        background-color: black;
        color: white;
        border-radius: 5px;
    }
</style>

<body>
<div class="container reviewContainer">
    <%
        DAO.review_DAO reviewDao = new review_DAO();
        ArrayList<DTO.review_dto> reviewList = reviewDao.reviewList(Integer.parseInt(productNumber));

        int userNumber;
        if(user==null) userNumber=-1;
        else userNumber = user.getNumber();


        for(int i=0; i<reviewList.size(); i++){
            DTO.review_dto reviewObj = reviewList.get(i);
    %>
    <div class="row">
        <div class="col-xs-2">
            <%=reviewObj.getUserName()%>
        </div>
        <div class="col-xs-1">
            <%=reviewObj.getScore()%>
        </div>
        <div class="col-xs-7">
            <%=reviewObj.getReviewContent()%>
        </div>
        <div class="col-xs-2">
            <%=reviewObj.getReviewDate()%>
        </div>
    </div>
    <%
        }
    %>

    <form action="addReview.rev" method="post">
        <input type="hidden" name="userNumber_review" value="<%=userNumber%>">
        <input type="hidden" name="productNumber_review" value="<%=productNumber%>">
        <input type="hidden" name="category" value="<%=category%>">

        <%if(user==null){%>
        <div class="row inputArea">
            <div class="col-xs-1">
            </div>

            <div class="col-xs-9" style="font-weight: bold">
                Please login to write
            </div>
            <div class="col-xs-2">
                <input type="submit" value="OK" id="reviewAddBtn" disabled>
            </div>
        </div>
        <%}else{%>
        <div class="row inputArea">
            <div class="col-xs-2">
                <select name="score">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                </select>
            </div>

            <div class="col-xs-8">
                <textarea id="area" name="opinion" rows="1"></textarea>
            </div>
            <div class="col-xs-2">
                <input type="submit" value="OK" id="reviewAddBtn">
            </div>
        </div>
        <%}%>
    </form>
</div>
</body>

</html>