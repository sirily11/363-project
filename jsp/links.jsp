<%@ page import="java.util.List" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="java.util.Arrays" %>
<%
    List<String> titles = Arrays.asList("Query 1","Query 2","Query 3","Query 4");
    List<String> links = Arrays.asList("queries/query1.jsp","queries/query2.jsp","queries/query3.jsp","queries/query4.jsp");
    List<String> descriptions = Arrays.asList(
            "Find k hashtags that appeared in the most number of states; show the total number of states\n" +
            "the hashtag appeared, distinct states it appeared, and the hashtag itself in descending order\n" +
            "of the number of states it appeared.",

            "Find k users who used a given hashtag in a given state in a given month of a given year. Show the\n" +
            "count of tweets posted with that hashtag along with the user’s screen name and category in\n" +
            "descending order of the tweet count.",

            "Find k distinct hashtags that appeared in one of the given states in a given month of a given year\n" +
            "and the names of the states in which they appeared in ascending order of the hashtag names\n" +
            "Input from your user: names of the states of interest, month, year, value of k",

            "Show the names of the k users in a given category in a given month of a given year and the\n" +
            "users’ states along with URLs used in the users’ tweets posted in descending order of the\n" +
            "tweet posted time."
            );

%>