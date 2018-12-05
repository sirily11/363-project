<%@ page import="java.util.List" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="java.util.Arrays" %>
<%
    List<String> titles = Arrays.asList("Q3","Q7","Q10",
            "Q15","Q16","Q19","Q22","Q25","Q26","Import","Q11");
    List<String> links = Arrays.asList("queries/query1.jsp","queries/query2.jsp",
            "queries/query3.jsp","queries/query4.jsp","queries/query5.jsp","queries/query6.jsp",
            "queries/query7.jsp","queries/query8.jsp","queries/query9.jsp","queries/query10.jsp",
            "queries/query11.jsp");
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
            "tweet posted time.",

            "Show names and categories of k users along with the tweet text, retweet count, and the url\n" +
            "used by the user a given month of a given year in descending order of the retweet count",

            "Show screen names of k users mentioned in tweets of users in a given user category in a\n" +
            "given month of a given year.",

            "Find k most used hashtags among all the users in a given category in a given month of a\n" +
            "given year. Show the count of the tweets that each hashtag appeared and the list of\n" +
            "states it appeared in descending order of the tweet count.",

            "Find k users in a given category mentioned in tweets posted by users in a given category in a\n" +
            "given month of a given year. Show tweet text, user’s name and the user mentioned in the\n" +
            "tweet for a given category of users mentioned",

            "Show k tweet text, user name and the user mentioned in the tweet of a given s u b - category\n" +
            "of the user mentioned in a given month of a given year",

            "Insert information of a new user into the database. The program asks for all the relevant attribute\n" +
            "values. ",

            "Extra credit: Find k tweets with hashtags posted by republican...",

            "Extra credit: Find k hashtags and tweets in which that hashtags were posted"
            );

%>