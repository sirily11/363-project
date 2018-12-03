
<%@ page import="java.sql.*" %>
<%!
    public StringBuffer getTags(Connection conn) {
        StringBuffer tags = new StringBuffer();
        String sqlQuery = "SELECT DISTINCT tagged.hastagname FROM tagged;";
        Statement stmt;
        ResultSet rs;

        try {

            stmt = conn.createStatement();
            rs = stmt.executeQuery(sqlQuery);
            while (rs.next()) {
                if (tags.length() > 0) {
                    tags.append(',');
                }
                tags.append('"').append(rs.getString(1)).append('"');
            }
        } catch (Exception e) {

        }
        return tags;
    }

    public StringBuffer getUsers(Connection conn) {
        StringBuffer users = new StringBuffer();
        String sqlQuery = "select distinct user.screen_name from user;";
        Statement stmt;
        ResultSet rs;

        try {

            stmt = conn.createStatement();
            rs = stmt.executeQuery(sqlQuery);
            while (rs.next()) {
                if (users.length() > 0) {
                    users.append(',');
                }
                users.append('"').append(rs.getString(1)).append('"');
            }
        } catch (Exception e) {

        }
        return users;
    }
%>