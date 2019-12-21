<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="client_top.jsp" %>
    <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
    <!--main content start-->
    <section id="main-content">
      <section class="wrapper">
        <h3><i class="fa fa-angle-right"></i>게시판 이름</h3>
        
        <div class="row mt">
          <div class="col-lg-12">
            <div class="form-panel">
              <form class="form-horizontal style-form" method="post" action="clientBoardCreate" name="frm">
              	<input type="hidden" value="${sessionScope.no}" name="b_mno">
              	<input type="hidden" value="<%=request.getRemoteAddr() %>" name="b_ip">
              	<input type="hidden" value="${sidebar}" name="sidebar">
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
                        <input type="text" class="form-control" name="b_title" id="b_title">
                      </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-12 control-label">글 내용</label>
                    <div class="col-sm-12">
                      <textarea class="form-control" name="b_content" id="b_content" rows="5" style="height: 500px;"></textarea>
                    </div>
                  </div>
                  <div class="form-group">
                      <div class="pull-right">
                          <div class="col-lg-12">
                              <button type="button" class="btn btn-theme" id="boardChk">글 작성</button>
                              <button type="button" class="btn btn-theme" 
                              	<c:if test="${sidebar eq '2' }">onclick = "location.href ='study'"</c:if>
                              	<c:if test="${sidebar eq '3' }">onclick = "location.href ='competition'"</c:if>
                              	<c:if test="${sidebar eq '4' }">onclick = "location.href ='amity'"</c:if>
                              >리스트</button>
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
