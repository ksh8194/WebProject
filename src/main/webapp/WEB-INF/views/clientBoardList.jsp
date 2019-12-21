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
          	<form action="clientBoardCreate" method="get">
          		<input type="hidden" value="${sidebar}" name="sidebar">
          		<c:if test="${sessionScope.no ne '' && sessionScope.master eq '1'}">
	              	<button type="submit" class="btn btn-theme btn-lg pull-right" style="margin-top: 5px;">새글 적기</button>
          		
          		</c:if>
          	</form>
          </div>
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
			                    <td><a href="clientBoardView?b_num=${d.b_num}&page=${pagination.page}&sidebar=${sidebar}&rpage=1">${d.b_title}</a></td>
			                    <td style="text-align: center">${d.m_name}</td>
			                    <td style="text-align: center">${d.b_udate}</td>
			                    <td style="text-align: center">${d.b_views}</td>
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
	                          <a class="page-link" href="
	                          	<c:if test="${sidebar eq '2' }">study?page=${pagination.startPage-1}</c:if>
					          	<c:if test="${sidebar eq '3' }">competition?page=${pagination.startPage-1}</c:if>
					          	<c:if test="${sidebar eq '4' }">amity?page=${pagination.startPage-1}</c:if>
	                          " tabindex="-1">&laquo;</a>
	                        </li>
						</c:if>
					
						<c:forEach var="e" begin="${pagination.startPage}" end="${pagination.endPage}">
							<li class="page-item <c:if test="${pagination.page eq e}">active</c:if>">
								<a class="page-link" href="
									<c:if test="${sidebar eq '2' }">study?page=${e}</c:if>
						          	<c:if test="${sidebar eq '3' }">competition?page=${e}</c:if>
						          	<c:if test="${sidebar eq '4' }">amity?page=${e}</c:if>
								">${e}</a>
							</li>
						</c:forEach>
						
						<c:if test="${pagination.currentBlock eq pagination.totalBlock}"></c:if>
						<c:if test="${pagination.currentBlock != pagination.totalBlock}">
							<li class="page-item">
	                          <a class="page-link" href="
	                          	<c:if test="${sidebar eq '2' }">study?page=${pagination.endPage+1}</c:if>
					          	<c:if test="${sidebar eq '3' }">competition?page=${pagination.endPage+1}</c:if>
					          	<c:if test="${sidebar eq '4' }">amity?page=${pagination.endPage+1}</c:if>
	                          " tabindex="-1">&raquo;</a>
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
<%@ include file="client_bottom.jsp"%>