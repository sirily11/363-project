<%--
  @author: Qiwei Li
--%>
<%@ include file="./links.jsp"%>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="static/css/material-kit.min.css" >
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</head>
<!doctype html>
<body>
<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <li class="breadcrumb-item active" aria-current="page">Home</li>
    </ol>
</nav>
<div class="container-fluid">
    <div class="row">

        <%
            for(int i = 0;i < links.size();i++){
                out.println("<div class='card col-4'>");
                out.println("<div class='card-body'>");
                out.println("<div class='card-title'>" + titles.get(i) + "</div>");
                out.println("<p class='card-text'>" + descriptions.get(i) + "</p>");
                out.println("<a href="+ links.get(i)  + " class='btn btn-primary'>" + "Go" + "</a>");
                out.println("</div>");
                out.println("</div>");
            }

        %>
    </div>
</div>
</body>