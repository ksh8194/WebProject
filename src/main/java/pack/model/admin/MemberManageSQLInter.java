package pack.model.admin;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import pack.controller.admin.MemberManageBean;
import pack.utility.Pagination;

public interface MemberManageSQLInter {
	@Select("select m_num,m_email,m_name,m_password,m_phone1,m_phone2,m_phone3,m_state,m_grade,m_warning,DATE_FORMAT(m_regdate,'%Y/%m/%d') m_regdate "
			+ "from member "
			+ "order by m_num desc "
			+ "limit #{start},#{length} ")
	public List<MemberManageDto> getMemberList(Pagination pagination);
	
	@Select("select count(*) from member")
	public int getMemberCount();
	
	@Update("update member set m_state=#{m_state} where m_num=#{m_num} ")
	public int updateMemberState(MemberManageBean bean);
	
	@Delete("delete from member where m_num=#{m_num}")
	public int deleteMember(String m_num);
}
