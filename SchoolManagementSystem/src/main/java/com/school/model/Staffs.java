package com.school.model;

public class Staffs {
	 
	private String  stf_id ;
	private String stf_date;
	private String stf_Fname; 
	private String stf_Lname; 
	private String stf_email; 
	private String stf_phone; 
	private String stf_address; 
	private String stf_NIC ;
	private String stf_DOB ;
	private float stf_salary ;
	private String stf_hireDate ;
	private String stf_password ;
	public Staffs(String stf_id, String stf_date, String stf_Fname, String stf_Lname, String stf_email, String stf_phone,
			String stf_address, String stf_NIC, String stf_DOB, float stf_salary, String stf_hireDate) {
		
		this.stf_id = stf_id;
		this.stf_date = stf_date;
		this.stf_Fname = stf_Fname;
		this.stf_Lname = stf_Lname;
		this.stf_email = stf_email;
		this.stf_phone = stf_phone;
		this.stf_address = stf_address;
		this.stf_NIC = stf_NIC;
		this.stf_DOB = stf_DOB;
		this.stf_salary = stf_salary;
		this.stf_hireDate = stf_hireDate;
		this.stf_password=stf_password;
	}
	public Staffs(String stf_id1, String stf_passwords) {
		this.stf_id = stf_id1;
		this.stf_password=stf_passwords;
		
	}
	public String getStf_id() {
		return stf_id;
	}

	public String getStf_date() {
		return stf_date;
	}

	
	public String getStf_Fname() {
		return stf_Fname;
	}

	
	public String getStf_Lname() {
		return stf_Lname;
	}

	public String getStf_email() {
		return stf_email;
	}
	
	public String getStf_phone() {
		return stf_phone;
	}

	public String getStf_address() {
		return stf_address;
	}

	public String getStf_NIC() {
		return stf_NIC;
	}

	public String getStf_DOB() {
		return stf_DOB;
	}

	public float getStf_salary() {
		return stf_salary;
	}

	public String getStf_hireDate() {
		return stf_hireDate;
	}
	public String getStf_password() {
		return stf_password;
	}

	

}
