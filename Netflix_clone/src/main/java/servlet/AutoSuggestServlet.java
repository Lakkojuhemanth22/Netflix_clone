package servlet;

import java.io.IOException;
import java.util.List;
import models.TrieService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.google.gson.Gson;

@WebServlet("/AutoSuggestServlet")
public class AutoSuggestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String query = request.getParameter("query");
        System.out.println("Received Query: " + query);
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try {
            List<String> suggestions = TrieService.getSuggestions(query);
            System.out.println("Suggestions: " + suggestions);
            response.getWriter().write(new Gson().toJson(suggestions));
        } catch (Exception e) {
            e.printStackTrace(); // Print the error in logs
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"error\": \"Internal Server Error\"}");
        }
    }
}

