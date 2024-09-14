package com.crimsonlogic.urbanadventures.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.SQLException;


public class PaymentDao {
    private Connection connection;

    public PaymentDao(Connection connection) {
        this.connection = connection;
    }

    public void addPayment(int paymentId, Long userId, int tourId, double amount, String paymentMethod) throws SQLException {
        String sql = "INSERT INTO payment (payment_id, user_id, tour_id, payment_amount, payment_method) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, paymentId);
            pstmt.setLong(2, userId);
            pstmt.setInt(3, tourId);
            pstmt.setDouble(4, amount);
            pstmt.setString(5, paymentMethod);
            pstmt.executeUpdate();
        }
    }
}
