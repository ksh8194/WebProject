package pack.model.client;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pack.controller.client.MemberBean;

@Repository
public class MemberDao {
	@Autowired
	private MemberSQLInter inter;
	
	public boolean insertMember(MemberBean bean) {
		if(inter.insertMember(bean)>0) {
			return true;
		}else {
			return false;
		}
	}
	
	public boolean emailChk(String m_email) {
		if(inter.emailChk(m_email) != null) {
			return true;
		}else {
			return false;
		}
	}
	
	public String cLogin(MemberBean bean) {
		if(inter.clientlogin(bean)==null) {
			return "fail";
		}else {
			return inter.clientlogin(bean).getM_num();
		}
	}
	
	public MemberDto getClient(String m_num) {
		return inter.getClient(m_num);
	}
	
	public boolean updateMember(MemberBean bean) {
		if(inter.updateMember(bean)>0) {
			return true;
		}else {
			return false;
		}
	}
	
	public boolean updateMemberPwd(MemberBean bean) {
		if(inter.updateMemberPwd(bean)>0) {
			return true;
		}else {
			return false;
		}
	}
	
	public boolean deleteMember(String m_num) {
		if(inter.deleteMember(m_num)>0) {
			return true;
		}else {
			return false;
		}
	}
	
}
