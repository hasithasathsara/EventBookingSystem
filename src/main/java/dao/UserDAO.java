package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import model.Customer;
import utils.DatabaseConnection;


public class UserDAO {

    // meth that add user into the database
    public boolean registerCustomer(Customer customer) {
        boolean rowInserted = false;

        // SQL Query
        String INSERT_USER_SQL = "INSERT INTO users (name, email, phone, password, role) VALUES (?, ?, ?, ?, ?)";

        // Database Connection
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER_SQL)) {

            // Give data into the Query (Mapping)
            preparedStatement.setString(1, customer.getName());
            preparedStatement.setString(2, customer.getEmail());
            preparedStatement.setString(3, customer.getPhone());
            preparedStatement.setString(4, customer.getPassword());
            preparedStatement.setString(5, customer.getRole());

            // Query Execution
            rowInserted = preparedStatement.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowInserted;
    }
}