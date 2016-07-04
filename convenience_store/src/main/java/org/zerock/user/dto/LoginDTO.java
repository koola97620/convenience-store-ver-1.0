package org.zerock.user.dto;

/**
 * 스프링 MVC를 이용하는 경우 DTO는 검증을 위한 처리가 들어간다.
 * @author kjlee
 *
 */
public class LoginDTO {

	private String email;
	private String password;
	private boolean useCookie;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public boolean isUseCookie() {
		return useCookie;
	}
	public void setUseCookie(boolean useCookie) {
		this.useCookie = useCookie;
	}
	
	@Override
	public String toString() {
		return "LoginDTO [email=" + email + ", password=" + password + ", useCookie=" + useCookie + "]";
	}
	
}
