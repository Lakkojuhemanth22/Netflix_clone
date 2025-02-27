<%@ page import="java.sql.*, java.io.*, JDBC.JDBCUtil" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Netflix Clone</title>
    <style>
    	
    	html{
    		scroll-behavior: smooth;
    	}
        /* Netflix Dark Theme */
        body {
            background-color: #141414;
            font-family: Arial, sans-serif;
            color: white;
            margin: 0;
            padding: 0;
        }

        /* Netflix Navbar */
       .navbar {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 15px 0px 15px 0px;
        position: fixed;
        width: 100%;
        top: 0;
        z-index: 1000;
        background-color: transparent;
        transition: background 0.3s ease-in-out;
    }

    .navbar.scrolled {
        background-color: rgba(0, 0, 0, 0.9);
    }

    .logo {
        width: 120px;
        margin-left: 30px;
    }

    .navbar-links {
        display: flex;
        align-items: center;
        gap: 20px;
    }

    .navbar a {
        color: white;
        text-decoration: none;
        font-size: 16px;
        font-weight: 500;
        transition: color 0.3s;
    }

    .navbar a:hover {
        color: red;
        text-decoration: underline;
    }

    .buttons {
        display: flex;
        gap: 15px;
    }

    .btn {
        background-color: red;
        color: white;
        padding: 8px 16px;
        font-size: 16px;
        border: none;
        cursor: pointer;
        border-radius: 5px;
        transition: background 0.3s;
    }

    .btn:hover {
        background-color: #e50914;
    }

    /* Profile Dropdown */
    .profile-container {
        position: relative;
        display: flex;
        align-items: center;
        gap: 10px;
        cursor: pointer;
        margin-right: 30px;
    }

    .profile-container img {
        width: 35px;
        height: 35px;
        border-radius: 50%;
        object-fit: cover;
        border: 2px solid white;
    }

    .dropdown {
        display: none;
        position: absolute;
        top: 45px;
        right: 0;
        background-color: black;
        border-radius: 5px;
        overflow: hidden;
        min-width: 140px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.5);
    }

    .dropdown a {
        display: block;
        padding: 10px;
        color: white;
        text-decoration: none;
        transition: background 0.3s;
    }

    .dropdown a:hover {
        background-color: rgba(255, 255, 255, 0.1);
    }

    .profile-container:hover .dropdown {
        display: block;
    }

        /* Hero Section */
        .hero {
            height: 100vh;
            display: flex;
            align-items: flex-end;
            background-size: cover;
            background-position: center;
            position: relative;
        }

        .hero-overlay {
            position: absolute;
            width: 100%;
            height: 100%;
            background: linear-gradient(to bottom, rgba(0, 0, 0, 0.4), #141414);
            backdrop-filter: blur(3px);
        }

        .hero-content {
            max-width: 600px;
            z-index: 2;
            padding: 40px;
            position: relative;
            text-shadow: 2px 2px 10px rgba(0, 0, 0, 0.8);
        }

        .hero h1 {
            font-size: 3rem;
            margin-bottom: 10px;
            font-weight: bold;
        }

        .hero p {
            font-size: 1.2rem;
            margin-bottom: 20px;
        }

        .btn {
            background-color: red;
            color: white;
            padding: 12px 24px;
            font-size: 18px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            margin-right: 10px;
            transition: background 0.3s;
        }

        .hero button:hover {
            background-color: #e50914;
        }

        /* Movie Carousel */
        .movies-container {
            margin: 50px;
        }

        .movie-category {
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .carousel {
            display: flex;
            overflow-x: scroll;
            padding: 10px;
            gap: 15px;
            scroll-behavior: smooth;
        }

        .carousel::-webkit-scrollbar {
            display: none;
        }

		.carousel-item {
		    position: relative;
		    flex: 0 0 auto;
		    width: 200px;
		    cursor: pointer;
		    overflow: hidden;
		    border-radius: 8px;
		}
		
		.carousel-item img {
		    width: 100%;
		    height: 300px;
		    border-radius: 8px;
		    transition: transform 0.3s;
		}
		
		.carousel-item:hover img {
		    transform: scale(1.1);
		}
		
		/* Gradient Overlay on Hover */
		.movie-info {
		    position: absolute;
		    bottom: 0;
		    width: 100%;
		    background: linear-gradient(to top, rgba(0, 0, 0, 0.8), transparent);
		    color: white;
		    padding: 10px;
		    opacity: 0;
		    transition: opacity 0.3s ease-in-out;
		    text-align: center;
		}
		
		.carousel-item:hover .movie-info {
		    opacity: 1;
		}
		
		/* Buttons */
		.movie-info .buttons {
		    margin-top: 10px;
		    display: flex;
		    justify-content: center;
		    gap: 10px;
		}
		
		.movie-info .btn {
		    background-color: red;
		    color: white;
		    padding: 8px 12px;
		    font-size: 14px;
		    border: none;
		    cursor: pointer;
		    border-radius: 5px;
		    transition: background 0.3s;
		}
		
		.movie-info .btn:hover {
		    background-color: #e50914;
		}

        /* Footer */
        .footer {
            text-align: center;
            padding: 20px;
            background-color: #181818;
            color: gray;
            font-size: 14px;
        }
    </style>
</head>
<body>

<script>
    // Change navbar background on scroll
    window.addEventListener('scroll', function () {
        const navbar = document.querySelector('.navbar');
        if (window.scrollY > 50) {
            navbar.classList.add('scrolled');
        } else {
            navbar.classList.remove('scrolled');
        }
    });
    
    function watchTrailer(trailerUrl) {
        if (trailerUrl && trailerUrl !== "null") {
            window.open(trailerUrl, "_blank");
        } else {
            alert("Trailer not available for this movie.");
        }
    }

    function toggleWatchlist(movieId) {
        fetch("AddToWatchlistServlet", {
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded",
            },
            body: "movie_id=" + movieId,
        })
        .then(response => response.text())
        .then(result => {
            if (result === "added") {
                alert("Added to My List! ✅");
            } else if (result === "removed") {
                alert("Removed from My List ❌");
            } else if (result === "not_logged_in") {
                alert("Please log in to add to your watchlist.");
            } else {
                alert("Something went wrong. Try again!");
            }
        })
        .catch(error => console.error("Error:", error));
    }

</script>


<%@ page import="java.sql.*, java.io.*, JDBC.JDBCUtil" %>

<%
    // Declare variables for hero movie
    String heroTitle = "Featured Movie";
    String heroDescription = "This is a featured movie description.";
    String heroPoster = "images/default-banner.jpg";

    // Use Try-With-Resources to ensure the connection closes automatically
    try (Connection connection = JDBCUtil.getConnection();
         Statement stmt = connection.createStatement()) {

        // Fetch a random movie for the hero section
        ResultSet heroMovie = stmt.executeQuery("SELECT * FROM Movies ORDER BY RAND() LIMIT 1");

        if (heroMovie.next()) {
            heroTitle = heroMovie.getString("title");
            heroDescription = heroMovie.getString("description");
            heroPoster = heroMovie.getString("poster_url");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>

<!-- Netflix Navbar -->
<div class="navbar">
    <a href="index.jsp">
        <img class="logo" src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/Logonetflix.png/800px-Logonetflix.png" alt="Netflix Logo">
    </a>

    <% 
       String username = (String) session.getAttribute("username");

        if (username == null) { 
    %>
        <!-- Show Login/Register when not logged in -->
        <div class="buttons">
            <a href="login.jsp" class="btn">Login</a>
            <a href="register.jsp" class="btn">Register</a>
        </div>
    <% } else { %>
        <!-- Show Navbar Links when logged in -->
        <div class="navbar-links">
            <a href="#">Home</a>
            <a href="#">TV Shows</a>
            <a href="#Movies">Movies</a>
            <a href="#">New & Popular</a>
            <a href="watchlist.jsp">My List</a>
            
            <div class="profile-container">
            <img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" alt="Profile">
            <div class="dropdown">
                <a href="#">Account</a>
                <a href="logout.jsp">Logout</a>
            </div>
        </div>
        </div>
		
        <!-- Profile Dropdown -->

    <% } %>
</div>

<!-- Hero Section (Dynamic Featured Movie) -->
<div class="hero" style="background-image: url('<%= heroPoster %>');">
    <div class="hero-overlay"></div>
    <div class="hero-content">
        <h1><%= heroTitle %></h1>
        <p><%= heroDescription %></p>
        <button class="btn">Play</button>
        <button class="btn">More Info</button>
    </div>
</div>

<!-- Movie Sections -->
<div id="Movies">
<div class="movies-container">
    <div class="movie-category">Trending Now</div>
    <div class="carousel">
        <%
            try (Connection connection = JDBCUtil.getConnection();
                 Statement stmt = connection.createStatement();
                 ResultSet rs = stmt.executeQuery("SELECT * FROM Movies LIMIT 10")) {

                while (rs.next()) { 
        %>
        <div class="carousel-item">
            <img src="<%= rs.getString("poster_url") %>" alt="<%= rs.getString("title") %>">
            <div class="movie-info">
                <h4><%= rs.getString("title") %></h4>
                <p><%= rs.getString("rating") %>/10 ⭐</p>
                <div class="buttons">
                    <button class="btn play-btn" onclick="toggleWatchlist(<%= rs.getInt("movie_id") %>)">➕ Add</button>
                    <button class="btn trailer-btn" onclick="watchTrailer('<%= rs.getString("trailer_url") %>')">🎬 Trailer</button>
                </div>
            </div>
        </div>
        <% 
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        %>
    </div>

    <div class="movie-category">Top Picks for You</div>
    <div class="carousel">
        <%
            try (Connection connection = JDBCUtil.getConnection();
                 Statement stmt = connection.createStatement();
                 ResultSet rs = stmt.executeQuery("SELECT * FROM Movies ORDER BY RAND() LIMIT 10")) {

                while (rs.next()) { 
        %>
        <div class="carousel-item">
            <img src="<%= rs.getString("poster_url") %>" alt="<%= rs.getString("title") %>">
            <div class="movie-info">
                <h4><%= rs.getString("title") %></h4>
                <p><%= rs.getString("rating") %>/10 ⭐</p>
                <div class="buttons">
                    <button class="btn trailer-btn" onclick="watchTrailer('<%= rs.getString("trailer_url") %>')">🎬 Trailer</button>
                    <button class="btn play-btn" onclick="toggleWatchlist(<%= rs.getInt("movie_id") %>)">➕ Add</button>
                </div>
            </div>
        </div>
        <% 
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        %>
    </div>
</div>
</div>

<!-- Footer -->
<div class="footer">
    &copy; 2025 Netflix Clone | Designed for Educational Purposes
</div>
</body>
</html>
