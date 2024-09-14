package com.crimsonlogic.urbanadventures.exceptions;

public class UserAlreadyRegisteredException extends Exception {
    /**
	 * 
	 */
	private static final long serialVersionUID = 6536691432278601581L;

	public UserAlreadyRegisteredException(String message) {
        super(message);
    }
}
