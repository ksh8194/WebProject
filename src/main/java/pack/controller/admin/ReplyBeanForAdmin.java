package pack.controller.admin;

import pack.utility.Utility;

public class ReplyBeanForAdmin {
	private String r_num,r_content,r_bno,r_sdate,r_mno,r_ip;
	private String m_name;
	private String b_cno;
	
	public String getR_num() {
		return r_num;
	}
	public void setR_num(String r_num) {
		this.r_num = r_num;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = Utility.getConvert(r_content).trim();
	}
	public String getR_bno() {
		return r_bno;
	}
	public void setR_bno(String r_bno) {
		this.r_bno = r_bno;
	}
	public String getR_sdate() {
		return r_sdate;
	}
	public void setR_sdate(String r_sdate) {
		this.r_sdate = r_sdate;
	}
	public String getR_mno() {
		return r_mno;
	}
	public void setR_mno(String r_mno) {
		this.r_mno = r_mno;
	}
	public String getR_ip() {
		return r_ip;
	}
	public void setR_ip(String r_ip) {
		this.r_ip = r_ip;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getB_cno() {
		return b_cno;
	}
	public void setB_cno(String b_cno) {
		this.b_cno = b_cno;
	}
	
}
