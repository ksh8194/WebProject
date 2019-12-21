package pack.model.admin;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pack.controller.admin.AdminBean;
import pack.utility.Pagination;

@Repository
public class AdminDao {
	@Autowired
	private AdminSQLInter inter;
	
	public String aLogin(AdminBean bean) {
		if(inter.adminLogin(bean)==null) {
			return "fail";
		}else {
			return inter.adminLogin(bean).getA_num();
		}
	}
	
	public int getAdminCount() {
		return inter.getAdminCount();
	}
	
	public ArrayList<AdminDto> getAdminList(Pagination pagination){
		return (ArrayList<AdminDto>)inter.getAdminList(pagination);
	}
	
	public boolean emailChkForAdmin(String a_email) {
		if(inter.emailChkForAdmin(a_email)!= null) {
			return true;
		}else {
			return false;
		}
	}
	
	public boolean insertAdmin(AdminBean bean) {
		if(inter.insertAdmin(bean)>0) {
			return true;
		}else {
			return false;
		}
	}
	
	public AdminDto detailAdmin(String a_num) {
		return inter.detailAdmin(a_num);
	}
	
	public boolean updateAdmin(AdminBean bean) {
		if(inter.updateAdmin(bean)>0) {
			return true;
		}else {
			return false;
		}
	}
	
	public boolean deleteAdmin(String a_num) {
		if(inter.deleteAdmin(a_num)>0) {
			return true;
		}else {
			return false;
		}
	}
}
