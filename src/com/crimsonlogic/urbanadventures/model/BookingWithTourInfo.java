package com.crimsonlogic.urbanadventures.model;

import java.io.Serializable;
import java.sql.Date;
import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class BookingWithTourInfo implements Serializable {
    private static final long serialVersionUID = 1L;

    private Long bookingId;
    private Long tourId;
    private int numPeople; 
    private Date tourDate;
    private LocalDateTime bookingDate;
    private String tourName;
    private Double paymentAmount;
    
}
