package com.crimsonlogic.urbanadventures.model;

import java.sql.Date;
import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Booking {
	    private Long bookingId;
	    private Long userId;
	    private Long tourId;
	    private int numPeople;
	    private Date tourDate;
	    private LocalDateTime bookingDate;
}
