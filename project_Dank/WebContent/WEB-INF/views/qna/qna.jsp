<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="content">
	<!-- ����� Ǫ���� ���� ���� -->
	<div class="panel-header bg-primary-gradient">
		<div class="page-inner py-5">
			<div
				class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
				<div>
					<h2 class="text-white pb-2 fw-bold">������</h2>
					<h5 class="text-white op-7 mb-2">
						<a href="index" class="btn btn-white btn-sm btn-border mr-1">
							<span class="flaticon-home" />
						</a> <span class="h2 mr-1"> > </span> <a href="search"
							class="btn btn-white btn-sm btn-border mr-1">���� ã�� �ǹ�</a>
					</h5>
				</div>
				<div class="ml-md-auto py-2 py-md-0">
					<a href="checkbalance"
						class="btn btn-white btn-border btn-round mr-2">���� ������</a> <a
						href="qna" class="btn btn-secondary btn-round">������</a>
				</div>
			</div>
		</div>
	</div>
	<!-- ����� Ǫ���� ���� �� -->

	<div class="page-inner mt--5">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header">
						<div class="card-head-row">
							<div class="card-title col-3">���� ã�� ����</div>
						</div>
					</div>
					<div class="form-group" id="">
						<div class="input-icon" style="display: inline-block;">



							<!-- <input type="text" class="form-control"
								placeholder="Search for..."">
						</div>
						<button class="btn btn-info" style="display: inline-block;">�˻�</button> -->
						<select name="searchType" id="searchType">
						<option value="1">�׸�</option>
						<option value="2">��ȣ</option>	
						<option value="3">����</option>
						<option value="4">��¥</option>
						</select>
						<input type="text" name="searchValue" id="searchValue">
						<input class="btn btn-info" type="button" id="search" value="�˻�">


							


						</div>
						<div class="card-body">
							<button id="one"
								style="background-color: #48abf7; border-color: #48abf7; color: white; border: 1px solid transparent;">��ü</button>
							<button id="two"
								style="background-color: #48abf7; border-color: #48abf7; color: white; border: 1px solid transparent;">
								����</button>
							<button id="three"
								style="background-color: #48abf7; border-color: #48abf7; color: white; border: 1px solid transparent;">
								����</button>
							<button id="four"
								style="background-color: #48abf7; border-color: #48abf7; color: white; border: 1px solid transparent;">ȸ������</button>
							<button id="five"
								style="background-color: #48abf7; border-color: #48abf7; color: white; border: 1px solid transparent;">��Ÿ</button>

							<c:forEach items="${list }" var="e">
								<div>${e.qna_num }��)
									<c:if test="${e.cat_num eq 2}">����</c:if>
									<c:if test="${e.cat_num eq 3}">����</c:if>
									<c:if test="${e.cat_num eq 4}">ȸ������</c:if>
									<c:if test="${e.cat_num eq 5}">��Ÿ</c:if>
								</div>
								<div>${e.qna_title }</div>
								<div style="border: 1px solid gray; background-color: #E2E2E2;">${e.qna_content }
									<div>${e.qna_date }</div>
								</div>
							</c:forEach>
							<div class="card-body">
								<div class="demo">
									<ul class="pagination pg-primary">
										<li class="page-item">
											<!-- ���� ������  --> <input type="hidden" id="cntperpage"
											value="${paging.cntPerPage}"> <c:if
												test="${paging.startPage != 1 }">
												<a
													href="qna?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&categori=${paging.categori}
													&searchType=${paging.searchType }&searchValue=${paging.searchValue}"></a>
											</c:if> <c:forEach begin="${paging.startPage }"
												end="${paging.endPage }" var="p">
												<c:choose>
													<c:when test="${p == paging.nowPage }">
														<b>${p }</b>
														<input type="hidden" value="${p }" id="p">
														<!--���� ������ �ϰ�� ��ũ ���� -->
													</c:when>
													<c:when test="${p != paging.nowPage }">
														<!--�ٸ������� ��ũ   -->
														<a
															href="qna?nowPage=${p }&cntPerPage=${paging.cntPerPage}&categori=${paging.categori}
															&searchType=${paging.searchType }&searchValue=${paging.searchValue}">${p }</a>
													</c:when>
												</c:choose>
											</c:forEach> <!-- ����������  --> <c:if
												test="${paging.endPage != paging.lastPage}">
												<a
													href="qna?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&categori=${paging.categori}
													&searchType=${paging.searchType }&searchValue=${paging.searchValue}"></a>
											</c:if>
											</button> <%-- <!-- ���� ������  --> <c:if test="${paging.startPage != 1 }">
										<a
											href="qna?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}"></a>
									</c:if> <c:forEach begin="${paging.startPage }"
										end="${paging.endPage }" var="p">
										<c:choose>
											<c:when test="${p == paging.nowPage }">
												<b>${p }</b>
												<!--���� ������ �ϰ�� ��ũ ���� -->
											</c:when>
											<c:when test="${p != paging.nowPage }">
												<!--�ٸ������� ��ũ   -->
												<a href="qna?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
											</c:when>
										</c:choose>
									</c:forEach> <!-- ����������  --> <c:if
										test="${paging.endPage != paging.lastPage}">
										<a
											href="qna?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}"></a>
									</c:if>  --%> <!-- <a class="page-link" href="#" aria-label="Previous">
													<span aria-hidden="true"> < </span>
													<span class="sr-only"></span>
												</a>
											</li>
											<li class="page-item active"><a class="page-link" href="#">1</a></li>
											<li class="page-item"><a class="page-link" href="#">2</a></li>
											<li class="page-item"><a class="page-link" href="#">3</a></li>
											<li class="page-item">
												<a class="page-link" href="#" aria-label="Next">
													<span aria-hidden="true">></span>
													<span class="sr-only"></span>
												</a> -->
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		$('#one').click(function() {
			location = 'qna?categori=0'
		})
		$('#two').click(function() {
			location = 'qna?categori=2'
		})
		$('#three').click(function() {
			location = 'qna?categori=3'
		})
		$('#four').click(function() {
			location = 'qna?categori=4'
		})
		$('#five').click(function() {
			location = 'qna?categori=5'
		})
		
		$('#search').click(function() {
			location = 'qna?categori=0&searchType='+$('#searchType').val()+'&searchValue='+$('#searchValue').val()
		})
	</script>