<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="client_top.jsp" %>
    <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
    <!--main content start-->
    <section id="main-content">
      <section class="wrapper">
          <h3><i class="fa fa-angle-right"></i>공지사항</h3>
        <div class="row">
          <div class="col-md-12">
            <div class="content-panel">
              <table class="table">
                <colgroup>
                  <col width="10%"/>
                  <col width="60%"/>
                  <col width="10%"/>
                  <col width="10%"/>
                  <col width="10%"/>
                </colgroup>
                <thead>
                  <tr>
                    <th style="text-align: center">번호</th>
                    <th>제목</th>
                    <th style="text-align: center">작성자</th>
                    <th style="text-align: center">작성 날짜</th>
                    <th style="text-align: center">조회 수</th>
                  </tr>
                </thead>
                <tbody>
                	<c:if test="${empty list}">
                		<tr>
	                		<td colspan="5" style="text-align: center;">등록된 게시글이 없습니다.</td>
                		</tr>
                	</c:if>
                	<c:if test="${!empty list}">
                		<c:forEach var="d" items="${list}" begin="0" end="${pagination.length}" varStatus="status">
                			<tr>
				                <td style="text-align: center">${pagination.pageNum - status.index}</td>
			                    <td><a href="clientNoticeView?n_num=${d.n_num}&page=${pagination.page}&sidebar=${sidebar}">${d.n_title}</a></td>
			                    <td style="text-align: center">${d.a_name}</td>
			                    <td style="text-align: center">${d.n_sdate}</td>
			                    <td style="text-align: center">${d.n_views}</td>
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
	                          <a class="page-link" href='clientNoticeList?page=${pagination.startPage-1}' tabindex="-1">&laquo;</a>
	                        </li>
						</c:if>
					
						<c:forEach var="e" begin="${pagination.startPage}" end="${pagination.endPage}">
							<li class="page-item <c:if test="${pagination.page eq e}">active</c:if>">
								<a class="page-link" href="clientNoticeList?page=${e}">${e}</a>
							</li>
						</c:forEach>
						
						<c:if test="${pagination.currentBlock eq pagination.totalBlock}"></c:if>
						<c:if test="${pagination.currentBlock != pagination.totalBlock}">
							<li class="page-item">
	                          <a class="page-link" href="clientNoticeList?page=${pagination.endPage+1}" tabindex="-1">&raquo;</a>
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
<%@ include file="client_bottom.jsp" %>
