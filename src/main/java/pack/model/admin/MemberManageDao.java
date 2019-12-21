package pack.model.admin;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pack.controller.admin.MemberManageBean;
import pack.utility.Pagination;

@Repository
public class MemberManageDao {
	@Autowired
	private MemberManageSQLInter inter;
	
	public ArrayList<MemberManageDto> getMemberList(Pagination pagination){
		return (ArrayList<MemberManageDto>)inter.getMemberList(pagination);
	}
	
	public int getMemberCount() {
		return inter.getMemberCount();
	}
	
	public boolean updateMemberState(MemberManageBean bean) {
		if(inter.updateMemberState(bean)>0) {
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
