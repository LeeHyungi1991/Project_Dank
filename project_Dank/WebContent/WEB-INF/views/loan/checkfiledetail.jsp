<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<div class="content">
					<div class="panel-header bg-primary-gradient">
					<div class="page-inner py-5">
						<div class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
							<div>
								<h2 class="text-white pb-2 fw-bold">����</h2>
								<h5 class="text-white op-7 mb-2">
								<a href="index" class="btn btn-white btn-sm btn-border mr-1"><span class="flaticon-home"/></a>
								 <span class="h2 mr-1"> > </span>
								 <a href="check" class="btn btn-white btn-sm btn-border mr-1">������Ȳ��ȸ</a>
								 </h5>
							</div>
							<div class="ml-md-auto py-2 py-md-0">
								<a href="checkbalance" class="btn btn-white btn-border btn-round mr-2">���� ������</a>
								<a href="qna" class="btn btn-secondary btn-round">������</a>
							</div>
						</div>
					</div>
				</div>
				<!--���� ��û   -->
				<div class="row mt--4">
				<div class="col-sm-6 col-md-2"></div>
						<div class="col-sm-6 col-md-8">
								<div class="card card-stats card-round">
								
									<div class="card-body ">
										<div class="row">
											<div class="col-1"></div>
											<div class="col-10">
												
												<h1>���⼭�� Ȯ��</h1>
												<hr>
												 
												<h3>÷�� ����</h3>
												
												<input type="hidden" value="${vo.lc_num }" name="lc_num" id="lc_num"> 
												
												<c:if test="${vo.file1 ne null }">
												<div class="form-group row">
													<label for="file1" class="col-4" >�ֹε�ϵ</label>
													<div class="col-8">
														<a href="<c:url value="/fileDown.do?fileDir=/resources/upload/${vo.lc_num }&fileName=${vo.file1} "/>">
															${vo.file1}
														</a>
													</div>
												</div>
												</c:if>
												
													<c:if test="${vo.file2 ne null }">
												<div class="form-group row">
													<label for="file2" class="col-4">�ֹε���ʺ�</label>
													<div class="col-8">
														<a href="<c:url value="/fileDown.do?fileDir=/resources/upload/${vo.lc_num }&fileName=${vo.file2 }"/>">
															${vo.file2 }
														</a>
													</div>
												</div>
													</c:if>
			
												<c:if test="${vo.file3 ne null }">
												<div class="form-group row">
													<label for="file3" class="col-4" >�ҵ�ݾ������</label>
													<div class="col-8">
														<a href="<c:url value="/fileDown.do?fileDir=/resources/upload/${vo.lc_num }&fileName=${vo.file3} "/>">
															${vo.file3}
														</a>
													</div>
												</div>
												</c:if>
												
												<c:if test="${vo.file4 ne null }">
												<div class="form-group row">
													<label for="file4" class="col-4">���Ȯ�������</label>
													<div class="col-8">
													<a href="<c:url value="/fileDown.do?fileDir=/resources/upload/${vo.lc_num }&fileName=${vo.file4} "/>">
															${vo.file4}
														</a>
													</div>
												</div>
												</c:if>
												
												
												<c:if test="${vo.file5 ne null }">
												<div class="form-group row">
													<label for="file5" class="col-4">�ǰ����賳�η�Ȯ�μ�</label>
													<div class="col-8">
														<a href="<c:url value="/fileDown.do?fileDir=/resources/upload/${vo.lc_num }&fileName=${vo.file5} "/>">
															${vo.file5} 
														</a>
													</div>
												</div>
												</c:if>
												
												<c:if test="${vo.file6 ne null }">
												<div class="form-group row">
													<label for="file6" class="col-4">�ǰ������ڰݵ��Ȯ�μ�</label>
													<div class="col-8">
														<a href="<c:url value="/fileDown.do?fileDir=/resources/upload/${vo.lc_num }&fileName=${vo.file6} "/>">
															${vo.file6}
														</a>
													</div>
												</div>
												</c:if>
												
												<c:if test="${vo.file7 ne null }">
												<div class="form-group row">
													<label for="file7" class="col-4">�ٷμҵ��õ¡��������</label>
													<div class="col-8">
														<a href="<c:url value="/fileDown.do?fileDir=/resources/upload/${vo.lc_num }&fileName=${vo.file7} "/>">
															${vo.file7}
														</a>

													</div>
												</div>
												</c:if>
												
												<c:if test="${vo.file8 ne null }">
												<div class="form-group row">
													<label for="file8" class="col-4">����ڵ����</label>
													<div class="col-8">
													<a href="<c:url value="/fileDown.do?fileDir=/resources/upload/${vo.lc_num }&fileName=${vo.file8} "/>">
															${vo.file8}
														</a>

													</div>
												</div>
												</c:if>
												
												<c:if test="${vo.file9 ne null }">
												<div class="form-group row">
													<label for="file9" class="col-4">������ֹε�ϵ</label>
													<div class="col-8">
													<a href="<c:url value="/fileDown.do?fileDir=/resources/upload/${vo.lc_num }&fileName=${vo.file9} "/>">
															${vo.file9}
														</a>
													</div>
												</div>
												</c:if>
												
												<c:if test="${vo.file10 ne null }">
												<div class="form-group row">
													<label for="file10" class="col-4">������ֹε���ʺ�</label>
													<div class="col-8">
													<a href="<c:url value="/fileDown.do?fileDir=/resources/upload/${vo.lc_num }&fileName=${vo.file10} "/>">
															${vo.file10}
														</a>
													</div>
												</div>
												</c:if>
												
												<c:if test="${vo.file11 ne null }">
												<div class="form-group row">
													<label for="file11" class="col-4">����ڼҵ�ݾ������</label>
													<div class="col-8">
													<a href="<c:url value="/fileDown.do?fileDir=/resources/upload/${vo.lc_num }&fileName=${vo.file11} "/>">
															${vo.file11}
														</a>
													</div>
												</div>
												</c:if>
												
												<c:if test="${vo.file12 ne null }">
												<div class="form-group row">
													<label for="file12" class="col-4">����ڻ��Ȯ�������</label>
													<div class="col-8">
													<a href="<c:url value="/fileDown.do?fileDir=/resources/upload/${vo.lc_num }&fileName=${vo.file12} "/>">
															${vo.file12}
														</a>
													</div>
												</div>
												</c:if>
												
												<c:if test="${vo.file13 ne null }">
												<div class="form-group row">
													<label for="file13" class="col-4">����ڰǰ����賳�η�Ȯ�μ�</label>
													<div class="col-8">
													<a href="<c:url value="/fileDown.do?fileDir=/resources/upload/${vo.lc_num }&fileName=${vo.file13} "/>">
															${vo.file13}
														</a>
													</div>
												</div>
												</c:if>
												
												<c:if test="${vo.file14 ne null }">
												<div class="form-group row">
													<label for="file14" class="col-4">����ڰǰ������ڰݵ��Ȯ�μ�</label>
													<div class="col-8">
													<a href="<c:url value="/fileDown.do?fileDir=/resources/upload/${vo.lc_num }&fileName=${vo.file14} "/>">
															${vo.file14}
														</a>
													</div>
												</div>
												</c:if>
												<c:if test="${vo.file15 ne null }">
												<div class="form-group row">
													<label for="file15" class="col-4">����ڱٷμҵ��õ¡��������</label>
													<div class="col-8">
													<a href="<c:url value="/fileDown.do?fileDir=/resources/upload/${vo.lc_num }&fileName=${vo.file15} "/>">
															${vo.file15}
														</a>
													</div>
												</div>
												</c:if>
												
												<c:if test="${vo.file16 ne null }">
												<div class="form-group row">
													<label for="file16" class="col-4">����ڻ���ڵ����</label>
													<div class="col-8">
													<a href="<c:url value="/fileDown.do?fileDir=/resources/upload/${vo.lc_num }&fileName=${vo.file16} "/>">
															${vo.file16}
														</a>
													</div>
												</div>
											</c:if>
											
											<c:if test="${vo.file17 ne null }">
												<div class="form-group row">
													<label for="file17" class="col-4">��Ÿ1</label>
													<div class="col-8">
													<a href="<c:url value="/fileDown.do?fileDir=/resources/upload/${vo.lc_num }&fileName=${vo.file17} "/>">
															${vo.file17}
														</a>
													</div>
												</div>
												</c:if>
												
												<c:if test="${vo.file18 ne null }">
												<div class="form-group row">
													<label for="file18" class="col-4">��Ÿ2</label>
													<div class="col-8">
													<a href="<c:url value="/fileDown.do?fileDir=/resources/upload/${vo.lc_num }&fileName=${vo.file18} "/>">
															${vo.file18}
														</a>
													</div>
												</div>
												</c:if>
												
												<c:if test="${vo.file19 ne null }">
												<div class="form-group row">
													<label for="file19" class="col-4">��Ÿ3</label>
													<div class="col-8">
													<a href="<c:url value="/fileDown.do?fileDir=/resources/upload/${vo.lc_num }&fileName=${vo.file19} "/>">
															${vo.file19}
														</a>
													</div>
												</div>
											</c:if>
											<c:if test="${vo.file20 ne null }">
												<div class="form-group row">
													<label for="file20" class="col-4">��Ÿ4</label>
													<div class="col-8">
													<a href="<c:url value="/fileDown.do?fileDir=/resources/upload/${vo.lc_num }&fileName=${vo.file20} "/>">
															${vo.file20}
														</a>
													</div>
												</div>
												</c:if>
												
												
											</div>
											<div class="col-1"></div>
										</div>
									</div>
								</div>
							</div>
		<div class="col-sm-6 col-md-2"></div>
			
						</div>
					
			<p class="text-center"><input type="button" id="refile" class="btn btn-info" value="�ٽ������ϱ�"></p>
			</div>
		
			


			
			<script>
		$('#refile').click(function() {
			location="checkrefile?lc_num="+$('#lc_num').val();
		})
	</script>

