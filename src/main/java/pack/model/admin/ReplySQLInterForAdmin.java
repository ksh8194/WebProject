package pack.model.admin;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import pack.utility.Pagination;

public interface ReplySQLInterForAdmin {
	@Select("select r_num,r_content,r_bno,DATE_FORMAT(r_sdate,'%Y/%m/%d') r_sdate,r_mno,r_ip,m_name "
			+ "from reply,member "
			+ "where r_mno=m_num and r_bno=#{b_num} "
			+ "order by r_num desc "
			+ "limit #{start},#{length}")
	public List<ReplyDtoForAdmin> getBoardReplyForAdmin(Pagination pagination);
	
	@Select("select count(*) "
			+ "from reply,member "
			+ "where r_mno=m_num and r_bno=#{r_bno}")
	public int getBoardReplyCountForAdmin(String r_bno);
	
	@Delete("delete from reply "
			+ "where r_num = #{r_num}")
	public int deleteReplyForAdmin(String r_num);
	
	@Delete("delete from reply "
			+ "where r_bno=#{b_num}")
	public void deleteForBoardDeleteForAdmin(String b_num);
	
	@Select("select r_num,r_content,r_bno,DATE_FORMAT(r_sdate,'%Y/%m/%d') r_sdate,r_mno,r_ip,m_name,b_cno "
			+ "from reply,member,board "
			+ "where r_mno=m_num and r_bno=b_num "
			+ "order by r_num desc "
			+ "limit #{start},#{length}")
	public List<ReplyDtoForAdmin> getAllReply(Pagination pagination);
	
	@Select("select count(*) from reply")
	public int getReplyCountForAdmin();
	
	@Delete("delete from reply where r_mno = #{m_num}")
	public void deleteRepleyForMemberDeleteForAdmin(String m_num);
	
}
