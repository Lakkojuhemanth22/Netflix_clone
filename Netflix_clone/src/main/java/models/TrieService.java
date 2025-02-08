package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import JDBC.JDBCUtil;

public class TrieService {
    private static Trie trie = new Trie();

    static {
        loadMoviesIntoTrie(); // Load movies on startup
    }

    public static void loadMoviesIntoTrie() {
    	 String query = "SELECT title FROM Movies"; // Fetch all movie titles
    	    try (Connection connection = JDBCUtil.getConnection();
    	         Statement stmt = connection.createStatement();
    	         ResultSet rs = stmt.executeQuery(query)) {

    	        while (rs.next()) {
    	            String movieTitle = rs.getString("title");
    	            trie.insert(movieTitle); // Insert into Trie

    	            // Debugging: Print fetched movie titles
    	            System.out.println("Fetched from DB: " + movieTitle);
    	        }
    	    } catch (SQLException e) {
    	        e.printStackTrace();
    	    }
    }


    public static List<String> getSuggestions(String prefix) {
        return trie.search(prefix);
    }
}
