<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="client_top.jsp" %>
    <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
    <!--main content start-->
    <section id="main-content">
      <section class="wrapper">
          <h3 class="col-sm-10"><i class="fa fa-angle-right"></i>
          	<c:if test="${sidebar eq '2' }">스터디 게시판</c:if>
          	<c:if test="${sidebar eq '3' }">공모전 게시판</c:if>
          	<c:if test="${sidebar eq '4' }">친목 게시판</c:if>
          </h3>
          
          
          <div class="col-sm-2">
             <button type="button" class="btn btn-theme btn-lg pull-right" style="margin-top: 15px; margin-left: 30px;" onclick="location.href ='clientBoardView?page=${page}&b_num=${dto.b_num}&sidebar=${sidebar}&rpage=1'">돌아가기</button>
          </div>
        
        <div class="row mt">
          <div class="col-lg-12">
            <div class="form-panel">
              <form class="form-horizontal style-form" method="post" name="frm" action="clientBoardModify">
				<input type="hidden" value="${sessionScope.no}" name="b_mno">
              	<input type="hidden" value="<%=request.getRemoteAddr() %>" name="b_ip">
              	<input type="hidden" value="${sidebar}" name="sidebar">
              	<input type="hidden" value="${dto.b_num}" name="b_num"> 
              	<input type="hidden" value="${page}" name="page" >
                  <div class="form-group">
                      <div class="col-sm-2">
                        <select class="form-control" name="b_cno">
                            <option value="1" <c:if test="${sidebar eq '2'}">selected="selected"</c:if>>스터디게시판</option>
                            <option value="2" <c:if test="${sidebar eq '3'}">selected="selected"</c:if>>공모전게시판</option>
                            <option value="3" <c:if test="${sidebar eq '4'}">selected="selected"</c:if>>친목게시판</option>
                        </select>
                      </div>
                      <label class="col-sm-1 control-label">제목</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" value="${dto.b_title}" name="b_title" id="b_title">
                      </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-12 control-label">글 내용</label>
                    <div class="col-sm-12">
                      <textarea class="form-control" name="b_content" id="b_content" rows="5" style="height: 500px;">${dto.b_content}</textarea>
                    </div>
                  </div>
                  <div class="form-group">
                      <div class="pull-right">
                          <div class="col-lg-12">
                              <button type="button" class="btn btn-theme" id="boardChk">수정</button>
                            </div>
                      </div>    
                  </div>
              </form>
            </div>
          </div>
        </div>
        <!-- /row -->
        </section>
      </section>
      <!-- /wrapper -->
    <!--main content end-->
<%@ include file="client_bottom.jsp" %>
