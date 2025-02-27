package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import JDBC.JDBCUtil;

@WebServlet("/AddToWatchlistServlet")
public class AddToWatchlistServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("user_id");

        if (userId == null) {
            response.getWriter().write("not_logged_in");
            return;
        }

        try {
            int movieId = Integer.parseInt(request.getParameter("movie_id"));

            try (Connection conn = JDBCUtil.getConnection()) {
                // Check if the movie is already in the watchlist
                String checkQuery = "SELECT * FROM User_Watchlist WHERE user_id = ? AND movie_id = ?";
                try (PreparedStatement checkStmt = conn.prepareStatement(checkQuery)) {
                    checkStmt.setInt(1, userId);
                    checkStmt.setInt(2, movieId);
                    try (ResultSet rs = checkStmt.executeQuery()) {
                        if (rs.next()) {
                            // Remove from watchlist
                            String deleteQuery = "DELETE FROM User_Watchlist WHERE user_id = ? AND movie_id = ?";
                            try (PreparedStatement deleteStmt = conn.prepareStatement(deleteQuery)) {
                                deleteStmt.setInt(1, userId);
                                deleteStmt.setInt(2, movieId);
                                deleteStmt.executeUpdate();
                                response.getWriter().write("removed");
                            }
                        } else {
                            // Add to watchlist
                            String insertQuery = "INSERT INTO User_Watchlist (user_id, movie_id) VALUES (?, ?)";
                            try (PreparedStatement insertStmt = conn.prepareStatement(insertQuery)) {
                                insertStmt.setInt(1, userId);
                                insertStmt.setInt(2, movieId);
                                insertStmt.executeUpdate();
                                response.getWriter().write("added");
                            }
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("error");
        }
    }
}
