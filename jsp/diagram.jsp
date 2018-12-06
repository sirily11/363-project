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
<ul class="nav">
    <li class="nav-item">
        <a class="nav-link active" href="index.jsp">Home</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="diagram.jsp">Diagram</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="code.jsp">Import script</a>
    </li>
</ul>
<div class="card card-blog">
    <div class="card-header card-header-image">
        <img class="img" src="ER_diagram.png">
        <div class="card-title text-warning">
            ER diagram for the Database
        </div>
    </div>
    <div class="card-body">
        <h6 class="text-info">Description</h6>
        <p class="card-description">
            The database uses index on 'ofstate' attr and 'category' attr.
            The database create script is under the import-data folder.
        </p>
    </div>
</div>


</body>