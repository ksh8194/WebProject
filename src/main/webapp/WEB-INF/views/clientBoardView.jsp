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
          <button type="button" class="btn btn-theme btn-lg pull-right" style="margin-top: 15px; margin-left: 30px;"
          	<c:if test="${sidebar eq '2' }">onclick = "location.href ='study?page=${page}'"</c:if>
            <c:if test="${sidebar eq '3' }">onclick = "location.href ='competition?page=${page}'"</c:if>
            <c:if test="${sidebar eq '4' }">onclick = "location.href ='amity?page=${page}'"</c:if>
          >리스트 보기</button>
        </div>

        <div class="row mt">
          <div class="col-lg-12">
            <div class="form-panel">
            <!-- 스타일을 위한 form 입니다. 사용되지 않습니다. -->
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
                    <p class="form-control-static">${dto.b_title}</p>
                  </div>
                </div>
                <div class="form-group">
                  <div class="col-lg-12">
                    <p class="form-control-static">${dto.b_content}</p>
                  </div>
                </div>
				<div class="form-group">
                  <div class="pull-right">
                    <div class="col-lg-12">
	                   	<c:if test="${sessionScope.no eq dto.b_mno && sessionScope.master eq '1'}">
                    		<button type="button" class="btn btn-theme" onclick = "location.href ='clientBoardModify?b_num=${dto.b_num}&page=${page}&sidebar=${sidebar}'">글 수정</button>
                     		<button type="button" class="btn btn-theme" onclick = "deleteBoard('clientBoardDelete?b_num=${dto.b_num}&page=${page}&sidebar=${sidebar}')">글 삭제</button>
	                   	</c:if>
                   	
                   		<c:if test="${sessionScope.master eq '2' }">
                     		<button type="submit" class="btn btn-theme" onclick = "deleteBoard('clientBoardDelete?b_num=${dto.b_num}&page=${page}&sidebar=${sidebar}')">글 삭제</button>
                   		</c:if>
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
            	<c:if test="${sessionScope.master eq '1' }">
            		<form class="form-horizontal style-form" method="post" name="replyfrm" action="replyInsert">
            			<input type="hidden" name="r_bno" value="${dto.b_num}">
            			<input type="hidden" name="r_mno" value="${sessionScope.no}">
            			<input type="hidden" name="r_ip" value="<%=request.getRemoteAddr()%>">
            			<input type="hidden" name="page" value="${page }">
            			<input type="hidden" name="sidebar" value="${sidebar}" >
                  		<div class="form-group">
                      		<label class="col-sm-12 control-label">댓글 적기</label>
                      		<div class="col-sm-11">
                        		<textarea class="form-control" name="r_content" id="r_content" rows="5" style="height: 100px;"></textarea>
                      		</div>
                      		<div class="col-sm-1">
                          		<button type="button" class="btn btn-theme" style="margin-top: 30px;" id="replyChk">댓글 작성</button>
                      		</div>
                    	</div>
             		 </form>
            	</c:if>
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
				                    	<c:if test="${sessionScope.no eq dto.b_mno && sessionScope.master eq '1'}">
				                			<button type="button" id="showModifyFrmButton${vs.index}" class="btn btn-theme" onclick="showModifyFrm(replyModifyfrm${vs.index},showModifyFrmButton${vs.index})">댓글 수정</button>
				                      		<button type="button" class="btn btn-theme" onclick = "deleteReply('replyDelete?b_num=${dto.b_num}&r_num=${r.r_num}&page=${page}&sidebar=${sidebar}&rpage=${pagination.page}')">댓글 삭제</button>
				                    	</c:if>
				                    	<c:if test="${sessionScope.master eq '2' }">
				                    		<button type="button" class="btn btn-theme" onclick = "deleteReply('replyDelete?b_num=${dto.b_num}&r_num=${r.r_num}&page=${page}&sidebar=${sidebar}&rpage=${pagination.page}')">댓글 삭제</button>
				                    	</c:if>
				                    </div>
				                </div>
             				</div>
             			</form>
            			<form class='form-horizontal style-form hide' method='post' id= "replyModifyfrm${vs.index}" action='replyModify'>
           					<input type="hidden" name="r_num" value="${r.r_num }">
           					<input type='hidden' name='r_bno' value='${dto.b_num}'>
           					<input type='hidden' name='r_mno' value='${sessionScope.no}'>
           					<input type='hidden' name='r_ip' value='<%=request.getRemoteAddr()%>'>
           					<input type='hidden' name='page' value='${page }'>
           					<input type='hidden' name='sidebar' value='${sidebar}' >
           					<input type="hidden" name="rpage" value="${pagination.page}">
           					<div class='form-group'>
           						<label class='col-sm-12 control-label'>댓글 수정</label>
           						<div class='col-sm-11'>
           							<textarea class='form-control' name='r_content' id='r_contentModify${vs.index }' rows='5' style='height: 100px;'></textarea>
           						</div>
           						<div class='col-sm-1'>
           							<button type='button' class='btn btn-theme' style='margin-top: 30px; margin-bottom:5px;' onclick="modifyReply(r_contentModify${vs.index },replyModifyfrm${vs.index})">댓글 수정</button>
           							<button type='button' class='btn btn-theme' onclick="hideModifyFrm(replyModifyfrm${vs.index},showModifyFrmButton${vs.index})">수정 취소</button>
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
	                          <a class="page-link" href="clientBoardView?b_num=${dto.b_num}&page=${page}&sidebar=${sidebar}&rpage=${pagination.startPage-1}" tabindex="-1">&laquo;</a>
	                        </li>
						</c:if>
					
						<c:forEach var="e" begin="${pagination.startPage}" end="${pagination.endPage}">
							<li class="page-item <c:if test="${pagination.page eq e}">active</c:if>">
								<a class="page-link" href="clientBoardView?b_num=${dto.b_num}&page=${page}&sidebar=${sidebar}&rpage=${e}">${e}</a>
							</li>
						</c:forEach>
						
						<c:if test="${pagination.currentBlock eq pagination.totalBlock}"></c:if>
						<c:if test="${pagination.currentBlock != pagination.totalBlock}">
							<li class="page-item">
	                          <a class="page-link" href="clientBoardView?b_num=${dto.b_num}&page=${page}&sidebar=${sidebar}&rpage=${pagination.endPage+1}" tabindex="-1">&raquo;</a>
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
<%@ include file="client_bottom.jsp" %>