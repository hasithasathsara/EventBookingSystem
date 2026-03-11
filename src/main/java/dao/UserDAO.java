package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.User;
import model.Customer;
import model.AdminUser;
import utils.DatabaseConnection;
import java.util.ArrayList;
import java.util.List;

/**
 * Data Access Object (DAO) for User-related database operations.
 * Demonstrates OOP concepts like Polymorphism and Encapsulation.
 */
public class UserDAO {

    /**
     * Authenticates a user and returns a polymorphic User object.
     * Demonstrates Polymorphism by returning either AdminUser or Customer.
     */
    public User loginUser(String email, String password) {
        User loggedInUser = null; // Base class reference variable
        String query = "SELECT * FROM users WHERE email = ? AND password = ?";

        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement pst = con.prepareStatement(query)) {

            // Setting parameters to prevent SQL Injection
            pst.setString(1, email);
            pst.setString(2, password);

            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    String role = rs.getString("role");

                    // If the user is an admin, create an AdminUser object (Subclass)
                    if ("main_admin".equals(role) || "sub_admin".equals(role)) {
                        AdminUser admin = new AdminUser();

                        // Encapsulation: Using setters to set user data
                        admin.setId(rs.getInt("id"));
                        admin.setName(rs.getString("name"));
                        admin.setEmail(rs.getString("email"));
                        admin.setPhone(rs.getString("phone"));
                        admin.setRole(role);

                        // Setting specific admin permissions from database columns
                        admin.setCanManageEvents(rs.getBoolean("can_manage_events"));
                        admin.setCanApproveBookings(rs.getBoolean("can_approve_bookings"));
                        admin.setCanAddAdmins(rs.getBoolean("can_add_admins"));

                        loggedInUser = admin; // Polymorphism in action

                    }
                    // If the user is a customer, create a Customer object (Subclass)
                    else if ("customer".equals(role)) {
                        Customer customer = new Customer();
                        customer.setId(rs.getInt("id"));
                        customer.setName(rs.getString("name"));
                        customer.setEmail(rs.getString("email"));
                        customer.setPhone(rs.getString("phone"));
                        customer.setRole(role);

                        loggedInUser = customer; // Polymorphism in action
                    }
                }
            }
        } catch (SQLException e) {
            // Logging the exception for debugging
            e.printStackTrace();
        }
        return loggedInUser; // Returns the specific user object
    }

    /**
     * Registers a new customer in the system.
     */
    public boolean registerCustomer(Customer customer) {
        boolean result = false;
        String query = "INSERT INTO users (name, email, phone, password, role) VALUES (?, ?, ?, ?, 'customer')";

        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement pst = con.prepareStatement(query)) {

            // Accessing data via getters (Encapsulation)
            pst.setString(1, customer.getName());
            pst.setString(2, customer.getEmail());
            pst.setString(3, customer.getPhone());
            pst.setString(4, customer.getPassword());

            int rowCount = pst.executeUpdate();
            if (rowCount > 0) {
                result = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    // Method to get all Admin users from the database for the management table
    public List<AdminUser> getAllAdmins() {
        List<AdminUser> adminList = new ArrayList<>();
        // SQL to select only admins (Main and Sub)
        String query = "SELECT * FROM users WHERE role IN ('main_admin', 'sub_admin')";

        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement pst = con.prepareStatement(query);
             ResultSet rs = pst.executeQuery()) {

            while (rs.next()) {
                AdminUser admin = new AdminUser();
                // Using setters to populate data (Encapsulation)
                admin.setId(rs.getInt("id"));
                admin.setName(rs.getString("name"));
                admin.setEmail(rs.getString("email"));
                admin.setPhone(rs.getString("phone"));
                admin.setRole(rs.getString("role"));

                // Getting the specific permissions we added to the DB
                admin.setCanManageEvents(rs.getBoolean("can_manage_events"));
                admin.setCanApproveBookings(rs.getBoolean("can_approve_bookings"));
                admin.setCanAddAdmins(rs.getBoolean("can_add_admins"));

                adminList.add(admin); // Adding each admin object to the list
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return adminList;
    }
}