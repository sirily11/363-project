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
    <link rel="stylesheet" href="../static/css/material-kit.min.css" ><script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
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
        <li class="breadcrumb-item active" aria-current="page">Query2</li>
    </ol>
</nav>
<div class="container-fluid">
    <form method="post" action="resultQuery2.jsp">
        <div class="row">
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
            <span>States</span>
            <select name="state" class="custom-select col-3">
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

        <div class="row">
            <span>Num users</span>
            <select name="numOfUsers" class="custom-select col-3">
                <%
                    for (int i = 1; i <= 100; i++) {
                        out.println("<option value=" + i + ">" + i + "</option>");
                    }
                %>
            </select>
            <div class="input-group col-7 ui-widget">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="basic-addon1">Hashtag</span>
                </div>
                <input id="tags" type="text" class="form-control" placeholder="Hash Tag"
                       aria-label="hashtag"
                       aria-describedby="basic-addon1"
                       name="hashtag"
                >
                <button type="submit" class="btn btn-primary">Get</button>
            </div>
        </div>
    </form>
</div>
</body>
<script>
    $(function () {
        let availableTags = [<%=getTags(conn).toString()%>];
        let users = [<%=getUsers(conn).toString()%>];
        $("#tags").autocomplete({
            source: function (request, response) {
                var results = $.ui.autocomplete.filter(availableTags, request.term);
                response(results.slice(0, 10));
            },
            messages: {
                noResults: '',
                results: function () {
                }
            },
        });
        $("#users").autocomplete({
            source: function (request, response) {
                var results = $.ui.autocomplete.filter(users, request.term);
                response(results.slice(0, 10));
            },
            messages: {
                noResults: '',
                results: function () {
                }
            },
        });
    });
</script>
</html>
