package pack.model.client;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import pack.controller.client.BoardBean;
import pack.utility.Pagination;

public interface BoardSQLInter {
	@Select("select b_num,b_cno,b_title,b_content,b_mno,b_ip,DATE_FORMAT(b_sdate,'%Y/%m/%d') b_sdate,DATE_FORMAT(b_udate,'%Y/%m/%d') b_udate,b_views,m_name,c_name "
			+ "from board,member,category "
			+ "where b_cno=c_num and b_mno = m_num and b_cno = #{b_cno} "
			+ "order by b_num desc "	
			+ "limit #{start},#{length} ")
	public List<BoardDto> getboardList(Pagination pagination);
	
	@Select("select count(*) "
			+ "from board,member,category "
			+ "where b_cno=c_num and b_mno = m_num and b_cno = #{b_cno}")
	public int getTotalRows(String b_cno);
	
	@Insert("insert into board(b_num,b_cno,b_title,b_content,b_mno,b_ip,b_sdate,b_udate,b_views) "
			+ "values (null,#{b_cno},#{b_title},#{b_content},#{b_mno},#{b_ip},now(),now(),0)")
	public int insertBoard(BoardBean bean);
	
	@Select("select b_num,b_cno,b_title,b_content,b_mno,b_ip,DATE_FORMAT(b_sdate,'%Y/%m/%d') b_sdate,DATE_FORMAT(b_udate,'%Y/%m/%d') b_udate,b_views,m_name,c_name "
			+ "from board,member,category "
			+ "where b_cno=c_num and b_mno = m_num and b_num=#{b_num}")
	public BoardDto getboardview(String b_num);
	
	@Update("update board set b_views=b_views+1 where b_num=#{num}")
	public void plusViews(String num);
	
	@Update("update board "
			+ "set b_cno=#{b_cno}, b_title=#{b_title}, b_content=#{b_content}, b_ip=#{b_ip}, b_udate=now() "
			+ "where b_num=#{b_num}")
	public int updateBoard(BoardBean bean);
	
	@Delete("delete from board where b_num=#{b_num}")
	public int deleteBoard(String b_num);
	
	@Select("select b_num,b_cno,b_title,b_content,b_mno,b_ip,DATE_FORMAT(b_sdate,'%Y/%m/%d') b_sdate,DATE_FORMAT(b_udate,'%Y/%m/%d') b_udate,b_views,m_name,c_name "
			+ "from board,member,category "
			+ "where b_cno=c_num and b_mno=m_num and b_mno = #{m_num} "
			+ "order by b_num desc "	
			+ "limit #{start},#{length} ")
	public List<BoardDto> getClientBoardList(Pagination pagination);
	
	@Select("select count(*) from board where b_mno = #{m_num} ")
	public int getClientBoardCount(String m_num);
	
	@Delete("delete from board where b_mno=#{m_num}")
	public int deleteBoardForMemberDelete(String m_num);
	
}
