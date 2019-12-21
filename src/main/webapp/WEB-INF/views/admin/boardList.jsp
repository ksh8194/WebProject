<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="admin_top.jsp" %>
    <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
    <!--main content start-->
    <section id="main-content">
        <section class="wrapper">
            <h3 class="col-sm-10"><i class="fa fa-angle-right"></i>게시판 관리</h3>
            <div class="col-sm-2">
                <select class="form-control" style="margin-top: 10px;" onchange="if(this.value) location.href=(this.value);">
                    <option>카테고리</option>
                    <option value="boardList" <c:if test="${index eq '1' }">selected="selected"</c:if> >전체</option>
                    <option value="adminStudy" <c:if test="${index eq '2' }">selected="selected"</c:if> >스터디게시판</option>
                    <option value="adminCompetition" <c:if test="${index eq '3' }">selected="selected"</c:if>>공모전게시판</option>
                    <option value="adminAmity" <c:if test="${index eq '4' }">selected="selected"</c:if>>친목게시판</option>
                </select>
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
			                    <td><a href="boardView?b_num=${d.b_num}&page=${pagination.page}&sidebar=${sidebar}&index=${index}">${d.b_title}</a></td>
			                    <td style="text-align: center">${d.m_name}</td>
			                    <td style="text-align: center">${d.b_sdate}</td>
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
	                          <a class="page-link" 
	                          	<c:if test="${index eq '1' }">href='boardList?page=${pagination.startPage-1}'</c:if> 
	                          	<c:if test="${index eq '2' }">href='adminStudy?page=${pagination.startPage-1}'</c:if> 
	                          	<c:if test="${index eq '3' }">href='adminCompetition?page=${pagination.startPage-1}'</c:if> 
	                          	<c:if test="${index eq '4' }">href='adminAmity?page=${pagination.startPage-1}'</c:if> 
	                          tabindex="-1">&laquo;</a>
	                        </li>
						</c:if>
					
						<c:forEach var="e" begin="${pagination.startPage}" end="${pagination.endPage}">
							<li class="page-item <c:if test="${pagination.page eq e}">active</c:if>">
								<c:if test="${index eq '1' }"><a class="page-link" href="boardList?page=${e}">${e}</a></c:if> 
	                          	<c:if test="${index eq '2' }"><a class="page-link" href="adminStudy?page=${e}">${e}</a></c:if> 
	                          	<c:if test="${index eq '3' }"><a class="page-link" href="adminCompetition?page=${e}">${e}</a></c:if> 
	                          	<c:if test="${index eq '4' }"><a class="page-link" href="adminAmity?page=${e}">${e}</a></c:if> 
							</li>
						</c:forEach>
						
						<c:if test="${pagination.currentBlock eq pagination.totalBlock}"></c:if>
						<c:if test="${pagination.currentBlock != pagination.totalBlock}">
							<li class="page-item">
	                          <a class="page-link" 
	                          	<c:if test="${index eq '1' }">href='boardList?page=${pagination.endPage+1}'</c:if> 
	                          	<c:if test="${index eq '2' }">href='adminStudy?page=${pagination.endPage+1}'</c:if> 
	                          	<c:if test="${index eq '3' }">href='adminCompetition?page=${pagination.endPage+1}'</c:if> 
	                          	<c:if test="${index eq '4' }">href='adminAmity?page=${pagination.endPage+1}'</c:if> 
	                          tabindex="-1">&laquo;</a>
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