<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

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
		<form action="" class="form-horizontal">
				<div class="row mt--4">
				<div class="col-sm-6 col-md-2"></div>
						<div class="col-sm-6 col-md-8">
								<div class="card card-stats card-round">
								
									<div class="card-body ">
										<div class="row">
											<div class="col-1"></div>
											<div class="col-10">
												
												<h1>���� ��û ����</h1>
												<hr>
												<h3>������ ����</h3>
												<div class="form-group">
													<label for="name" class="col-sd-2 control-label">�̸�</label>
													<div class="col-sd-10">
   														<input type="email" class="form-control" id="name" readonly="readonly" value="��û�� �̸�">
   													</div>
												</div>
												
												<hr>
												<h3>���� ����</h3>
												<div class="form-group row">
													<label class="col-2 control-label" >�����ȣ</label>
													<div class="col-10">
														${vo.lc_num }
														<input type="hidden" name="lp_num" id="lp_num" value="${vo.lc_num }">
													</div>
												</div>
												
												<div class="form-group row">
													<label class="col-2 control-label" >�������</label>
													<div class="col-10">
														${vo.lc_state }
													</div>
												</div>
												
												<div class="form-group row">
													<label class="col-2 control-label" >��û��¥</label>
													<div class="col-10">
														${vo.loanApplicationVO.la_sysdate }
													</div>
												</div>
												
												
												<div class="form-group row">
													<label class="col-2 control-label" >�����</label>
													<div class="col-10">
														${vo.loanProductVO.lp_name }
													</div>
												</div>
												
												<div class="form-group row">
													<label class="col-2 control-label" >�������ݾ�</label>
													<div class="col-10">
														${vo.loanApplicationVO.la_hamount }��
													</div>
												</div>
												
												<div class="form-group row">
													<label class="col-2 control-label" >���������</label>
													<div class="col-10">
														${vo.loanApplicationVO.la_startdate }
													</div>
												</div>
												
												<div class="form-group row">
													<label class="col-2 control-label" >��ȯ���</label>
													<div class="col-10">
														${vo.loanApplicationVO.lr_type }
													</div>
												</div>
												
												<div class="form-group row">
													<label class="col-2 control-label" >��ġ�Ⱓ</label>
													<div class="col-10">
														${vo.loanApplicationVO.la_livingterm }
													</div>
												</div>
												
												<div class="form-group row">
													<label class="col-2 control-label" >��ȯ�Ⱓ</label>
													<div class="col-10">
														${vo.loanApplicationVO.la_repayterm }
													</div>
												</div>
												
												
												
												<hr>
												<h3>÷�� ����</h3>
												<div class="form-group">
												<label for="file1" >�ֹε�ϵ</label>
												<input type="file" class="form-control-file" id="file1">
											</div>
											<div class="form-group">
												<label for="file2" >�ֹε���ʺ�</label>
												<input type="file" class="form-control-file" id="file2">
											</div>
											<div class="form-group">
												<label for="file3" >������������</label>
												<input type="file" class="form-control-file" id="file3">
											</div>
											<div class="form-group">
												<label for="file4" >�ҵ�ݾ�����</label>
												<input type="file" class="form-control-file" id="file4">
											</div>
											
											
											</div>
											<div class="col-1"></div>
										</div>
									</div>
								</div>
							</div>
		<div class="col-sm-6 col-md-2"></div>
			
						</div>
					
			<p class="text-center"><button type="button" class="btn btn-info" onclick="location='repaymentform'">��ȯ �ϱ�</button></p>
		</form>
			</div>
		
			


			
			<script>
			
		console.log('')
	</script>

