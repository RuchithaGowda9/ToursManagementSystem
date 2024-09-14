package com.crimsonlogic.urbanadventures.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.crimsonlogic.urbanadventures.exceptions.ProfileUpdateException;
import com.crimsonlogic.urbanadventures.exceptions.UserAlreadyRegisteredException;
import com.crimsonlogic.urbanadventures.exceptions.UserRegistrationException;
import com.crimsonlogic.urbanadventures.exceptions.UsernameNotAvailableException;
import com.crimsonlogic.urbanadventures.model.User;
import com.crimsonlogic.urbanadventures.utils.JDBCUtils;

public class UserDao {
	
	public int registerUser(User user) throws UsernameNotAvailableException,UserRegistrationException, UserAlreadyRegisteredException,SQLException {
	    
		if (isUsernameExists(user.getUsername())) {
            throw new UsernameNotAvailableException("Username is not available");
        }
        if (isPhoneNumberExists(user.getPhoneNumber())) {
            throw new UserAlreadyRegisteredException("Phone number is already registered");
        }
		
		String insert_users = "INSERT INTO users(\r\n" + 
	    		"	user_id, user_first_name, user_last_name, user_email, user_phone_no, user_password, user_name, id_proof)\r\n" + 
	    		"	VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
	    int result = 0;
	    try (Connection connection = JDBCUtils.getConnection();
	         PreparedStatement preparedStatement = connection.prepareStatement(insert_users)) {

	        preparedStatement.setLong(1, user.getUserId());
	        preparedStatement.setString(2, user.getFirstName());
	        preparedStatement.setString(3, user.getLastName());
	        preparedStatement.setString(4, user.getEmail());
	        preparedStatement.setString(5, user.getPhoneNumber());
	        preparedStatement.setString(6, user.getPassword());
	        preparedStatement.setString(7, user.getUsername());
	        preparedStatement.setString(8, user.getID());
	        System.out.println(preparedStatement);
	        result = preparedStatement.executeUpdate();
	    } catch (SQLException e) {
	        JDBCUtils.printSQLException(e);
	        throw new UserRegistrationException("Error registering user", e);
	    }
	    return result;
	}
	public User getUserByUsername(String username) throws SQLException {
	    String sql = "SELECT * FROM users WHERE user_name = ?";
	    User user = null;
	    
	    try (Connection connection = JDBCUtils.getConnection();
	         PreparedStatement statement = connection.prepareStatement(sql)) {
	        statement.setString(1, username);
	        ResultSet resultSet = statement.executeQuery();
	        
	        if (resultSet.next()) {
	            user = new User();
	            user.setUserId(resultSet.getLong("user_id"));
	            user.setFirstName(resultSet.getString("user_first_name"));
	            user.setLastName(resultSet.getString("user_last_name"));
	            user.setEmail(resultSet.getString("user_email"));
	            user.setPhoneNumber(resultSet.getString("user_phone_no"));
	            user.setUsername(resultSet.getString("user_name"));
	            user.setPassword(resultSet.getString("user_password"));
	        }
	    }
	    
	    return user;
	}

	public boolean isUsernameExists(String username) throws SQLException {
        String sql = "SELECT * FROM users WHERE user_name = ?";
        try (Connection connection = JDBCUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, username);
            ResultSet resultSet = statement.executeQuery();
            return resultSet.next();
        }
    }

    public boolean isPhoneNumberExists(String phoneNumber) throws SQLException {
        String sql = "SELECT * FROM users WHERE user_phone_no = ?";
        try (Connection connection = JDBCUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, phoneNumber);
            ResultSet resultSet = statement.executeQuery();
            return resultSet.next();
        }
    }
   

    public boolean updateUser(User user) throws ProfileUpdateException {
        String sql = "UPDATE users SET user_first_name = ?, user_last_name = ?, user_email = ?, user_phone_no= ?, user_name = ? WHERE user_id = ? ";

        try (Connection connection = JDBCUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            // Set parameters for the PreparedStatement
            statement.setString(1, user.getFirstName());
            statement.setString(2, user.getLastName());
            statement.setString(3, user.getEmail());
            statement.setString(4, user.getPhoneNumber());
            statement.setString(5, user.getUsername());
            statement.setLong(6, user.getUserId());

            // Execute the update
            int rowsUpdated = statement.executeUpdate();

            // Check if any rows were updated
            if (rowsUpdated > 0) {
                return true;
            } else {
                throw new ProfileUpdateException("Failed to update profile: No rows affected.");
            }

        } catch (SQLException e) {
            throw new ProfileUpdateException("Database error occurred while updating profile.", e);
        }
    }


}
