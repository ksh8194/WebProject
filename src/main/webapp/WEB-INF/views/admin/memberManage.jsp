<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="admin_top.jsp" %>
    <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
    <!--main content start-->
    <section id="main-content">
      <section class="wrapper">
        <h3 class="col-sm-10"><i class="fa fa-angle-right"></i>회원관리</h3>
        <div class="row">
          <div class="col-md-12">
            <div class="content-panel">
              <table class="table">
                <colgroup>
                  <col width="10%" />
                  <col width="20%" />
                  <col width="10%" />
                  <col width="10%" />
                  <col width="10%" />
                  <col width="10%" />
                  <col width="10%" />
                  <col width="10%" />
                  <col width="10%" />
                </colgroup>
                <thead>
                  <tr>
                    <th style="text-align: center">번호</th>
                    <th>이메일</th>
                    <th style="text-align: center">이름</th>
                    <th style="text-align: center">핸드폰</th>
                    <th style="text-align: center">상태</th>
                    <th style="text-align: center">등급</th>
                    <th style="text-align: center">가입날짜</th>
                    <th style="text-align: center">경고횟수</th>
                    <th style="text-align: center">삭제</th>
                  </tr>
                </thead>
                <tbody>
                
                	<c:if test="${empty list}">
                		<tr>
	                		<td colspan="8" style="text-align: center;">회원이 없습니다.</td>
                		</tr>
                	</c:if>
                	<c:if test="${!empty list}"> 
                		<c:forEach var="d" items="${list}" begin="0" end="${pagination.length}" varStatus="status">
	                    	
	                			<tr>
					                <td style="text-align: center">${pagination.pageNum - status.index}</td>
				                    <td>${d.m_email}</td>
				                    <td style="text-align: center">${d.m_name}</td>
				                    <td style="text-align: center">${d.m_phone1}-${d.m_phone2}-${d.m_phone3}</td>
				                    <td style="text-align: center">
				                    	<form action="modifyMember" method="post">
				                    		<input type="hidden" name="page" value="${page}">
				                    		<input type="hidden" name="m_num" value="${d.m_num}">
											 <select class="form-control" name="m_state">
						                      <option <c:if test="${d.m_state eq '0'}">selected="selected"</c:if> value="0">승인 대기</option>
						                      <option <c:if test="${d.m_state eq '1'}">selected="selected"</c:if> value="1">승인</option>
						                      <option <c:if test="${d.m_state eq '2'}">selected="selected"</c:if> value="2">기간정지</option>
						                      <option <c:if test="${d.m_state eq '3'}">selected="selected"</c:if> value="3">영구정지</option>
						                    </select>
					                    	<button type="submit" class="btn btn-primary btn-xs">수정</button>
						                 </form>
				                    </td>
				                    <td style="text-align: center">${d.m_grade}</td>
				                    <td style="text-align: center">${d.m_regdate}</td>
				                    <td style="text-align: center">${d.m_warning}</td>
				                    <td style="text-align: center">
				                     	 <button type="button" class="btn btn-theme" onclick="deleteMember('deleteMember?m_num=${d.m_num}&page=${pagination.page}')">삭제</button>
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
	                          <a class="page-link" href='memberManage?page=${pagination.startPage-1}' tabindex="-1">&laquo;</a>
	                        </li>
						</c:if>
					
						<c:forEach var="e" begin="${pagination.startPage}" end="${pagination.endPage}">
							<li class="page-item <c:if test="${pagination.page eq e}">active</c:if>">
								<a class="page-link" href="memberManage?page=${e}">${e}</a>
							</li>
						</c:forEach>
						
						<c:if test="${pagination.currentBlock eq pagination.totalBlock}"></c:if>
						<c:if test="${pagination.currentBlock != pagination.totalBlock}">
							<li class="page-item">
	                          <a class="page-link" href="memberManage?page=${pagination.endPage+1}" tabindex="-1">&raquo;</a>
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