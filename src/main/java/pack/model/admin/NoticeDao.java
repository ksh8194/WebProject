package pack.model.admin;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pack.controller.admin.NoticeBean;
import pack.utility.Pagination;

@Repository
public class NoticeDao {
	@Autowired
	private NoticeSQLInter inter;
	
	public ArrayList<NoticeDto> getNoticeList(Pagination pagination){
		return (ArrayList<NoticeDto>)inter.getNoticeList(pagination);
	}
	
	public int getTotalRows() {
		return inter.getTotalRows();
	}
	
	public NoticeDto getNoticeView(String n_num) {
		return inter.getNoticeView(n_num);
	}
	
	public void plusViews(String n_num) {
		inter.plusViews(n_num);
	}
	
	public boolean insertNotice(NoticeBean bean) {
		if(inter.insertNotice(bean)>0) {
			return true;
		}else {
			return false;
		}
	}
	
	public boolean updateNotice(NoticeBean bean) {
		if(inter.updateNotice(bean)>0) {
			return true;
		}else {
			return false;
		}
	}
	
	public boolean deleteNotice(String n_num) {
		if(inter.deleteNotice(n_num)>0) {
			return true;
		}else {
			return false;
		}
	}
	
	public void deleteNoticeForAdminDelete(String a_num) {
		inter.deleteNoticeForAdminDelete(a_num);
	}
}
