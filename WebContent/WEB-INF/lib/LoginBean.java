package com.crimsonlogic.sampleservletjspproject.model;

import java.io.Serializable;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class LoginBean implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 3825736592260930030L;


	
	private String username;
	private String password;

}
