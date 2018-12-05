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
<%@ include file="../DBInfo.jsp" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../static/css/material-kit.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
            integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
            integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
            crossorigin="anonymous"></script>
</head>
<body>
<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="../index.jsp">Home</a></li>
        <li class="breadcrumb-item"><a href="query6.jsp">Q19</a></li>
        <li class="breadcrumb-item active" aria-current="page">Result</li>
    </ol>
</nav>
<table class="table">
    <thead>
    <tr>
        <th scope="col">#</th>
        <th scope="col">From User</th>
        <th scope="col">To User</th>
    </tr>
    </thead>
    <tbody>
    <%
        int year = Integer.parseInt(request.getParameter("year"));
        int month = Integer.parseInt(request.getParameter("month"));
        String category = request.getParameter("category");
        int number = Integer.parseInt(request.getParameter("numOfUsers"));

        //Make connection
        PreparedStatement stmt;

        String sqlQuery = "select u.screen_name,m.screen_name from tweets\n" +
                "INNER join tagged t on tweets.tid = t.tid\n" +
                "INNER join user u on tweets.posting_user = u.screen_name\n" +
                "INNER join mentioned m on tweets.tid = m.tid\n" +
                "where month(posted)=? and year(posted)=? and category=? limit ?;";
        stmt = conn.prepareStatement(sqlQuery);
        stmt.setInt(1, month);
        stmt.setInt(2, year);
        stmt.setString(3, category);
        stmt.setInt(4, number);
        rs = stmt.executeQuery();

        int i = 1;
        //print
        while (rs.next()) {
            out.println("<tr>");
            out.println("<th scope='row'>" + i + "</th>");
            out.println("<td>" + rs.getString(1) + "</td>");
            out.println("<td>" + rs.getString(2) + "</td>");
            out.println("</tr>");
            i += 1;
        }

    %>
    </tbody>
</table>
</body>
</html>