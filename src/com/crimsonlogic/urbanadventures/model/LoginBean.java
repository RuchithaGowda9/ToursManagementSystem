package com.crimsonlogic.urbanadventures.model;

import java.io.Serializable;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class LoginBean implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -7801775842112793618L;
	
	private String username;
	private String password;
}
