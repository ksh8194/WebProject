package pack.controller.admin;

import pack.utility.Utility;

public class NoticeBean {
	private String n_num,n_title,n_content,n_ano,n_sdate,n_views;

	public String getN_num() {
		return n_num;
	}

	public void setN_num(String n_num) {
		this.n_num = n_num;
	}

	public String getN_title() {
		return n_title;
	}

	public void setN_title(String n_title) {
		this.n_title = Utility.getConvert(n_title).trim();
	}

	public String getN_content() {
		return n_content;
	}

	public void setN_content(String n_content) {
		this.n_content = Utility.getConvert(n_content).trim();
	}

	public String getN_ano() {
		return n_ano;
	}

	public void setN_ano(String n_ano) {
		this.n_ano = n_ano;
	}

	public String getN_sdate() {
		return n_sdate;
	}

	public void setN_sdate(String n_sdate) {
		this.n_sdate = n_sdate;
	}

	public String getN_views() {
		return n_views;
	}

	public void setN_views(String n_views) {
		this.n_views = n_views;
	}
	
}
