package com.crimsonlogic.urbanadventures.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.crimsonlogic.urbanadventures.model.Tour;
import com.crimsonlogic.urbanadventures.utils.JDBCUtils;

public class TourDao {

	public TourDao(Connection connection) {
	}

	public TourDao() {

	}

	public List<Tour> getAllTours() throws SQLException {
		List<Tour> tours = new ArrayList<>();
		String sql = "SELECT * FROM tours";

		try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement statement = connection.prepareStatement(sql);
				ResultSet resultSet = statement.executeQuery()) {

			while (resultSet.next()) {
				Tour tour = new Tour();
				tour.setTourId(resultSet.getLong("tour_id"));
				tour.setTourName(resultSet.getString("tour_name"));
				tour.setDescription(resultSet.getString("tour_description"));
				tour.setPrice(resultSet.getDouble("tour_price"));
				tour.setAvailability(resultSet.getInt("tour_availability"));
				tour.setImageFileName(resultSet.getString("tour_image"));
				tour.setActive(resultSet.getBoolean("isactive"));
				tours.add(tour);
			}
		}
		return tours;
	}

	public List<Tour> getAllActiveTours() throws SQLException {
		List<Tour> tours = new ArrayList<>();
		String sql = "SELECT tour_id,tour_name,tour_description,tour_price,tour_availability,tour_image FROM tours "
				+ "WHERE isactive = true";

		try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement statement = connection.prepareStatement(sql);
				ResultSet resultSet = statement.executeQuery()) {

			while (resultSet.next()) {
				Tour tour = new Tour();
				tour.setTourId(resultSet.getLong("tour_id"));
				tour.setTourName(resultSet.getString("tour_name"));
				tour.setDescription(resultSet.getString("tour_description"));
				tour.setPrice(resultSet.getDouble("tour_price"));
				tour.setAvailability(resultSet.getInt("tour_availability"));
				tour.setImageFileName(resultSet.getString("tour_image"));
				tours.add(tour);
			}
		}
		return tours;
	}

	public List<Tour> getToursByPlaceName(String placeName) {
		List<Tour> tours = new ArrayList<>();
		String query = "SELECT * FROM tours WHERE tour_name ILIKE ? AND isActive = true;"; // Ensure this matches your
																							// actual table schema

		try (Connection conn = JDBCUtils.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {

			// Debugging: Print the SQL query
			System.out.println("Executing query: " + query);

			stmt.setString(1, "%" + placeName + "%");

			try (ResultSet rs = stmt.executeQuery()) {
				while (rs.next()) {
					
					System.out.println("Tour ID: " + rs.getLong("tour_id"));
					System.out.println("Tour Name: " + rs.getString("tour_name"));
					System.out.println("Tour Description: " + rs.getString("tour_description"));
					System.out.println("Tour Price: " + rs.getDouble("tour_price"));
					System.out.println("Tour Availability: " + rs.getInt("tour_availability"));
					System.out.println("Tour Image: " + rs.getString("tour_image"));

					Tour tour = new Tour();
					tour.setTourId(rs.getLong("tour_id"));
					tour.setTourName(rs.getString("tour_name"));
					tour.setDescription(rs.getString("tour_description"));
					tour.setPrice(rs.getDouble("tour_price"));
					tour.setAvailability(rs.getInt("tour_availability"));
					tour.setImageFileName(rs.getString("tour_image"));
					tours.add(tour);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace(); // Log the exception
		}

		return tours;
	}

	public int addTour(Tour tour) throws SQLException {
		String insert = "INSERT INTO tours (tour_id, tour_name, tour_description, tour_price, tour_availability, tour_image, isactive) VALUES (?, ?, ?, ?, ?, ?,?)";
		try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(insert)) {
			pstmt.setLong(1, tour.getTourId());
			pstmt.setString(2, tour.getTourName());
			pstmt.setString(3, tour.getDescription());
			pstmt.setDouble(4, tour.getPrice());
			pstmt.setInt(5, tour.getAvailability());
			pstmt.setString(6, tour.getImageFileName());			
			pstmt.setBoolean(7, tour.getIsActive());;
			return pstmt.executeUpdate();
		}
	}

	public int activateTour(long tourId) throws SQLException {
		String update = "UPDATE tours SET isActive = true WHERE tour_id = ?";
		try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(update)) {
			pstmt.setLong(1, tourId);
			return pstmt.executeUpdate();
		}
	}

	public int deactivateTour(long tourId) throws SQLException {
		String update = "UPDATE tours SET isActive = false WHERE tour_id = ?";
		try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(update)) {
			pstmt.setLong(1, tourId);
			return pstmt.executeUpdate();
		}
	}

	public int updateTour(Tour tour) throws SQLException {
		String update = "UPDATE tours SET tour_name = ?, tour_description = ?, tour_price = ?, tour_availability = ?, tour_image = ? WHERE tour_id = ?";
		try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(update)) {
			pstmt.setString(1, tour.getTourName());
			pstmt.setString(2, tour.getDescription());
			pstmt.setDouble(3, tour.getPrice());
			pstmt.setInt(4, tour.getAvailability());
			pstmt.setString(5, tour.getImageFileName());
			pstmt.setLong(6, tour.getTourId());
			return pstmt.executeUpdate();
		}
	}

	public Tour getTourById(Long tourId) throws Exception {
		Tour tour = null;
		try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement statement = connection.prepareStatement("SELECT * FROM tours WHERE tour_id = ?")) {
			statement.setLong(1, tourId);
			ResultSet resultSet = statement.executeQuery();
			if (resultSet.next()) {
				tour = new Tour();
				tour.setTourId(resultSet.getLong("tour_id"));
				tour.setTourName(resultSet.getString("tour_name"));
				tour.setDescription(resultSet.getString("tour_description"));
				tour.setAvailability(resultSet.getInt("tour_availability"));
				tour.setPrice(resultSet.getDouble("tour_price"));
				tour.setImageFileName(resultSet.getString("tour_image"));
			}
		}
		return tour;
	}
	public String getTourNameById(int tourId) throws SQLException {
        String query = "SELECT tour_name FROM tours WHERE tour_id = ?";
        try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(query)) {
        	pstmt.setInt(1, tourId);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("tour_name");
                }
            }
        }
        return null;
    }

    // Method to get tour date by ID
    public Date getTourDateById(int tourId) throws SQLException {
        String query = "SELECT tour_date FROM tours WHERE tour_id = ?";
        try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(query)) {
        	pstmt.setInt(1, tourId);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getDate("tour_date");
                }
            }
        }
        return null;
    }
	
	public void updateAvailability(int tourId, int numPeople) throws SQLException {
        String sql = "UPDATE tours SET tour_availability = tour_availability - ? WHERE tour_id = ?";
        try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, numPeople);
            pstmt.setInt(2, tourId);
            pstmt.executeUpdate();
        }
    }
}
