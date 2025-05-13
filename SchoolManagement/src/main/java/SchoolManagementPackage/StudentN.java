package SchoolManagementPackage;

public class StudentN {
	private int std_id;
	private String std_Fname;
	private String std_Lname;
	private String std_email;
	private String std_phone;
	private String std_address;
	private String std_NIC;
	private String std_DOB;
	private String std_password;
	
	public StudentN(int std_id, String std_Fname, String std_Lname, String std_email, String std_phone,
			String std_address, String std_NIC, String std_DOB, String std_password) {
		super();
		this.std_id = std_id;
		this.std_Fname = std_Fname;
		this.std_Lname = std_Lname;
		this.std_email = std_email;
		this.std_phone = std_phone;
		this.std_address = std_address;
		this.std_NIC = std_NIC;
		this.std_DOB = std_DOB;
		this.std_password = std_password;
	}

	public int getStd_id() {
		return std_id;
	}

	public void setStd_id(int std_id) {
		this.std_id = std_id;
	}

	public String getStd_Fname() {
		return std_Fname;
	}

	public void setStd_Fname(String std_Fname) {
		this.std_Fname = std_Fname;
	}

	public String getStd_Lname() {
		return std_Lname;
	}

	public void setStd_Lname(String std_Lname) {
		this.std_Lname = std_Lname;
	}

	public String getStd_email() {
		return std_email;
	}

	public void setStd_email(String std_email) {
		this.std_email = std_email;
	}

	public String getStd_phone() {
		return std_phone;
	}

	public void setStd_phone(String std_phone) {
		this.std_phone = std_phone;
	}

	public String getStd_address() {
		return std_address;
	}

	public void setStd_address(String std_address) {
		this.std_address = std_address;
	}

	public String getStd_NIC() {
		return std_NIC;
	}

	public void setStd_NIC(String std_NIC) {
		this.std_NIC = std_NIC;
	}

	public String getStd_DOB() {
		return std_DOB;
	}

	public void setStd_DOB(String std_DOB) {
		this.std_DOB = std_DOB;
	}

	public String getStd_password() {
		return std_password;
	}

	public void setStd_password(String std_password) {
		this.std_password = std_password;
	}
	
	
	
	
}
