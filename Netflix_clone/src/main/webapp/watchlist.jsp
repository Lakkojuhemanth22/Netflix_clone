<%@ page import="java.sql.*, JDBC.JDBCUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Watchlist</title>
    <style>
        body { background-color: #141414; color: white; font-family: Arial, sans-serif; }
        .movies-container { margin: 50px; }
        .carousel { display: flex; gap: 15px; flex-wrap: wrap; }
        .carousel-item { width: 200px; cursor: pointer; border-radius: 8px; position: relative; }
        .carousel-item img { width: 100%; height: 300px; border-radius: 8px; transition: transform 0.3s; }
        .carousel-item:hover img { transform: scale(1.1); }
        .movie-info { text-align: center; margin-top: 10px; }
        .btn { background-color: red; color: white; padding: 8px 12px; font-size: 14px; border: none; cursor: pointer; border-radius: 5px; }
    </style>
</head>
<body>

<div class="movies-container">
    <h1>My Watchlist</h1>
    <div class="carousel">
        <%
            Integer userId = (Integer) session.getAttribute("user_id");

            if (userId == null) {
                out.println("<p>Please <a href='login.jsp'>log in</a> to view your watchlist.</p>");
            } else {
                Connection conn = JDBCUtil.getConnection();
                PreparedStatement stmt = conn.prepareStatement("SELECT m.* FROM Movies m JOIN User_Watchlist uw ON m.movie_id = uw.movie_id WHERE uw.user_id = ?");
                stmt.setInt(1, userId);
                ResultSet rs = stmt.executeQuery();

                while (rs.next()) {
        %>
        <div class="carousel-item">
            <img src="<%= rs.getString("poster_url") %>" alt="<%= rs.getString("title") %>">
            <div class="movie-info">
                <h4><%= rs.getString("title") %></h4>
                <button class="btn" onclick="toggleWatchlist(<%= rs.getInt("movie_id") %>)">❌ Remove</button>
            </div>
        </div>
        <% } } %>
    </div>
</div>

</body>
</html>
