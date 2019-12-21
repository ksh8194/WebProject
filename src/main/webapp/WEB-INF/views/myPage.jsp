<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="client_top.jsp" %>
    <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
    <!--main content start-->
    <section id="main-content">
        <section class="wrapper site-min-height">
          <!-- 개인정보보기 시작 -->
          <div class="row mt">
            <div class="col-lg-12">
              <div class="row content-panel">
                  <div class="row mt">
                      <div class="col-lg-12">
                        <div class="form-panel">
                          <h4 class="mb"><i class="fa fa-angle-right"></i>개인정보</h4>
                          <form class="form-horizontal style-form">
                            <div class="form-group">
                              <label class="col-sm-2 control-label">이름</label>
                              <div class="col-sm-10">
                                <p class="form-control-static">${dto.m_name }</p>
                              </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">이메일</label>
                                <div class="col-sm-10">
                                  <p class="form-control-static">${dto.m_email }</p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">핸드폰 번호</label>
                                <div class="col-sm-10">
                                  <p class="form-control-static">${dto.m_phone1}-${dto.m_phone2}-${dto.m_phone3}</p>
                                </div>
                            </div>
                            <div class="form-group">
                              <label class="col-sm-2 control-label">가입 날짜</label>
                              <div class="col-sm-10">
                                <p class="form-control-static">${dto.m_regdate}</p>
                              </div>
                          </div>
                            <div class="form-group">
                                <label class="col-sm-9 control-label"> </label>
                                <div class="col-sm-3">
                                  <button type="button" class="btn btn-theme" onclick = "location.href ='modifyClient?m_num=${dto.m_num}'">회원정보 수정</button>
                                  <button type="button" class="btn btn-theme" onclick = "location.href ='modifyClientPwd?m_num=${dto.m_num}'">비밀번호 변경</button>
                                  <button type="button" class="btn btn-theme" onclick = "deleteClientConfirm('deleteClient?m_num=${dto.m_num}')">회원탈퇴</button>
                                </div>
                            </div>
                          </form>
                        </div>
                      </div>
                    </div>
              </div>
              <!-- 개인정보보기 끝 -->
              <!-- /row -->
            </div>
            <!-- /col-lg-12 -->
            <div class="col-lg-12 mt">
              <div class="row content-panel">
                <div class="panel-heading">
                  <ul class="nav nav-tabs nav-justified">
                    <li <c:if test="${!empty boardlist}">class="active"</c:if>>
                      <a href="myPage?m_num=${sessionScope.no}">작성한 글</a>
                    </li>
                    <li <c:if test="${!empty replylist}">class="active"</c:if>>
                      <a href="myPage?m_num=${sessionScope.no}&show=2">작성한 댓글</a>
                    </li>
                    <li>
                      <a href="#" onclick="alert('준비중입니다.');">받은 쪽지함</a>
                    </li>
                    <li>
                        <a href="#" onclick="alert('준비중입니다.');">보낸 쪽지함</a>
                    </li>
                  </ul>
                </div>
                <!-- /panel-heading -->
              </div>
            </div>
        
        <c:if test="${!empty boardlist}">
        	   <div class="row">
		          <div class="col-md-12">
		            <div class="content-panel">
		              <table class="table">
		                <colgroup>
		                  <col width="10%"/>
		                  <col width="10%"/>
		                  <col width="60%"/>
		                  <col width="10%"/>
		                  <col width="10%"/>
		                </colgroup>
		                <thead>
		                  <tr>
		                    <th style="text-align: center">번호</th>
		                    <th style="text-align: center">카테고리</th>
		                    <th>제목</th>
		                    <th style="text-align: center">작성 날짜</th>
		                    <th style="text-align: center">조회 수</th>
		                  </tr>
		                </thead>
		                <tbody>
			             	<c:forEach var="d" items="${boardlist}" begin="0" end="${pagination.length}" varStatus="status">
	                			<tr>
					                <td style="text-align: center">${pagination.pageNum - status.index}</td>
				                    <td style="text-align: center">${d.c_name}</td>
				                    <td><a href="clientBoardView?b_num=${d.b_num}&page=1&sidebar=${d.b_cno+1}&rpage=1">${d.b_title}</a></td>
				                    <td style="text-align: center">${d.b_udate}</td>
				                    <td style="text-align: center">${d.b_views}</td>
			                  	</tr>
	                		</c:forEach>
		                </tbody>
		              </table>
		              
		              <div style="text-align: center;">
		            	<nav aria-label="Page navigation example">
							<ul class="pagination pagination-lg">
								<c:if test="${pagination.currentBlock eq 1 }"></c:if>
								<c:if test="${pagination.currentBlock != 1 }">
									<li class="page-item ">
			                          <a class="page-link" href='myPage?m_num=${sessionScope.no}&page=${pagination.startPage-1}&show=1' tabindex="-1">&laquo;</a>
			                        </li>
								</c:if>
							
								<c:forEach var="e" begin="${pagination.startPage}" end="${pagination.endPage}">
									<li class="page-item <c:if test="${pagination.page eq e}">active</c:if>">
										<a class="page-link" href="myPage?m_num=${sessionScope.no}&page=${e}&show=1">${e}</a>
									</li>
								</c:forEach>
								
								<c:if test="${pagination.currentBlock eq pagination.totalBlock}"></c:if>
								<c:if test="${pagination.currentBlock != pagination.totalBlock}">
									<li class="page-item">
			                          <a class="page-link" href="myPage?m_num=${sessionScope.no}&page=${pagination.endPage+1}&show=1" tabindex="-1">&raquo;</a>
			                        </li>
								</c:if>
							</ul>
						</nav>
		              </div>
				              
		               
		            </div>
		          </div>
		      </div>
        </c:if>    
        
        <c:if test="${!empty replylist}">
        	<div class="row">
	          <div class="col-md-12">
	            <div class="content-panel">
	              <table class="table">
	                <colgroup>
	                  <col width="10%"/>
	                  <col width="80%"/>
	                  <col width="10%"/>
	                </colgroup>
	                <thead>
	                  <tr>
	                    <th style="text-align: center">번호</th>
	                    <th>댓글 내용</th>
	                    <th style="text-align: center">작성 날짜</th>
	                  </tr>
	                </thead>
	                <tbody>
              			<c:forEach var="d" items="${replylist}" begin="0" end="${pagination.length}" varStatus="status">
                			<tr>
				                <td style="text-align: center">${pagination.pageNum - status.index}</td>
			                    <td><a href="clientBoardView?b_num=${d.r_bno}&page=1&sidebar=${d.b_cno+1}&rpage=1">${d.r_content}</a></td>
			                    <td style="text-align: center">${d.r_sdate}</td>
		                  	</tr>
                		</c:forEach>
	                </tbody>
	              </table>
	              
	              <div style="text-align: center;">
	            	<nav aria-label="Page navigation example">
						<ul class="pagination pagination-lg">
							<c:if test="${pagination.currentBlock eq 1 }"></c:if>
							<c:if test="${pagination.currentBlock != 1 }">
								<li class="page-item ">
		                          <a class="page-link" href='myPage?m_num=${sessionScope.no}&page=${pagination.startPage-1}&show=2' tabindex="-1">&laquo;</a>
		                        </li>
							</c:if>
						
							<c:forEach var="e" begin="${pagination.startPage}" end="${pagination.endPage}">
								<li class="page-item <c:if test="${pagination.page eq e}">active</c:if>">
									<a class="page-link" href="myPage?m_num=${sessionScope.no}&page=${e}&show=2">${e}</a>
								</li>
							</c:forEach>
							
							<c:if test="${pagination.currentBlock eq pagination.totalBlock}"></c:if>
							<c:if test="${pagination.currentBlock != pagination.totalBlock}">
								<li class="page-item">
		                          <a class="page-link" href="myPage?m_num=${sessionScope.no}&page=${pagination.endPage+1}&show=2" tabindex="-1">&raquo;</a>
		                        </li>
							</c:if>
						</ul>
					</nav>
	              </div>
	              
	            </div>
	          </div>
	      </div>
        </c:if>
        
          </div>
        </section>
       </section> 
<%@ include file="client_bottom.jsp" %>
