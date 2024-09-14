package com.crimsonlogic.urbanadventures.model;


import java.math.BigDecimal;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Payment {
	private Long paymentId;
    private Long userId;
    private Long tourId;
    private Float paymentAmount;
    private String paymentMethod;
    private Timestamp paymentDate;
}
