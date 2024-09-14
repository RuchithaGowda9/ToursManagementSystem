package com.crimsonlogic.urbanadventures.exceptions;

public class TourAdditionException extends Exception {
    /**
	 * 
	 */
	private static final long serialVersionUID = 4503588897416573148L;

	public TourAdditionException(String message) {
        super(message);
    }

    public TourAdditionException(String message, Throwable cause) {
        super(message, cause);
    }
}
