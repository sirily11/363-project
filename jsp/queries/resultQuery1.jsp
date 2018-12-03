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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</head>
<body>
<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="../index.jsp">Home</a></li>
        <li class="breadcrumb-item"><a href="query1.jsp">Query1</a></li>
        <li class="breadcrumb-item active" aria-current="page">Result</li>
    </ol>
</nav>
<table class="table table-bordered">
    <thead>
    <tr>
        <th scope="col">#</th>
        <th scope="col">Hash Tag Name</th>
        <th scope="col">Total number</th>
        <th scope="col">States</th>
    </tr>
    </thead>
    <tbody>
    <%
        int number = Integer.parseInt(request.getParameter("numOfUsers"));
        //Make connection
        PreparedStatement stmt;

        String sqlQuery ="SELECT hastagname,count(hastagname) as number FROM (\n" +
                "  select distinct hastagname,ofstate from tweets\n" +
                "    INNER join tagged t on tweets.tid = t.tid\n" +
                "    INNER join user u on tweets.posting_user = u.screen_name\n" +
                "  ) as table1\n" +
                "group by hastagname\n" +
                "order by number desc\n" +
                "LIMIT ?;";
        stmt = conn.prepareStatement(sqlQuery);
        stmt.setInt(1,number);
        rs = stmt.executeQuery();

        int i = 1;
        //print
        while (rs.next()){
            stmt = conn.prepareStatement("select distinct ofstate from tweets\n" +
                    "  INNER join tagged t on tweets.tid = t.tid\n" +
                    "  INNER join user u on tweets.posting_user = u.screen_name\n" +
                    "where hastagname=?;");
            stmt.setString(1,rs.getString(1));
            ResultSet rs2 = stmt.executeQuery();
            String result = "";

            out.println("<tr>");
            out.println("<th scope='row'>"+i+"</th>");
            out.println("<td>" + rs.getString(1) + "</td>");
            out.println("<td>" + rs.getInt(2) + "</td>");

            while (rs2.next()){
                result += " " + rs2.getString(1);
            }
            out.println("<td>" + result + "</td>");
            out.println("</tr>");
            i += 1;
        }

    %>
    </tbody>
</table>
</body>
</html>