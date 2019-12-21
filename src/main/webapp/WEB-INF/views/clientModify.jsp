<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="client_top.jsp" %>
    <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
    <!--main content start-->
    <section id="main-content">
        <section class="wrapper">
          <h3><i class="fa fa-angle-right"></i>회원 수정</h3>
          <!-- BASIC FORM ELELEMNTS -->
          <div class="row mt">
            <div class="col-lg-12">
              <div class="form-panel">
                <form class="form-horizontal style-form" method="post" action="modifyClient" name="modifyClientFrm">
                	<input type="hidden" name="m_num" value="${dto.m_num }">
                  <div class="form-group">
                    <label class="col-sm-2 control-label">이름</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" value="${dto.m_name}" name="m_name" id="m_name">
                      <div id="nameErrorMsg" class="text-danger" style="font-size: 14px;"></div>
                    </div>
                  </div>

                  <div class="form-group">
                    <div>
                      <label class="col-sm-2 control-label">핸드폰 번호</label>
                      <div class="col-sm-10">
                        <input type="text" value="${dto.m_phone1 }" name="m_phone1" id="m_phone1">&nbsp;<b>-</b>
                        <input type="text" value="${dto.m_phone2 }" name="m_phone2" id="m_phone2">&nbsp;<b>-</b>
                        <input type="text" value="${dto.m_phone3 }" name="m_phone3" id="m_phone3">
                        <div id="phoneErrorMsg" class="text-danger" style="font-size: 14px;"></div>
                      </div>
                    </div>  
                  </div>

                  <div class="form-group">
                      <label class="col-sm-2 control-label">비밀번호</label>
                      <div class="col-sm-10">
                        <input type="password" class="form-control" name="m_password" id="m_password">
                        <div id="pwdErrorMsg" class="text-danger" style="font-size: 14px;"></div>
                      </div>
                  </div>

                  <div class="form-group">
                      <div class="pull-right">
                         <div class="col-lg-12">
                             <button type="button" class="btn btn-theme" id="clientModifyChk">회원 정보 수정</button>
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
<%@ include file="client_bottom.jsp" %>
