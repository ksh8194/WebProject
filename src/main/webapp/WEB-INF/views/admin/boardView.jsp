<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="admin_top.jsp" %>
    <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
    <!--main content start-->
    <section id="main-content">
        <section class="wrapper">
          <h3 class="col-sm-10"><i class="fa fa-angle-right"></i>게시판 이름</h3>
          <div class="col-sm-2">
              <button type="button" class="btn btn-theme btn-lg pull-right" style="margin-top: 15px; margin-left: 30px;" 
								<c:if test="${index eq '1' }">onclick = "location.href ='boardList?page=${page}'"</c:if>
	                          	<c:if test="${index eq '2' }">onclick = "location.href ='adminStudy?page=${page}'"</c:if> 
	                          	<c:if test="${index eq '3' }">onclick = "location.href ='adminCompetition?page=${page}'"</c:if> 
	                          	<c:if test="${index eq '4' }">onclick = "location.href ='adminCompetition?page=${page}'"</c:if>>
	                  리스트 보기</button>
          </div>
          
          <div class="row mt">
            <div class="col-lg-12">
              <div class="form-panel">
                <form class="form-horizontal style-form">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">작성자</label>
                        <div class="col-sm-2">
                          <p class="form-control-static">${dto.m_name }</p>
                        </div>
                        <label class="col-sm-2 control-label">날짜</label>
                        <div class="col-sm-2">
                          <p class="form-control-static">${dto.b_udate }</p>
                        </div>
                        <label class="col-sm-2 control-label">조회수</label>
                        <div class="col-sm-2">
                          <p class="form-control-static">${dto.b_views }</p>
                        </div>
                    </div>
                  <div class="form-group">
                    <label class="col-lg-2 col-sm-2 control-label">제목</label>
                    <div class="col-lg-10">
                      <p class="form-control-static">${dto.b_title }</p>
                    </div>
                  </div>
                  <div class="form-group">
                      <div class="col-lg-12">
                        <p class="form-control-static">${dto.b_content }</p>
                      </div>
                  </div>
                  <div class="form-group">
                    <div class="pull-right">
                        <div class="col-lg-12">
                            <button type="button" class="btn btn-theme" onclick = "deleteBoard('boardDelete?b_num=${dto.b_num}&page=${page}&index=${index}')">글 삭제</button>
                          </div>
                    </div>    
                  </div>
                </form>
              </div>
            </div>
          </div>
  			
  		<h3><i class="fa fa-angle-right"></i>댓글</h3>
        <div class="row mt">
          <div class="col-lg-12">
            <div class="form-panel">
             	<c:if test="${empty list }">
             		<p style="text-align: center;">등록된 댓글이 없습니다</p>
             	</c:if>
             	<c:if test="${!empty list }">
             		<c:forEach var="r" items="${list }" varStatus="vs" >
             			<form class="form-horizontal style-form">
             				<div class="form-group">
             					<label class="col-sm-1 control-label">${r.r_sdate}</label>
                  				<label class="col-sm-1 control-label">${r.m_name}</label>
                  				<div class="col-lg-8">
                    				<p class="form-control-static">${r.r_content }</p>
                  				</div>
                  				<div class="pull-right">
			                    <div class="col-lg-12" style="margin-top: 10px;">
			                    	<button type="button" class="btn btn-theme" onclick = "adminDeleteReply('adminReplyDelete?b_num=${dto.b_num}&r_num=${r.r_num}&page=${page}&sidebar=${sidebar}&rpage=${pagination.page}&index=${index}')">댓글 삭제</button>
			                    </div>
				                </div>
             				</div>
             			</form>
             		</c:forEach>
             	</c:if>
             	<div style="text-align: center;">
            	<nav aria-label="Page navigation example">
					<ul class="pagination pagination-lg">
						<c:if test="${pagination.currentBlock eq 1 }"></c:if>
						<c:if test="${pagination.currentBlock != 1 }">
							<li class="page-item ">
	                          <a class="page-link" href="boardView?b_num=${dto.b_num}&page=${page}&sidebar=${sidebar}&rpage=${pagination.startPage-1}&index=${index}" tabindex="-1">&laquo;</a>
	                        </li>
						</c:if>
					
						<c:forEach var="e" begin="${pagination.startPage}" end="${pagination.endPage}">
							<li class="page-item <c:if test="${pagination.page eq e}">active</c:if>">
								<a class="page-link" href="boardView?b_num=${dto.b_num}&page=${page}&sidebar=${sidebar}&rpage=${e}&index=${index}">${e}</a>
							</li>
						</c:forEach>
						
						<c:if test="${pagination.currentBlock eq pagination.totalBlock}"></c:if>
						<c:if test="${pagination.currentBlock != pagination.totalBlock}">
							<li class="page-item">
	                          <a class="page-link" href="boardView?b_num=${dto.b_num}&page=${page}&sidebar=${sidebar}&rpage=${pagination.endPage+1}&index=${index}" tabindex="-1">&raquo;</a>
	                        </li>
						</c:if>

					</ul>
				</nav>
              </div>
            </div>
          </div>
        </div>	
          <!-- /row -->
          </section>
        </section>
        <!-- /wrapper -->
    <!--main content end-->
<%@ include file="admin_bottom.jsp"%>