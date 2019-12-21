package pack.model.admin;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import pack.controller.admin.AdminBean;
import pack.utility.Pagination;

public interface AdminSQLInter {
	@Select("select a_num from admin where a_email=#{a_email} and a_password=password(#{a_password})")
	public AdminDto adminLogin(AdminBean bean);
	
	@Select("select count(*) from admin")
	public int getAdminCount();
	
	@Select("select a_num, a_email,a_name,a_phone1,a_phone2,a_phone3,a_password "
			+ "from admin "
			+ "order by a_num desc "
			+ "limit #{start},#{length} ")
	public List<AdminDto> getAdminList(Pagination pagination);
	
	@Select("select * from admin where a_email=#{a_email}")
	public AdminDto emailChkForAdmin(String a_email);
	
	@Insert("insert into admin(a_num, a_email,a_name,a_phone1,a_phone2,a_phone3,a_password) "
			+ "values(null,#{a_email},#{a_name},#{a_phone1},#{a_phone2},#{a_phone3},password(#{a_password}))")
	public int insertAdmin(AdminBean bean);
	
	@Select("select a_num, a_email,a_name,a_phone1,a_phone2,a_phone3,a_password from admin where a_num=#{a_num}")
	public AdminDto detailAdmin(String a_num);
	
	@Update("update admin set a_name=#{a_name} , a_phone1=#{a_phone1}, a_phone2=#{a_phone2}, a_phone3=#{a_phone3} where a_num=#{a_num}")
	public int updateAdmin(AdminBean bean);
	
	@Delete("delete from admin where a_num=#{a_num}")
	public int deleteAdmin(String a_num);
}
