<%--
  Created by IntelliJ IDEA.
  User: liqiw
  Date: 12/1/2018
  Time: 6:12 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="javax.swing.plaf.nimbus.State" %>
<%@ include file="getHashTag.jsp" %>
<%@ include file="../DBInfo.jsp" %>
<html>
<head>
    <link rel="stylesheet" type="text/css"
          href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons"/>
    <link rel="stylesheet" href="../static/css/material-kit.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
            integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
            crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="../static/js/material-kit.min.js"></script>
    <script src="../static/js/bootstrap-material-design.min.js"></script>
</head>
<body>
<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="../index.jsp">Home</a></li>
        <li class="breadcrumb-item active" aria-current="page">Query10</li>
    </ol>
</nav>
<div class="container-fluid">
    <h4>Insert new user to User Table</h4>
    <%
    String screenName = request.getParameter("screenName");
    if(screenName != null) {

        int numFollowing = Integer.parseInt(request.getParameter("numFollowing"));
        int numFollower = Integer.parseInt(request.getParameter("numFollower"));
        String name = request.getParameter("userName");
        String state = request.getParameter("state");
        String category = request.getParameter("category");
        String subCategory = request.getParameter("subCategory");

        String sqlQuery = "insert into user(screen_name, name, " +
                "sub_category, category, ofstate, " +
                "numFollowers, numFollowing)\n" +
                "values (?,?,?,?,?,?,?)";
        PreparedStatement pstm = conn.prepareStatement(sqlQuery);
        try {
            pstm.setString(1,screenName);
            pstm.setString(2,name);
            pstm.setString(3,subCategory);
            pstm.setString(4,category);
            pstm.setString(5,state);
            pstm.setInt(6,numFollower);
            pstm.setInt(7,numFollowing);
            pstm.executeUpdate();
            conn.commit();
            out.println("<div class=\"alert alert-success\" role=\"alert\"> " +
                    "Successfully inserted! User: "+ screenName +
                    "</div>");
        } catch (SQLException e) {
            out.println("<div class=\"alert alert-danger\" role=\"alert\"> " +
                    "Error:" + e.getLocalizedMessage() +
                    "</div>");
        }
    }

    %>
    <form method="post">
        <div class="card">
            <div class="card-body">
                <div class="form-group">
                    <label for="screenName" class="bmd-label-floating">Screen Name</label>
                    <input name="screenName" class="form-control" id="screenName">
                </div>
                <div class="form-group">
                    <label for="userName" class="bmd-label-floating">Name</label>
                    <input name="userName" class="form-control" id="userName">
                </div>
                <div class="form-group row">
                    <div class="col-4">
                        <label for="state">States</label>
                        <select id="state" name="state" class="form-control">
                            <%
                                Statement statement;
                                statement = conn.createStatement();
                                ResultSet states = statement.executeQuery("select distinct ofstate from user;\n");

                                while (states.next()) {
                                    out.println("<option value=" + states.getString(1) + ">" + states.getString(1) + "</option>");
                                }
                            %>
                        </select>
                    </div>
                    <div class="col-4">
                        <label for="category">Category</label>
                        <select id="category" name="category" class="form-control">
                            <%
                                ResultSet category = statement.executeQuery("select distinct category from user;\n");
                                String html = "";
                                while (category.next()) {
                                    html += "<option value=" + category.getString(1) + ">" + category.getString(1) + "</option>\n";
                                }
                                out.println(html);
                            %>
                        </select>
                    </div>
                    <div class="col-4">
                        <label for="category">Sub-Category</label>
                        <select id="subcategory" name="subCategory" class="form-control">
                            <%
                                ResultSet Subcategory = statement.executeQuery("select distinct sub_category from user;\n");
                                html = "";
                                while (Subcategory.next()) {
                                    html += "<option value=" + Subcategory.getString(1) + ">" + Subcategory.getString(1) + "</option>\n";
                                }
                                out.println(html);
                            %>
                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6">
                        <label for="numFollowing" class="bmd-label-floating">Number of following</label>
                        <input type="number" class="form-control" name="numFollowing" id="numFollowing">
                    </div>
                    <div class="col-6">
                        <label for="numFollower" class="bmd-label-floating">Number of follower</label>
                        <input type="number" class="form-control" name="numFollower" id="numFollower">
                    </div>
                </div>
            </div>
        </div>
        <button type="submit" class="btn btn-primary">Upload</button>
    </form>
    <script>
        $('button').click((e) =>{
            e.preventDefault();
            let screenName = $("#screenName").val();
            let numFollowing = $("#numFollowing").val();
            let numFollower = $("#numFollower").val();
            if(screenName === "" || screenName === null){
                alert("You need to input the screen name");
            } else{
                if(numFollower === ""){
                    $("#numFollower").val(0);
                }
                if(numFollowing === ""){
                    $("#numFollowing").val(0);
                }
                $("form").submit();
            }
        });
    </script>
    <script>
        if ( window.history.replaceState ) {
            window.history.replaceState( null, null, window.location.href );
        }
    </script>
</div>
</body>
</html>
