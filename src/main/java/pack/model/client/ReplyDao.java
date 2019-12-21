package pack.model.client;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pack.controller.client.ReplyBean;
import pack.utility.Pagination;

@Repository
public class ReplyDao {
	@Autowired
	private ReplySQLInter inter;
	
	public ArrayList<ReplyDto> getBoardReply(Pagination pagination){
		return (ArrayList<ReplyDto>)inter.getBoardReply(pagination);
	}
	
	public int getBoardReplyCount(String r_bno) {
		return inter.getBoardReplyCount(r_bno);
	}
	
	public boolean insertReply(ReplyBean bean) {
		if(inter.insertReply(bean)>0) {
			return true;
		}else {
			return false;
		}
	}
	
	public boolean updateReply(ReplyBean bean) {
		if(inter.updateReply(bean)>0) {
			return true;
		}else {
			return false;
		}
	}
	
	public boolean deleteReply(String r_num) {
		if(inter.deleteReply(r_num)>0) {
			return true;
		}else {
			return false;
		}
	}
	
	public void deleteForBoardDelete(String b_num) {
		inter.deleteForBoardDelete(b_num);
	}
	
	public ArrayList<ReplyDto> getClientReply(Pagination pagination){
		return (ArrayList<ReplyDto>)inter.getClientReply(pagination);
	}
	
	public int getClientReplyCount(String m_num) {
		return inter.getClientReplyCount(m_num);
	}
	
	public boolean deleteRepleyForMemberDelete(String m_num) {
		if(inter.deleteRepleyForMemberDelete(m_num)>0) {
			return true;
		}else {
			return false;
		}
	}
}
