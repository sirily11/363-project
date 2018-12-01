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
<table class="table">
    <thead>
    <tr>
        <th scope="col">#</th>
        <th scope="col">State</th>
        <th scope="col">Hash Tag Name</th>
        <th scope="col">Total number</th>
    </tr>
    </thead>
    <tbody>
    <%
        String hashtag = request.getParameter("hashtag");
        //Make connection
        Connection conn;
        PreparedStatement stmt;
        ResultSet rs;

        //use jdbc driver
        Class.forName("com.mysql.jdbc.Driver");
        //Set up the connection
        conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);

        String sqlQuery ="SELECT ofstate,tagged.hastagname,count(ofstate) as number FROM ((tweets\n" +
                "  INNER JOIN user ON tweets.posting_user = user.screen_name)\n" +
                "  INNER JOIN tagged ON tweets.tid = tagged.tid)\n" +
                "WHERE hastagname=?\n" +
                "GROUP BY ofstate,tagged.hastagname\n" +
                "ORDER BY number DESC\n" +
                ";";
        stmt = conn.prepareStatement(sqlQuery);
        stmt.setString(1,hashtag);
        rs = stmt.executeQuery();

        int i = 1;
        //print
        while (rs.next()){
            out.println("<tr>");
            out.println("<th scope='row'>"+i+"</th>");
            out.println("<td>" + rs.getString(1) + "</td>");
            out.println("<td>" + rs.getString(2) + "</td>");
            out.println("<td>" + rs.getInt(3) + "</td>");
            out.println("</tr>");
            i += 1;
        }

    %>
    </tbody>
</table>
</body>
</html>
