package pack.model.client;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import pack.controller.client.ReplyBean;
import pack.utility.Pagination;

public interface ReplySQLInter {
	@Select("select r_num,r_content,r_bno,DATE_FORMAT(r_sdate,'%Y/%m/%d') r_sdate,r_mno,r_ip,m_name "
			+ "from reply,member "
			+ "where r_mno=m_num and r_bno=#{b_num} "
			+ "order by r_num desc "
			+ "limit #{start},#{length}")
	public List<ReplyDto> getBoardReply(Pagination pagination);
	
	@Select("select count(*) "
			+ "from reply,member "
			+ "where r_mno=m_num and r_bno=#{r_bno}")
	public int getBoardReplyCount(String r_bno);
	
	@Insert("insert into reply(r_num,r_content,r_bno,r_sdate,r_mno,r_ip) "
			+ "values(null,#{r_content},#{r_bno},now(),#{r_mno},#{r_ip}) ")
	public int insertReply(ReplyBean bean);
	
	@Update("update reply "
			+ "set r_content=#{r_content},r_sdate=now(),r_ip=#{r_ip} "
			+ "where r_num = #{r_num} ")
	public int updateReply(ReplyBean bean);
	
	@Delete("delete from reply "
			+ "where r_num = #{r_num}")
	public int deleteReply(String r_num);
	
	@Delete("delete from reply "
			+ "where r_bno=#{b_num}")
	public void deleteForBoardDelete(String b_num);
	
	@Select("select r_num,r_content,r_bno,DATE_FORMAT(r_sdate,'%Y/%m/%d') r_sdate,r_mno,r_ip,m_name,b_cno "
			+ "from reply,member,board "
			+ "where r_mno=m_num and r_bno=b_num and r_mno=#{m_num} "
			+ "order by r_num desc "
			+ "limit #{start},#{length}")
	public List<ReplyDto> getClientReply(Pagination pagination);
	
	@Select("select count(*) from reply where r_mno=#{m_num}")
	public int getClientReplyCount(String m_num);
	
	@Delete("delete from reply where r_mno = #{m_num}")
	public int deleteRepleyForMemberDelete(String m_num);
}
