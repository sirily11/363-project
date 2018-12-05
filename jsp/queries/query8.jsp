<%--
  Created by IntelliJ IDEA.
  User: liqiwei
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
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../static/css/material-kit.min.css" >
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
            integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
            crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
            integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
            crossorigin="anonymous"></script>
</head>
<body>
<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="../index.jsp">Home</a></li>
        <li class="breadcrumb-item active" aria-current="page">Q25</li>
    </ol>
</nav>
<div class="container-fluid">
    <form method="post" action="resultQuery8.jsp">
        <div class="form-group">
            <span>Month</span>
            <select name="month" class="custom-select col-3">
                <%
                    for (int i = 1; i <= 12; i++) {
                        out.println("<option value=" + i + ">" + i + "</option>");
                    }
                %>
            </select>
            <span>Year</span>
            <select name="year" class="custom-select col-3">
                <%
                    for (int i = 2016; i < 2017; i++) {
                        out.println("<option value=" + i + ">" + i + "</option>");
                    }
                %>
            </select>
        </div>
        <div class="form-group">
            <span>Category for posting</span>
            <select name="category-p" class="custom-select col-3">
                <%
                    Statement statement;
                    statement = conn.createStatement();
                    ResultSet states = statement.executeQuery("select distinct category from user;\n");
                    String html = "";
                    while (states.next()) {
                        html += "<option value=" + states.getString(1) + ">" + states.getString(1) + "</option>\n";
                    }
                    out.println(html);
                %>
            </select>
        </div>
        <div class="form-group">
            <span>Category For mentioned</span>
            <select name="category-m" class="custom-select col-3">
                <%
                    out.println(html);
                %>
            </select>
        </div>
        <div class="form-group">
            <span>Num users</span>
            <select name="numOfUsers" class="custom-select col-3">
                <%
                    for (int i = 1; i <= 100; i++) {
                        out.println("<option value=" + i + ">" + i + "</option>");
                    }
                %>
            </select>
            <button type="submit" class="btn btn-primary">Get</button>
        </div>
    </form>
</div>
</body>
</html>
