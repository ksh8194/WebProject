package pack.controller.admin;

public class AdminBean {
	private String a_num, a_email,a_name,a_phone1,a_phone2,a_phone3,a_password;

	public String getA_num() {
		return a_num;
	}

	public void setA_num(String a_num) {
		this.a_num = a_num;
	}

	public String getA_email() {
		return a_email;
	}

	public void setA_email(String a_email) {
		this.a_email = a_email.trim();
	}

	public String getA_name() {
		return a_name;
	}

	public void setA_name(String a_name) {
		this.a_name = a_name.trim();
	}

	public String getA_phone1() {
		return a_phone1;
	}

	public void setA_phone1(String a_phone1) {
		this.a_phone1 = a_phone1.trim();
	}

	public String getA_phone2() {
		return a_phone2;
	}

	public void setA_phone2(String a_phone2) {
		this.a_phone2 = a_phone2.trim();
	}

	public String getA_phone3() {
		return a_phone3;
	}

	public void setA_phone3(String a_phone3) {
		this.a_phone3 = a_phone3.trim();
	}

	public String getA_password() {
		return a_password;
	}

	public void setA_password(String a_password) {
		this.a_password = a_password.trim();
	}
	
}
