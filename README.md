📺 Netflix Clone - Java, Servlets & JDBC This is a fully functional Netflix Clone built using JDBC, Servlets, JSP, HTML, CSS, and JavaScript. It replicates the UI and core functionalities of Netflix, including user authentication, a dynamic movie catalog, a watchlist, and an auto-suggest search feature using Trie (Advanced DSA).

🚀 Features 🔹 User Features ✅ User Authentication - Register & Login using JDBC ✅ Home Page UI - Exact Netflix-like UI with movies, categories, and a hero section ✅ Movie Catalog - Dynamic movie list fetched from the database ✅ Watchlist Feature - Add/Remove movies from "My List" ✅ Movie Search - Auto-suggest search powered by Trie Data Structure ✅ Movie Filters - Filter by genre, year, language, and rating ✅ Movie Sorting - Sort by popularity, latest, highest-rated ✅ Movie Trailer - Watch trailers directly from the platform

🔹 Admin Features ✅ Admin Login - Single admin account for managing movies ✅ Movie Management - Add, Update, Delete movies in the database ✅ Dashboard - View movie statistics

🛠 Tech Stack Frontend: HTML, CSS, JavaScript JSP (Java Server Pages) AJAX for dynamic updates

Backend: Java Servlets (Controller Layer) JDBC (Database Connectivity) MySQL (Database) Apache Tomcat (Server) Data Structures & Algorithms (DSA) Used: Trie (Auto-Suggest Search) - Efficient movie title suggestions HashMap & Arrays - Faster movie retrieval Sorting Algorithms - Used for sorting movies based on filters

🗄 Project Structure Netflix_Clone/ │── src/ │ ├── servlet/ # Java Servlets for handling requests │ │ ├── LoginServlet.java │ │ ├── RegisterServlet.java │ │ ├── MovieServlet.java │ │ ├── AutoSuggestServlet.java │ ├── models/ # Business Logic & Database Models │ │ ├── User.java │ │ ├── Movie.java │ │ ├── Trie.java # Trie Data Structure for Auto-Suggest │ │ ├── JDBCUtil.java # Database Connection Helper │── WebContent/ # Frontend Files │ ├── index.jsp # Home Page │ ├── login.jsp # Login Page │ ├── register.jsp # Register Page │ ├── watchlist.jsp # User's Watchlist │ ├── admin.jsp # Admin Dashboard │ ├── css/ # Stylesheets │ ├── js/ # JavaScript Files │── WEB-INF/ │ ├── web.xml # Deployment Descriptor │── database/ │ ├── netflix_clone.sql # SQL Dump for Database │── pom.xml # Maven Dependencies │── README.md # This file

🎬 Database Schema (MySQL) Users Table CREATE TABLE Users ( user_id INT AUTO_INCREMENT PRIMARY KEY, username VARCHAR(50) UNIQUE NOT NULL, password VARCHAR(255) NOT NULL );

Movies Table CREATE TABLE Movies ( movie_id INT AUTO_INCREMENT PRIMARY KEY, title VARCHAR(100) NOT NULL, description TEXT, poster_url VARCHAR(255), trailer_url VARCHAR(255), genre VARCHAR(50), release_year INT, language VARCHAR(50), rating DECIMAL(3,1) );

Watchlist Table CREATE TABLE Watchlist ( user_id INT, movie_id INT, FOREIGN KEY (user_id) REFERENCES Users(user_id), FOREIGN KEY (movie_id) REFERENCES Movies(movie_id) );

🔥 Setup & Installation 1️⃣ Clone the Repository git clone https://github.com/YOUR_GITHUB_USERNAME/Netflix_Clone.git cd Netflix_Clone

2️⃣ Import the Project into Eclipse Open Eclipse → File → Import Select Existing Maven Projects Browse and select the project folder Click Finish

3️⃣ Set Up MySQL Database Create the Database CREATE DATABASE netflix_clone;

Import the SQL Dump mysql -u root -p netflix_clone < database/netflix_clone.sql Update JDBCUtil.java with your MySQL credentials private static final String URL = "jdbc:mysql://localhost:3306/netflix_clone"; private static final String USER = "root"; private static final String PASSWORD = "your_password";

4️⃣ Configure Tomcat Server Open Eclipse → Window → Preferences Go to Server → Runtime Environments Click Add → Select Apache Tomcat v10.1 Set the Tomcat Installation Path

5️⃣ Run the Project Start MySQL Server Run the Application on Tomcat Right-click on the project → Run As → Run on Server Open http://localhost:8080/Netflix_Clone in your browser

🌎 How to Deploy Online 🔹 Option 1: Deploy on AWS EC2 Set up Ubuntu EC2 Instance Install Apache Tomcat & MySQL Deploy Netflix_Clone.war in /webapps/ directory Start Tomcat & access from the public IP

🔹 Option 2: Deploy on Railway.app (Free Hosting) Push the project to GitHub Connect GitHub Repo to Railway.app Set up MySQL Database in Railway Deploy & get a public URL

🔹 Option 3: Deploy on Render Upload the project to GitHub Deploy using Render's Web Service Set up MySQL in Render Databases Set the Environment Variables

🧪 Testing Frontend Testing ✅ Open index.jsp → Search "G" → Should show "Game Change" ✅ Try adding/removing movies from the watchlist ✅ Click on the trailer button → It should open YouTube

Backend Testing ✅ Try Register/Login → Should work with valid credentials ✅ Access Admin Panel → Add/Delete movies ✅ Open MySQL and run: SELECT * FROM Movies WHERE title LIKE 'P%';

✅ Run Postman API Test: POST /LoginServlet Content-Type: application/x-www-form-urlencoded

username=testuser&password=testpass 🏆 Contributions & Credits 💡 Developed by: Hemanth Lakkoju 📧 Email: hemanthlakkoju2212@gmail.com

Feel free to contribute! Submit Pull Requests or report issues in the GitHub Issues section.

⭐ Future Enhancements ✅ User Profiles (Multiple Users per Account) ✅ Video Streaming instead of Trailers ✅ Movie Recommendations using Machine Learning

📜 License This project is for educational purposes and does not violate any copyrights. Netflix™ is a trademark of Netflix, Inc. This project is an independent implementation.
