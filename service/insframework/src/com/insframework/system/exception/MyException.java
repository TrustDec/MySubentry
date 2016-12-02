package com.insframework.system.exception;


/**
 * 自定义异常
 * @author guom
 *
 */
public class MyException extends Exception{
		
	private static final long serialVersionUID = 1L;

	public MyException(){
		super("自定义异常");
	}
	
	public MyException(String message){
		super(message);
	}

	@Override
	public String getMessage() {		
		return super.getMessage();
	}
	
}
