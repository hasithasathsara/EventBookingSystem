package controller;

import dao.UserDAO;
import model.User;
import model.AdminUser;
import model.Customer;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private UserDAO userDAO = new UserDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Fetching data from JSP form using name attributes
        String email = request.getParameter("userEmail");
        String password = request.getParameter("userPassword");

        // Now returns a base 'User' object (Polymorphism)
        User user = userDAO.loginUser(email, password);

        if (user != null) {
            // Start a session to keep the user logged in
            HttpSession session = request.getSession();
            session.setAttribute("loggedInUser", user);

            // Using 'instanceof' to check the specific type of the user object
            // This is a great example of OOP Polymorphism and Inheritance
            if (user instanceof AdminUser) {
                // If it's an Admin (Main or Sub), redirect to Admin Dashboard
                response.sendRedirect("adminDashboard.jsp");
            } else if (user instanceof Customer) {
                // If it's a regular Customer, redirect to User Dashboard
                response.sendRedirect("userDashboard.jsp");
            }
        } else {
            // If login fails, send error message back to login.jsp
            request.setAttribute("errorMessage", "Invalid email or password!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}