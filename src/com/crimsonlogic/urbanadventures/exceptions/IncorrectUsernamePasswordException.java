package com.crimsonlogic.urbanadventures.exceptions;


public class IncorrectUsernamePasswordException extends Exception {
    /**
	 * 
	 */
	private static final long serialVersionUID = 6275672626013385822L;

	public IncorrectUsernamePasswordException(String message) {
        super(message);
    }
}
