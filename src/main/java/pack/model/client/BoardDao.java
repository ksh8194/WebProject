package pack.model.client;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pack.controller.client.BoardBean;
import pack.utility.Pagination;

@Repository
public class BoardDao {
	@Autowired
	private BoardSQLInter inter;
	
	public ArrayList<BoardDto> getBoardList(Pagination pagination){
		return (ArrayList<BoardDto>)inter.getboardList(pagination);
	}
	
	public int getTotalRows(String b_cno) {
		return inter.getTotalRows(b_cno);
	}
	
	public boolean insertBoard(BoardBean bean) {
		if(inter.insertBoard(bean)>0) {
			return true;
		}else {
			return false;
		}
	}
	
	public BoardDto getboardview(String b_num) {
		return inter.getboardview(b_num);
	}
	
	public void plusViews(String b_num) {
		inter.plusViews(b_num);
	}
	
	public boolean updateBoard(BoardBean bean) {
		if(inter.updateBoard(bean)>0) {
			return true;
		}else {
			return false;
		}
	}
	
	public boolean deleteBoard(String b_num) {
		if(inter.deleteBoard(b_num)>0) {
			return true;
		}else {
			return false;
		}
	}
	
	public ArrayList<BoardDto> getClientBoardList(Pagination pagination){
		return (ArrayList<BoardDto>)inter.getClientBoardList(pagination);
	}
	
	public int getClientBoardCount(String m_num) {
		return inter.getClientBoardCount(m_num);
	}
	
	public boolean deleteBoardForMemberDelete(String m_num) {
		if(inter.deleteBoardForMemberDelete(m_num)>0) {
			return true;
		}else {
			return false;
		}
	}
}
