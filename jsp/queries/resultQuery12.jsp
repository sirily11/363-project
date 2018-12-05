<%--
  Created by IntelliJ IDEA.
  User: liqiwei
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
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>\
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
          rel="stylesheet">
</head>
<body>
<style>

</style>
<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="../index.jsp">Home</a></li>
        <li class="breadcrumb-item"><a href="query12.jsp">Q12</a></li>
        <li class="breadcrumb-item active" aria-current="page">Result</li>
    </ol>
</nav>
<div class="container">
    <%
        int year = Integer.parseInt(request.getParameter("year"));
        int month = Integer.parseInt(request.getParameter("month"));
        String state = request.getParameter("state");
        int number = Integer.parseInt(request.getParameter("numOfUsers"));

        //Make connection
        PreparedStatement stmt;

        String sqlQuery ="select tweets.textbody,t.hastagname,u.screen_name,retweet_count from tweets\n" +
                "   INNER join tagged t on tweets.tid = t.tid\n" +
                "   INNER join user u on tweets.posting_user = u.screen_name\n" +
                "where month(posted)=? and year(posted)=? and ofstate=?\n" +
                "order by retweet_count desc\n" +
                "LIMIT ?;";
        stmt = conn.prepareStatement(sqlQuery);
        stmt.setInt(1,month);
        stmt.setInt(2,year);
        stmt.setString(3,state);
        stmt.setInt(4,number);
        rs = stmt.executeQuery();
        int i = 0;
        //print
        while (rs.next()){
            String textbody = rs.getString(1);
            String hashtag = rs.getString(2);
            String pUser = rs.getString(3);
            int retweetCount = rs.getInt(4);
            if(i % 2 == 0){
                out.println("<span>" + (i+1) + "</span>");
                out.println("<div class='card text-white bg-info col-md-8'>");
                out.println("<div class='card-body'>");
                out.println("<h5 class='card-category card-category-social'> #" + hashtag + " </h5>");
                out.println("<h4 class='card-title'>" + textbody + "</h4>");
                out.println("<div class='card-stats'> From: " + pUser);
                out.println("<div class='stats ml-auto'> Retweet:");
                out.println("<i class=\"material-icons\">share</i>" + retweetCount);
                out.println("</div>");
                out.println("</div>");
                out.println("</div>");
                out.println("</div>");
            }else{
                out.println("<span>" + (i+1) + "</span>");
                out.println("<div class='card col-md-8 offset-4'>");
                out.println("<div class='card-body'>");
                out.println("<h5 class='card-category card-category-social'> #" + hashtag + " </h5>");
                out.println("<h4 class='card-title'>" + textbody + "</h4>");
                out.println("<div class='card-stats'> From: " + pUser);
                out.println("<div class='stats ml-auto'> Retweet:");
                out.println("<i class=\"material-icons\">share</i>" + retweetCount);
                out.println("</div>");
                out.println("</div>");
                out.println("</div>");
                out.println("</div>");
            }
            i += 1;

        }
    %>
</div>
</body>
</html>