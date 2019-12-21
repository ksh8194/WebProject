package pack.model.admin;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pack.utility.Pagination;

@Repository
public class BoardDaoForAdmin {
	@Autowired
	private BoardSQLInterForAdmin inter;
	
	public ArrayList<BoardDtoForAdmin> getAllBoardList(Pagination pagination){
		return (ArrayList<BoardDtoForAdmin>) inter.getAllBoardList(pagination);
	}
	
	public int getAllBoardCount() {
		return inter.getAllBoardCount();
	}
	
	public ArrayList<BoardDtoForAdmin> getCategoryList(Pagination pagination){
		return (ArrayList<BoardDtoForAdmin>)inter.getCategoryList(pagination);
	}
	
	public int getCategoryListCount(String b_cno) {
		return inter.getCategoryListCount(b_cno);
	}
	
	public BoardDtoForAdmin getBoardView(String b_num) {
		return inter.getBoardView(b_num);
	}
	
	public boolean deleteBoard(String b_num) {
		if(inter.deleteBoard(b_num)>0) {
			return true;
		}else {
			return false;
		}
	}
	
	public void deleteBoardForMemberDeleteForAdmin(String m_num) {
		inter.deleteBoardForMemberDeleteForAdmin(m_num);
	}
}
