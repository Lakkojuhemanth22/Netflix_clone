<%@ page import="java.sql.*, java.io.*, JDBC.JDBCUtil" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    String movieTitle = request.getParameter("title");
    String title = "", description = "", poster = "", rating = "", trailer = "";

    try (Connection connection = JDBCUtil.getConnection();
         PreparedStatement pst = connection.prepareStatement("SELECT * FROM Movies WHERE title = ?")) {
        pst.setString(1, movieTitle);
        ResultSet rs = pst.executeQuery();

        if (rs.next()) {
            title = rs.getString("title");
            description = rs.getString("description");
            poster = rs.getString("poster_url");
            rating = rs.getString("rating");
            trailer = rs.getString("trailer_url");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><%= title %> - Netflix Clone</title>
    <style>
        body {
            background-color: #141414;
            color: white;
            font-family: Arial, sans-serif;
            text-align: center;
        }
        .movie-container {
            margin-top: 50px;
        }
        .movie-container img {
            width: 300px;
            border-radius: 10px;
        }
        .btn {
            background-color: red;
            color: white;
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            transition: background 0.3s;
        }
        .btn:hover {
            background-color: #e50914;
        }
    </style>
</head>
<body>

<div class="movie-container">
    <img src="<%= poster %>" alt="<%= title %>">
    <h1><%= title %></h1>
    <p><%= description %></p>
    <p><%= rating %>/10 ⭐</p>
    <button class="btn" onclick="watchTrailer('<%= trailer %>')">🎬 Watch Trailer</button>
</div>

<script>
function watchTrailer(trailerUrl) {
    if (trailerUrl && trailerUrl !== "null") {
        window.open(trailerUrl, "_blank");
    } else {
        alert("Trailer not available for this movie.");
    }
}
</script>

</body>
</html>
