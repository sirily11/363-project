<%@ page import="java.util.List" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="java.util.Arrays" %>
<%
    List<String> links = Arrays.asList("Query 1","Query 2");
    List<String> descriptions = Arrays.asList(
            "Find k hashtags that appeared in the most number of states; show the total number of states\n" +
            "the hashtag appeared, distinct states it appeared, and the hashtag itself in descending order\n" +
            "of the number of states it appeared.",
            "Find k users who used a given hashtag in a given state in a given month of a given year. Show the\n" +
            "count of tweets posted with that hashtag along with the user’s screen name and category in\n" +
            "descending order of the tweet count."
            );

%>