<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="client_top.jsp" %>
    <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
    <!--main content start-->
    <section id="main-content">
        <section class="wrapper">
          <h3><i class="fa fa-angle-right"></i>비밀번호 수정</h3>
          <!-- BASIC FORM ELELEMNTS -->
          <div class="row mt">
            <div class="col-lg-12">
              <div class="form-panel">
                <form class="form-horizontal style-form" method="post" action="modifyClientPwd" name="frm">
                	<input type="hidden" name="m_num" value="${dto.m_num}">
                  <div class="form-group">
                      <label class="col-sm-2 control-label">기존 비밀번호</label>
                      <div class="col-sm-10">
                        <input type="password" class="form-control" name="m_password" id="m_password">
                        <div id="pwdErrorMsg" class="text-danger" style="font-size: 14px;"></div>
                      </div>
                  </div>
                  <div class="form-group">
                      <label class="col-sm-2 control-label">새 비밀번호</label>
                      <div class="col-sm-10">
                        <input type="password" class="form-control" name="m_newPassword" id="m_newPassword">
                        <div id="newPwdErrorMsg" class="text-danger" style="font-size: 14px;"></div>
                      </div>
                  </div>
                  <div class="form-group">
                      <label class="col-sm-2 control-label">새 비밀번호 확인</label>
                      <div class="col-sm-10">
                        <input type="password" class="form-control" id="m_newPwdChk">
                        <div id="newPwdchkErrorMsg" class="text-danger" style="font-size: 14px;"></div>
                      </div>
                  </div>

                  <div class="form-group">
                      <div class="pull-right">
                          <div class="col-lg-12">
                              <button type="button" class="btn btn-theme" id="clientModifyPwdChk">회원 정보 수정</button>
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
