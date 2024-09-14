package com.crimsonlogic.urbanadventures.model;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Tour implements Serializable{
    public Tour(long long1, String string, String string2, double double1, int int1, String string3) {
		// TODO Auto-generated constructor stub
	}
	/**
	 * 
	 */
	private static final long serialVersionUID = 8538979512112209953L;
	private Long tourId;
    private String tourName;
    private String description;
    private Double price;
    private Integer availability;
    private String imageFileName; 
    private boolean isActive = true;
    
    public boolean getIsActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        this.isActive = active;
    }
}
