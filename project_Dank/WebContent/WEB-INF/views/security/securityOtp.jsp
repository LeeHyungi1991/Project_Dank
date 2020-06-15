<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>


<div class="content">
				<!-- ����� Ǫ���� ���� ���� -->
				<div class="panel-header bg-primary-gradient">
					<div class="page-inner py-5">
						<div class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
							<div>
								<h2 class="text-white pb-2 fw-bold">����������</h2>
								<h5 class="text-white op-7 mb-2">
								<a href="index" class="btn btn-white btn-sm btn-border mr-1"><span class="flaticon-home"/></a>
								 <span class="h2 mr-1"> > </span>
								 <a href="securityotp" class="btn btn-white btn-sm btn-border mr-1">OTP</a>
								 <span class="h2 mr-1"> > </span>
								 <a href="securityotp" class="btn btn-white btn-sm btn-border mr-1">��û</a>
								 </h5>
							</div>
							<div class="ml-md-auto py-2 py-md-0">
								<a href="checkbalance" class="btn btn-white btn-border btn-round mr-2">���� ������</a>
								<a href="qna" class="btn btn-secondary btn-round">������</a>
							</div>
						</div>
					</div>
				</div>
				<!-- ����� Ǫ���� ���� �� -->
				<div class="page-inner mt--5">
				<!-- ������ ���̾ƿ� ���� -->
				<div class="row row-card-no-pd">
						<div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<div class="card-head-row card-tools-still-right">
										<h4 class="card-title">OTP</h4>
									</div>
									<p class="card-category">
									��û</p>
								</div>
								
								<div class="card-body">
									<div class="row">
										<div class="col-11">
											<table class="table mt-1">
											<tbody>
												<tr>
													<th scope="col">��ȭ��ȣ</th>
													<td>
														<div class="row">
															<div class="col-2">
																<select class="form-control" id="exampleFormControlSelect1">
																	<option>SKT</option>
																	<option>KT</option>
																	<option>LGU</option>
																</select>
															</div>
															<div class="col-2">
																<input type="text" class="form-control input-full">
															</div>
															<div class="col-2">
																<input type="text" class="form-control input-full">
															</div>
															<div class="col-2">
																<input type="text" class="form-control input-full">
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<th scope="col">�̸���</th>
													<td>
														<div class="row">
															<div class="col-8">
																<input type="text" class="form-control input-full">                                      
															</div>
															<div class="col-4">
																<button class="btn btn-primary" id="emailsend">����</button>
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<th scope="col">������ȣ</th>
													<td>
														<div class="row">
															<div class="col-8">
																<input type="text" class="form-control input-full">                                      
															</div>
															<div class="col-4 mt-1">
																<button class="btn btn-success btn-sm" disabled="disabled">Success</button>
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<th scope="col">�ֹε�Ϲ�ȣ</th>
													<td>
														<div class="row">
															<div class="col-7">
																<input type="text" class="form-control input-full">
															</div>
														</div>
													</td>
												</tr>
											</tbody>
											<tfoot>
												<tr>
													<th colspan="2">
														<div class="row">
															<div class="col-md-6 ml-auto mr-auto">
																<button class="btn btn-danger" id="cancel">���</button>
																<button class="btn btn-success" id="send">Ȯ��</button>
															</div>
														</div>
													</th>
												</tr>
											</tfoot>
										</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- ������ ���̾ƿ� �� -->
				</div>
			</div>

			
			<script>
			$("#cancel").click(function() {
				location = "security";
			});
			$("#send").click(function() {
				location = "securityotpsuccess";
			});
			$('#emailsend').click(function(e) {
				swal({
					title: '�̸����� ���� �Ͻðڽ��ϱ�?',
					text: "�̸����� Ȯ�����ּ���. \n hani@naver.com",
					type: 'warning',
					buttons:{
						confirm: {
							text : '����',
							className : 'btn btn-success'
						},
						cancel: {
							text : '���',
							visible: true,
							className: 'btn btn-danger'
						}
					}
				}).then((Delete) => {
					if (Delete) {
						swal({
							title: '���۵Ǿ����ϴ�.',
							text: '���۵� �ڵ带 �Է����ּ���.',
							type: 'success',
							buttons : {
								confirm: {
									text : 'Ȯ��',
									className : 'btn btn-success'
								}
							}
						});
					} else {
						swal.close();
					}
				});
			});
			/*  */
			const { config, Group } = require('coolsms-node-sdk')

			// ������ ���� �߱޹��� ������ API Key�� ����մϴ�.
			const apiKey = 'NCSNJETH2DZH45LE'
			const apiSecret = 'HPUX3CCLXEEJSLEWMVS3JTSDNIWVHDNZ'
			config.init({ apiKey, apiSecret })
			async function send (params = {}) {
			  try {
			    const response = await Group.sendSimpleMessage(params)
			    console.log(response)
			  } catch (e) {
			    console.log(e)
			  }
			}

			const params = {
			  text: '�ϴϾ� �츮 ���� �� �Ծ�?', // ���� ����
			  type: 'SMS', // �߼��� �޽��� Ÿ�� (SMS, LMS, MMS, ATA, CTA)
			  to: '01072588357', // ���Ź�ȣ (�޴���)
			  from: '01039475130' // �߽Ź�ȣ (��������)
			}
			send(params)
	</script>

