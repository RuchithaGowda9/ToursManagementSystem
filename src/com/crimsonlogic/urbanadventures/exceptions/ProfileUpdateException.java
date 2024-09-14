package com.crimsonlogic.urbanadventures.exceptions;

public class ProfileUpdateException extends Exception {
    /**
	 * 
	 */
	private static final long serialVersionUID = 6811442114518699854L;

	public ProfileUpdateException(String message) {
        super(message);
    }

    public ProfileUpdateException(String message, Throwable cause) {
        super(message, cause);
    }
}
