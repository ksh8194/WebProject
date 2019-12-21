<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="admin_top.jsp" %>
    <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
    <!--main content start-->
    <section id="main-content">
      <section class="wrapper">
        <h3 class="col-sm-10"><i class="fa fa-angle-right"></i>관리자 계정 관리</h3>
        <div class="row">
          <div class="col-md-12">
            <div class="content-panel">
              <table class="table">
                <colgroup>
                  <col width="10%" />
                  <col width="50%" />
                  <col width="10%" />
                  <col width="20%" />
                  <col width="10%" />
                </colgroup>
                <thead>
                  <tr>
                    <th style="text-align: center">번호</th>
                    <th>이메일</th>
                    <th style="text-align: center">이름</th>
                    <th style="text-align: center">핸드폰</th>
                    <th style="text-align: center">수정/삭제</th>
                  </tr>
                </thead>
                <tbody>
                	<c:if test="${empty list}">
                		<tr>
	                		<td colspan="5" style="text-align: center;">관리자가 없습니다.</td>
                		</tr>
                	</c:if>
                	<c:if test="${!empty list}"> 
                		<c:forEach var="d" items="${list}" begin="0" end="${pagination.length}" varStatus="status">
                			<c:if test="${sessionScope.no != d.a_num }">
	                			<tr>
					                <td style="text-align: center">${pagination.pageNum - status.index}</td>
				                    <td>${d.a_email}</td>
				                    <td style="text-align: center">${d.a_name}</td>
				                    <td style="text-align: center">${d.a_phone1}-${d.a_phone2}-${d.a_phone3}</td>
				                    <td style="text-align: center">
				                    	<button type="button" class="btn btn-theme" onclick = "location.href ='adminModify?a_num=${d.a_num}&page=${pagination.page}'">수정</button>
				                    	<button type="button" class="btn btn-theme" onclick="adminDeleteReply('deleteAdmin?a_num=${d.a_num}&page=${pagination.page}')" >삭제</button>
				                    </td>
			                  	</tr>
                			</c:if>
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
	                          <a class="page-link" href='adminManage?page=${pagination.startPage-1}' tabindex="-1">&laquo;</a>
	                        </li>
						</c:if>
					
						<c:forEach var="e" begin="${pagination.startPage}" end="${pagination.endPage}">
							<li class="page-item <c:if test="${pagination.page eq e}">active</c:if>">
								<a class="page-link" href="adminManage?page=${e}">${e}</a>
							</li>
						</c:forEach>
						
						<c:if test="${pagination.currentBlock eq pagination.totalBlock}"></c:if>
						<c:if test="${pagination.currentBlock != pagination.totalBlock}">
							<li class="page-item">
	                          <a class="page-link" href="adminManage?page=${pagination.endPage+1}" tabindex="-1">&raquo;</a>
	                        </li>
						</c:if>
					</ul>
				</nav>
              </div>
              
            </div>
          </div>
        </div>
        <br>
        <h3><i class="fa fa-angle-right"></i>관리자 추가</h3>
        <div class="row mt">
            <div class="col-lg-12">
              <div class="form-panel">
              
                <form class="form-horizontal style-form" method="post" action="adminCreate" name="frm">

                  <div class="form-group">
                    <label class="col-sm-2 control-label">이름</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="a_name" name="a_name">
                      <div id="nameErrorMsg" class="text-danger col-sm-10" style="font-size: 14px; margin-top: 10px;"></div>
                    </div>
                  </div>
                  
                  <div class="form-group">
                      <label class="col-sm-2 control-label">이메일</label>
                      <div class="col-sm-10">
                        <input type="email" class="form-control" id="a_email" name="a_email">
                        <div id="emailErrorMsg" class="text-danger col-sm-10" style="font-size: 14px; margin-top: 10px;"></div>
                      </div>
                  </div>
				 
                  <div class="form-group">
                    <div>
                      <label class="col-sm-2 control-label">핸드폰 번호</label>
                      <div class="col-sm-10">
                        <input type="text" id="a_phone1" name="a_phone1">&nbsp;<b>-</b>
                        <input type="text" id="a_phone2" name="a_phone2">&nbsp;<b>-</b>
                        <input type="text" id="a_phone3" name="a_phone3">
                        <div id="phoneErrorMsg" class="text-danger col-sm-10" style="font-size: 14px; margin-top: 10px;"></div>  
                      </div>
                    </div>
                  </div>
                  
                  <div class="form-group">
                      <label class="col-sm-2 control-label">비밀번호</label>
                      <div class="col-sm-10">
                        <input type="password" class="form-control" id="a_password" name="a_password">
                        <div id="pwdErrorMsg" class="text-danger col-sm-10" style="font-size: 14px; margin-top: 10px;"></div>
                      </div>
                  </div>
                  
				  
                  <div class="form-group">
                      <label class="col-sm-2 control-label">비밀번호 확인</label>
                      <div class="col-sm-10">
                        <input type="password" class="form-control" id="pwdChk">
				  		<div id="pwdchkErrorMsg" class="text-danger col-sm-10" style="font-size: 14px; margin-top: 10px;"></div>	
                      </div>
                  </div>

                  <div class="form-group">
                      <div class="pull-right">
                          <div class="col-lg-12">
                              <button type="button" class="btn btn-theme" id="adminChk">관리자 추가</button>
                          </div>
                      </div>    
                  </div>
                </form>
              </div>
            </div>
          </div>



      </section>
    </section>
    <!--main content end-->
<%@ include file="admin_bottom.jsp"%>