package com.crimsonlogic.urbanadventures.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.crimsonlogic.urbanadventures.exceptions.IncorrectUsernamePasswordException;
import com.crimsonlogic.urbanadventures.model.LoginBean;
import com.crimsonlogic.urbanadventures.model.User;
import com.crimsonlogic.urbanadventures.utils.JDBCUtils;


public class LoginDao {

    public User validate(LoginBean loginBean) throws ClassNotFoundException, IncorrectUsernamePasswordException {
        User user = null;

        try (Connection connection = JDBCUtils.getConnection();
             PreparedStatement preparedStatement = connection
                     .prepareStatement("SELECT * FROM users WHERE user_name = ? AND user_password = ?")) {
            preparedStatement.setString(1, loginBean.getUsername());
            preparedStatement.setString(2, loginBean.getPassword());

            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setUserId(rs.getLong("user_id"));
                user.setFirstName(rs.getString("user_first_name"));
                user.setLastName(rs.getString("user_last_name"));
                user.setEmail(rs.getString("user_email"));
                user.setPhoneNumber(rs.getString("user_phone_no"));
                user.setPassword(rs.getString("user_password"));
                user.setUsername(rs.getString("user_name"));
                user.setIsAdmin(rs.getBoolean("isadmin"));
            } else {
                throw new IncorrectUsernamePasswordException("Incorrect username or password");
            }

        } catch (SQLException e) {
            JDBCUtils.printSQLException(e);
        }
        return user;
    }
}