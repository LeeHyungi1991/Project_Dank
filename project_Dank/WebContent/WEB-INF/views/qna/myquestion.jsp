<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="content">
	<!-- 상단의 푸른색 공간 시작 -->
	<div class="panel-header bg-primary-gradient">
		<div class="page-inner py-5">
			<div
				class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
				<div>
					<h2 class="text-white pb-2 fw-bold">고객센터</h2>
					<h5 class="text-white op-7 mb-2">
						<a href="index" class="btn btn-white btn-sm btn-border mr-1">
							<span class="flaticon-home" />
						</a> <span class="h2 mr-1"> > </span> <a href="search"
							class="btn btn-white btn-sm btn-border mr-1">자주 찾는 실문</a>
					</h5>
				</div>
				<div class="ml-md-auto py-2 py-md-0">
					<a href="checkbalance"
						class="btn btn-white btn-border btn-round mr-2">빠른 페이지</a> <a
						href="qna" class="btn btn-secondary btn-round">고객센터</a>
				</div>
			</div>
		</div>
	</div>
	<!-- 상단의 푸른색 공간 끝 -->

	<div class="page-inner mt--5">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header">
						<div class="card-head-row">
							<div class="card-title col-3">자주 찾는 질문</div>
						</div>
					</div>
					<div class="form-group" id="">
						<div class="input-icon" style="display: inline-block;">



							<!-- <input type="text" class="form-control"
								placeholder="Search for..."">
						</div>
						<button class="btn btn-info" style="display: inline-block;">검색</button> -->
						<select name="searchType" id="searchType">
						<option value="1">항목</option>
						<option value="2">번호</option>	
						<option value="3">내용</option>
						<option value="4">날짜</option>
						</select>
						<input type="text" name="searchValue" id="searchValue">
						<input class="btn btn-info" type="button" id="search" value="검색">


							


						</div>
						<div class="card-body">
							<button id="one"
								style="background-color: #48abf7; border-color: #48abf7; color: white; border: 1px solid transparent;">전체</button>
							<button id="two"
								style="background-color: #48abf7; border-color: #48abf7; color: white; border: 1px solid transparent;">
								예금</button>
							<button id="three"
								style="background-color: #48abf7; border-color: #48abf7; color: white; border: 1px solid transparent;">
								대출</button>
							<button id="four"
								style="background-color: #48abf7; border-color: #48abf7; color: white; border: 1px solid transparent;">회원정보</button>
							<button id="five"
								style="background-color: #48abf7; border-color: #48abf7; color: white; border: 1px solid transparent;">기타</button>

							<c:forEach items="${list }" var="e">
								<div>${e.qna_num }번)
									<c:if test="${e.cat_num eq 2}">예금</c:if>
									<c:if test="${e.cat_num eq 3}">대출</c:if>
									<c:if test="${e.cat_num eq 4}">회원정보</c:if>
									<c:if test="${e.cat_num eq 5}">기타</c:if>
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
											<!-- 이전 페이지  --> <input type="hidden" id="cntperpage"
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
														<!--현재 페이지 일경우 링크 해제 -->
													</c:when>
													<c:when test="${p != paging.nowPage }">
														<!--다른페이지 링크   -->
														<a
															href="qna?nowPage=${p }&cntPerPage=${paging.cntPerPage}&categori=${paging.categori}
															&searchType=${paging.searchType }&searchValue=${paging.searchValue}">${p }</a>
													</c:when>
												</c:choose>
											</c:forEach> <!-- 다음페이지  --> <c:if
												test="${paging.endPage != paging.lastPage}">
												<a
													href="qna?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&categori=${paging.categori}
													&searchType=${paging.searchType }&searchValue=${paging.searchValue}"></a>
											</c:if>
											</button> <%-- <!-- 이전 페이지  --> <c:if test="${paging.startPage != 1 }">
										<a
											href="qna?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}"></a>
									</c:if> <c:forEach begin="${paging.startPage }"
										end="${paging.endPage }" var="p">
										<c:choose>
											<c:when test="${p == paging.nowPage }">
												<b>${p }</b>
												<!--현재 페이지 일경우 링크 해제 -->
											</c:when>
											<c:when test="${p != paging.nowPage }">
												<!--다른페이지 링크   -->
												<a href="qna?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
											</c:when>
										</c:choose>
									</c:forEach> <!-- 다음페이지  --> <c:if
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