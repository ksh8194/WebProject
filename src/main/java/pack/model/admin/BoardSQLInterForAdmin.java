package pack.model.admin;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import pack.utility.Pagination;

public interface BoardSQLInterForAdmin {
	@Select("select b_num,b_cno,b_title,b_content,b_mno,b_ip,DATE_FORMAT(b_sdate,'%Y/%m/%d') b_sdate,DATE_FORMAT(b_udate,'%Y/%m/%d') b_udate,b_views,m_name,c_name "
			+ "from board,member,category "
			+ "where b_cno=c_num and b_mno = m_num "
			+ "order by b_num desc "
			+ "limit #{start},#{length} ")
	public List<BoardDtoForAdmin> getAllBoardList(Pagination pagination);
	
	@Select("select count(*) from board")
	public int getAllBoardCount();
	
	@Select("select b_num,b_cno,b_title,b_content,b_mno,b_ip,DATE_FORMAT(b_sdate,'%Y/%m/%d') b_sdate,DATE_FORMAT(b_udate,'%Y/%m/%d') b_udate,b_views,m_name,c_name "
			+ "from board,member,category "
			+ "where b_cno=c_num and b_mno = m_num and b_cno=#{b_cno}"
			+ "order by b_num desc "
			+ "limit #{start},#{length} ")
	public List<BoardDtoForAdmin> getCategoryList(Pagination pagination);
	
	@Select("select count(*) from board where b_cno=#{b_cno}")
	public int getCategoryListCount(String b_cno);
	
	@Select("select b_num,b_cno,b_title,b_content,b_mno,b_ip,DATE_FORMAT(b_sdate,'%Y/%m/%d') b_sdate,DATE_FORMAT(b_udate,'%Y/%m/%d') b_udate,b_views,m_name,c_name "
			+ "from board,member,category "
			+ "where b_cno=c_num and b_mno = m_num and b_num=#{b_num}")
	public BoardDtoForAdmin getBoardView(String b_num);
	
	@Delete("delete from board where b_num=#{b_num}")
	public int deleteBoard(String b_num);
	
	@Delete("delete from board where b_mno=#{m_num}")
	public int deleteBoardForMemberDeleteForAdmin(String m_num);
}
