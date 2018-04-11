package com.hexa.dao;

public class OutOfStockException extends Exception{
	
	/**
	 * @param message to print the error message
	 * @param cause To show cause of Exception
	 */
	public OutOfStockException(String message, Throwable cause) {
		super(message, cause);
		// TODO Auto-generated constructor stub
	}

	/**
	 * 
	 * @param message to show the error message
	 */
	public OutOfStockException(String message) {
		super(message);
		// TODO Auto-generated constructor stub
	}
}
