<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="admin_top.jsp" %>
    <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
    <!--main content start-->
    <section id="main-content">
      <section class="wrapper">
        <h3 class="col-sm-10"><i class="fa fa-angle-right"></i>댓글 관리</h3>
        <div class="row">
          <div class="col-md-12">
            <div class="content-panel">
              <table class="table">
                <colgroup>
                  <col width="10%" />
                  <col width="10%" />
                  <col width="50%" />
                  <col width="10%" />
                  <col width="10%" />
                  <col width="10%" />
                </colgroup>
                <thead>
                  <tr>
                    <th style="text-align: center">번호</th>
                    <th style="text-align: center">작성자</th>
                    <th>내용</th>
                    <th style="text-align: center">작성 날짜</th>
                    <th style="text-align: center">게시판 원글</th>
                    <th style="text-align: center">삭제</th>
                  </tr>
                </thead>
                <tbody>
                	<c:if test="${empty list}">
                		<tr>
	                		<td colspan="6" style="text-align: center;">등록된 댓글이 없습니다.</td>
                		</tr>
                	</c:if>
                	<c:if test="${!empty list}"> 
                		<c:forEach var="d" items="${list}" begin="0" end="${pagination.length}" varStatus="status">
                			<tr>
				                <td style="text-align: center">${pagination.pageNum - status.index}</td>
				                <td style="text-align: center">${d.m_name}</td>
				                <td>${d.r_content}</td>
			                    <td style="text-align: center">${d.r_sdate}</td>
			                    <td><a href="boardView?b_num=${d.r_bno}&page=${pagination.page}&sidebar=3">원글</a></td>
			                    <td style="text-align: center">
			                      <button type="button" class="btn btn-theme" onclick = "deleteBoard('adminReplyDeleteInManage?r_num=${d.r_num}&page=${pagination.page}')">삭제</button>
			                    </td>
		                  	</tr>
                		</c:forEach>
                	</c:if>

                </tbody>
              </table>
              
              <div style="text-align: center;">
            	<nav aria-label="Page navigation example">
					<ul class="pagination pagination-lg">
						<c:if test="${pagination.currentBlock eq 1 }"></c:if>
						<c:if test="${pagination.currentBlock != 1 }">
							<li class="page-item ">
	                          <a class="page-link" href='replyManage?page=${pagination.startPage-1}' tabindex="-1">&laquo;</a>
	                        </li>
						</c:if>
					
						<c:forEach var="e" begin="${pagination.startPage}" end="${pagination.endPage}">
							<li class="page-item <c:if test="${pagination.page eq e}">active</c:if>">
								<a class="page-link" href="replyManage?page=${e}">${e}</a>
							</li>
						</c:forEach>
						
						<c:if test="${pagination.currentBlock eq pagination.totalBlock}"></c:if>
						<c:if test="${pagination.currentBlock != pagination.totalBlock}">
							<li class="page-item">
	                          <a class="page-link" href="replyManage?page=${pagination.endPage+1}" tabindex="-1">&raquo;</a>
	                        </li>
						</c:if>
					</ul>
				</nav>
              </div>
              
              
            </div>
          </div>
        </div>
      </section>
    </section>
    <!--main content end-->
<%@ include file="admin_bottom.jsp"%>