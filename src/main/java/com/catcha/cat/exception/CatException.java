package com.catcha.cat.exception;

public class CatException extends RuntimeException {

	private static final long serialVersionUID = 1L;

	public CatException(String message) {
		super(message);
	}
	
	public CatException(String message, Throwable cause) {
		super(message, cause);
	}
}
