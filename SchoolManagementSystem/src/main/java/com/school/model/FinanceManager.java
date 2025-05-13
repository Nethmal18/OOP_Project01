package com.school.model;

public class FinanceManager extends Staff {
	
	private String fm_id ;
	private String fm_role ;
	private int fm_budgetAllocationRights ;
	public FinanceManager(String stf_id, String stf_date, String stf_Fname, String stf_Lname, String stf_email,
			String stf_phone, String stf_address, String stf_NIC, String stf_DOB, float stf_salary, String stf_hireDate,
			String fm_id, String fm_role, int fm_budgetAllocationRights) {
		super(stf_id, stf_date, stf_Fname, stf_Lname, stf_email, stf_phone, stf_address, stf_NIC, stf_DOB, stf_salary,
				stf_hireDate);
		this.fm_id = fm_id;
		this.fm_role = fm_role;
		this.fm_budgetAllocationRights = fm_budgetAllocationRights;
	}
	public String getFm_id() {
		return fm_id;
	}
	public String getFm_role() {
		return fm_role;
	}
	public int getFm_budgetAllocationRights() {
		return fm_budgetAllocationRights;
	}
	
	
	

}
