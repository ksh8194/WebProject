<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="admin_top.jsp" %>
    <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
    <!--main content start-->
    <section id="main-content">
      <section class="wrapper">
        <h3><i class="fa fa-angle-right"></i>관리자 수정</h3>
        <div class="row mt">
            <div class="col-lg-12">
              <div class="form-panel">
              
                <form class="form-horizontal style-form" method="post" action="adminModify" name="frm">
					<input type="hidden" name="page" value="${page}">
					<input type="hidden" name="a_num" value="${dto.a_num }"> 
                  <div class="form-group">
                    <label class="col-sm-2 control-label">이름</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="a_name" name="a_name" value="${dto.a_name}">
                      <div id="nameErrorMsg" class="text-danger col-sm-10" style="font-size: 14px; margin-top: 10px;"></div>
                    </div>
                  </div>

                  <div class="form-group">
                    <div>
                      <label class="col-sm-2 control-label">핸드폰 번호</label>
                      <div class="col-sm-10">
                        <input type="text" id="a_phone1" name="a_phone1" value="${dto.a_phone1 }">&nbsp;<b>-</b>
                        <input type="text" id="a_phone2" name="a_phone2" value="${dto.a_phone2 }">&nbsp;<b>-</b>
                        <input type="text" id="a_phone3" name="a_phone3" value="${dto.a_phone3 }">
                        <div id="phoneErrorMsg" class="text-danger col-sm-10" style="font-size: 14px; margin-top: 10px;"></div>  
                      </div>
                    </div>
                  </div>
                  
                  <div class="form-group">
                      <div class="pull-right">
                          <div class="col-lg-12">
                              <button type="button" class="btn btn-theme" id="modifyChk">관리자 수정</button>
                              <button type="button" class="btn btn-theme" onclick = "location.href ='adminManage?page=${page}'">리스트</button>
                          </div>
                      </div>    
                  </div>
                </form>
              </div>
            </div>
          </div>



      </section>
    </section>
    <!--main content end-->
<%@ include file="admin_bottom.jsp"%>