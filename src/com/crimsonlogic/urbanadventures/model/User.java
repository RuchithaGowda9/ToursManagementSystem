package com.crimsonlogic.urbanadventures.model;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 8122462416625435495L;
	private Long userId;
    private String firstName;
    private String lastName;
    private String email;
    private String phoneNumber;
    private String password;
    private String username;
    private String ID;
    private boolean isAdmin = false;
    
	public void setIsAdmin(boolean isAdmin2) {	
		this.isAdmin = isAdmin2;
	}

}
