package pack.model.admin;


import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import pack.controller.admin.NoticeBean;
import pack.utility.Pagination;

public interface NoticeSQLInter {
	@Select("select n_num,n_title,n_content,n_ano,DATE_FORMAT(n_sdate,'%Y/%m/%d') n_sdate,n_views,a_name "
			+ "from notice,admin "
			+ "where n_ano=a_num "
			+ "order by n_num desc "
			+ "limit #{start},#{length}")
	public List<NoticeDto> getNoticeList(Pagination pagination);
	
	@Select("select count(*) from notice")
	public int getTotalRows();
	
	@Select("select n_num,n_title,n_content,n_ano,DATE_FORMAT(n_sdate,'%Y/%m/%d') n_sdate,n_views,a_name "
			+ "from notice,admin "
			+ "where n_ano=a_num and n_num=#{n_num}")
	public NoticeDto getNoticeView(String n_num);
	
	@Update("update notice set n_views = n_views+1 where n_num=#{n_num}")
	public void plusViews(String n_num);
	
	@Insert("insert into notice(n_num,n_title,n_content,n_ano, n_sdate,n_views) "
			+ "values(null,#{n_title},#{n_content},#{n_ano},now(),0)")
	public int insertNotice(NoticeBean bean);
	
	@Update("update notice set n_title=#{n_title}, n_content=#{n_content}, n_ano=#{n_ano}, n_sdate=now() where n_num=#{n_num} ")
	public int updateNotice(NoticeBean bean);
	
	@Delete("delete from notice where n_num=#{n_num}")
	public int deleteNotice(String n_num);
	
	@Delete("delete from notice where n_ano=#{a_num}")
	public void deleteNoticeForAdminDelete(String a_num);
}
