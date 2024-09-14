package com.crimsonlogic.urbanadventures.dao;

import java.sql.Connection;

import java.sql.Date; // Use java.sql.Date for SQL DATE type
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.crimsonlogic.urbanadventures.model.BookingWithTourInfo;
import com.crimsonlogic.urbanadventures.utils.JDBCUtils;

public class BookingDao {

	public BookingDao(Connection connection) {

	}

	public BookingDao() {
		// TODO Auto-generated constructor stub
	}

	public void addBooking(int bookingId, Long userId, int tourId, int numPeople, Date tourDate) throws SQLException {
		String sql = "INSERT INTO booking (booking_id, user_id, tour_id, num_people, tour_date) VALUES (?, ?, ?, ?, ?)";
		try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(sql)) {
			pstmt.setInt(1, bookingId);
			pstmt.setLong(2, userId);
			pstmt.setInt(3, tourId);
			pstmt.setInt(4, numPeople);
			pstmt.setDate(5, tourDate);
			pstmt.executeUpdate();
		}
	}

	public List<BookingWithTourInfo> getBookingsWithTourInfo() throws SQLException {
		String sql = "SELECT b.booking_id, b.tour_id, b.num_people, b.tour_date, b.booking_date, t.tour_name "
				+ "FROM booking b INNER JOIN tours t ON b.tour_id = t.tour_id";

		List<BookingWithTourInfo> bookingWithTourInfoList = new ArrayList<>();

		try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()) {

			while (rs.next()) {
				BookingWithTourInfo info = new BookingWithTourInfo();
				info.setBookingId(rs.getLong("booking_id"));
				info.setTourId(rs.getLong("tour_id"));
				info.setNumPeople(rs.getInt("num_people")); // Ensure this field exists in Booking class
				info.setTourDate(rs.getDate("tour_date"));
				info.setBookingDate(rs.getTimestamp("booking_date").toLocalDateTime());
				info.setTourName(rs.getString("tour_name"));

				bookingWithTourInfoList.add(info);
			}
		}

		return bookingWithTourInfoList;
	}
	public List<BookingWithTourInfo> getBookingsByUserId(Long userId) throws SQLException {
	    List<BookingWithTourInfo> bookings = new ArrayList<>();
	    String sql = "SELECT b.booking_id, b.tour_id, b.num_people, b.tour_date, b.booking_date, t.tour_name, p.payment_amount \r\n" + 
	    		"FROM booking b \r\n" + 
	    		"JOIN tours t ON b.tour_id = t.tour_id \r\n" + 
	    		"JOIN payment p ON b.tour_id = p.tour_id AND b.user_id = p.user_id \r\n" + 
	    		"WHERE b.user_id = ?;\r\n" + 
	    		"";
	    
	    try (Connection connection = JDBCUtils.getConnection();
	         PreparedStatement stmt = connection.prepareStatement(sql)) {
	        stmt.setLong(1, userId);
	        try (ResultSet rs = stmt.executeQuery()) {
	            while (rs.next()) {
	                BookingWithTourInfo booking = new BookingWithTourInfo();
	                booking.setBookingId(rs.getLong("booking_id"));
	                booking.setTourId(rs.getLong("tour_id"));
	                booking.setNumPeople(rs.getInt("num_people"));
	                booking.setTourDate(rs.getDate("tour_date"));
	                booking.setBookingDate(rs.getTimestamp("booking_date").toLocalDateTime());
	                booking.setTourName(rs.getString("tour_name"));
	                booking.setPaymentAmount(rs.getDouble("payment_amount"));
	                bookings.add(booking);
	            }
	        }
	    }
	    return bookings;
	}


}
