<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %><%--
  @author: Qiwei Li
--%>
<%
//     This is the database configuration file
//    String DB_URL = "jdbc:mysql://cs363-liqiwei.misc.iastate.edu:3306/project?useSSL=false&allowPublicKeyRetrieval=true";
    Class.forName("com.mysql.jdbc.Driver");
    String DB_URL = "jdbc:mysql://mysql:3306/project?useSSL=false&allowPublicKeyRetrieval=true";
    String DB_USERNAME = "root";
    String DB_PASSWORD="somepassword";
//    String DB_USERNAME = "hosseini";
//    String DB_PASSWORD="123456";


    Connection conn;
    ResultSet rs;

    conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
    conn.setAutoCommit(false);

%>