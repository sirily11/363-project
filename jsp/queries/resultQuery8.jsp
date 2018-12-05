<%--
  Created by IntelliJ IDEA.
  User: liqiw
  Date: 12/1/2018
  Time: 6:12 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ include file="../DBInfo.jsp"%>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../static/css/material-kit.min.css" >
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</head>
<body>
<style>

</style>
<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="../index.jsp">Home</a></li>
        <li class="breadcrumb-item"><a href="query8.jsp">Q22</a></li>
        <li class="breadcrumb-item active" aria-current="page">Result</li>
    </ol>
</nav>
<div class="container">
    <%
        int year = Integer.parseInt(request.getParameter("year"));
        int month = Integer.parseInt(request.getParameter("month"));
        String categoryP = request.getParameter("category-p");
        String categoryM = request.getParameter("category-m");
        int number = Integer.parseInt(request.getParameter("numOfUsers"));

        //Make connection
        PreparedStatement stmt;

        String sqlQuery ="select textbody,m.screen_name as mentioned,u.screen_name as posting from tweets\n" +
                "   INNER join user u on tweets.posting_user = u.screen_name\n" +
                "   INNER join (select tid,m2.screen_name,u2.category from user u2\n" +
                "                inner join mentioned m2 on u2.screen_name = m2.screen_name\n" +
                "                where u2.category=?\n" +
                "               ) as m on tweets.tid = m.tid\n" +
                "where month(posted)=? and year(posted)=? and u.category=?\n " +
                "limit ?";
        stmt = conn.prepareStatement(sqlQuery);
        stmt.setString(1,categoryM);
        stmt.setInt(2,month);
        stmt.setInt(3,year);
        stmt.setString(4,categoryP);
        stmt.setInt(5,number);
        rs = stmt.executeQuery();
        int i = 0;
        //print
        while (rs.next()){
            String textbody = rs.getString(1);
            String mUser = rs.getString(2);
            String pUser = rs.getString(3);
            if(i % 2 == 0){
                out.println("<span>" + (i+1) + "</span>");
                out.println("<div class='card text-white bg-info col-md-8'>");
                out.println("<div class='card-body'>");
                out.println("<h4 class='card-title'>" + textbody + "</h4>");
                out.println("<div class='card-stats'> From: " + pUser + "<br> Mentioned: " + mUser + "</div>");
                out.println("</div>");
                out.println("</div>");
            }else{
                out.println("<span>" + (i+1) + "</span>");
                out.println("<div class='card col-md-8 offset-md-4'>");
                out.println("<div class='card-body'>");
                out.println("<h4 class='card-title'>" + textbody + "</h4>");
                out.println("<div class='card-stats'> From: " + pUser + "<br> Mentioned: " + mUser + "</div>");
                out.println("</div>");
                out.println("</div>");
            }
            i += 1;

        }
    %>
</div>
</body>
</html>