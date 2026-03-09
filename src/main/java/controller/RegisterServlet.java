package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Customer;

// Identify the request from the web page
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // get data from the JSP
        String name = request.getParameter("userName");
        String email = request.getParameter("userEmail");
        String phone = request.getParameter("phone");
        String password = request.getParameter("userPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        // check the password are equal or not  (Validation)
        if (!password.equals(confirmPassword)) {
            response.sendRedirect("signup.jsp?error=PasswordMismatch");
            return;
        }

        // Create a  Customer Object  (Inheritance & Encapsulation )
        model.Customer newCustomer = new model.Customer();
        newCustomer.setName(name);
        newCustomer.setEmail(email);
        newCustomer.setPhone(phone);
        newCustomer.setPassword(password);
        newCustomer.setRole("customer");

        // transmit the data into the database by using DAO meth
        dao.UserDAO userDAO = new dao.UserDAO();
        boolean isSuccess = userDAO.registerCustomer(newCustomer);

        //page selection
        if (isSuccess) {
            // if reg successful redirect to the Login page
            response.sendRedirect("login.jsp?status=Success");
        } else {
            //if uncompleted redirect to the signup
            response.sendRedirect("signup.jsp?error=RegistrationFailed");
        }
    }
}