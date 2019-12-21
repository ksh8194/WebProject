package pack.model.admin;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pack.utility.Pagination;

@Repository
public class ReplyDaoForAdmin {
	@Autowired
	private ReplySQLInterForAdmin inter;
	
	public ArrayList<ReplyDtoForAdmin> getBoardReplyForAdmin(Pagination pagination){
		return (ArrayList<ReplyDtoForAdmin>)inter.getBoardReplyForAdmin(pagination);
	}
	
	public int getBoardReplyCountForAdmin(String r_bno) {
		return inter.getBoardReplyCountForAdmin(r_bno);
	}
	
	public boolean deleteReplyForAdmin(String r_num) {
		if(inter.deleteReplyForAdmin(r_num)>0) {
			return true;
		}else {
			return false;
		}
	}
	
	public void deleteForBoardDeleteForAdmin(String b_num) {
		inter.deleteForBoardDeleteForAdmin(b_num);
	}
	
	public ArrayList<ReplyDtoForAdmin> getAllReply(Pagination pagination){
		return (ArrayList<ReplyDtoForAdmin>)inter.getAllReply(pagination);
	}
	
	public int getReplyCountForAdmin() {
		return inter.getReplyCountForAdmin();
	}
	
	public void deleteRepleyForMemberDeleteForAdmin(String m_num){
		inter.deleteRepleyForMemberDeleteForAdmin(m_num);
	}
	
}
