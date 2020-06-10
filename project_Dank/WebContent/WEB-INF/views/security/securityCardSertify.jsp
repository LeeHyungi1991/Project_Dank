<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="content">
				<!-- ����� Ǫ���� ���� ���� -->
				<div class="panel-header bg-primary-gradient">
					<div class="page-inner py-5">
						<div class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
							<div>
								<h2 class="text-white pb-2 fw-bold"><!--  -->����ī�� ����</h2>
								<h5 class="text-white op-7 mb-2">
								<a href="index" class="btn btn-white btn-sm btn-border mr-1"><span class="flaticon-home"/></a>
								 <span class="h2 mr-1"> > </span>
								 <a href="securitycard" class="btn btn-white btn-sm btn-border mr-1">����ī��</a>
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
										<h4 class="card-title">����ī��</h4>
									</div>
									<p class="card-category">����</p>
								</div>
								
								<div class="card-body">
									<div class="row">
									
										<div class="col-md-4">
											<span class="blockquote blockquote-primary">����ī�� ��й�ȣ �Է�</span>
											<form action="" method="post">
												<div class="form-group">
													<label for="">
														<span class="h4 text-danger">
															[${scd[0][0]}]
														</span>
														<span class="h5" style="font-style: italic;">
															${scd[0][1]}
														</span>���� ���ڸ� </label>
													<input type="password" class="form-control" id="email2" placeholder="[�Ϸù�ȣ] - ${scd[0][1] }���� ���ڸ�">
												</div>
												<div class="form-group">
													<label for="email2">
														<span class="h4 text-danger">
															[${scd[1][0] }]
														</span> 
														<span class="h5" style="font-style: italic;">
															${scd[1][1] }
														</span>���� ���ڸ� </label>
													<input type="password" class="form-control" id="email2" placeholder="[${scd[1][0] }] - ${scd[1][1] }���� ���ڸ�">
												</div>
												<div class="form-group">
													<label for="email2">
														<span class="h4 text-danger">
															[${scd[2][0] }]
														</span>
														<span class="h5" style="font-style: italic;">
															${scd[2][1] }
														</span>���� ���ڸ� </label>
													<input type="password" class="form-control" id="email2" placeholder="[${scd[2][0] }] - ${scd[2][1] }���� ���ڸ�">
												</div>
												<div class="card-action">
													<button type="button" class="btn btn-danger">���</button>
													<input type="submit" class="btn btn-success" value="Ȯ��" />
												</div>
											</form>
										</div>
											
										<div class="col-md-8" style="text-align: center;">
												<table class="table table-bordered">
													<thead>
														<tr>
															<th colspan="8" style="text-align: left;">
																<span class="h1">����ī��</span>
																<span class="h6" style="font-style: italic;">${name}��</span>
															</th>
															<th colspan="2" style="text-align: right;">�Ϸù�ȣ : ${scrVo.sc_code}</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td style="text-align: center; font-style: italic; background-color: #F2F2F2;">1</td>
															<td style="text-align: center;">${scrVo.secCard.sc_detcode_1 }</td>
															<td style="text-align: center; font-style: italic; background-color: #F2F2F2;">2</td>
															<td style="text-align: center;">${scrVo.secCard.sc_detcode_2 }</td>
															<td style="text-align: center; font-style: italic; background-color: #F2F2F2;">3</td>
															<td style="text-align: center;">${scrVo.secCard.sc_detcode_3 }</td>
															<td style="text-align: center; font-style: italic; background-color: #F2F2F2;">4</td>
															<td style="text-align: center;">${scrVo.secCard.sc_detcode_5 }</td>
															<td style="text-align: center; font-style: italic; background-color: #F2F2F2;">5</td>
															<td style="text-align: center;">${scrVo.secCard.sc_detcode_6 }</td>
														</tr>
														<tr>
															<td style="text-align: center; font-style: italic; background-color: #F2F2F2;">6</td>
															<td style="text-align: center;">${scrVo.secCard.sc_detcode_6 }</td>
															<td style="text-align: center; font-style: italic; background-color: #F2F2F2;">7</td>
															<td style="text-align: center;">${scrVo.secCard.sc_detcode_7 }</td>
															<td style="text-align: center; font-style: italic; background-color: #F2F2F2;">8</td>
															<td style="text-align: center;">${scrVo.secCard.sc_detcode_8 }</td>
															<td style="text-align: center; font-style: italic; background-color: #F2F2F2;">9</td>
															<td style="text-align: center;">${scrVo.secCard.sc_detcode_9 }</td>
															<td style="text-align: center; font-style: italic; background-color: #F2F2F2;">10</td>
															<td style="text-align: center;">${scrVo.secCard.sc_detcode_10 }</td>
														</tr>
														<tr>
															<td style="text-align: center; font-style: italic; background-color: #F2F2F2;">11</td>
															<td style="text-align: center;">${scrVo.secCard.sc_detcode_11 }</td>
															<td style="text-align: center; font-style: italic; background-color: #F2F2F2;">12</td>
															<td style="text-align: center;">${scrVo.secCard.sc_detcode_12}</td>
															<td style="text-align: center; font-style: italic; background-color: #F2F2F2;">13</td>
															<td style="text-align: center;">${scrVo.secCard.sc_detcode_13 }</td>
															<td style="text-align: center; font-style: italic; background-color: #F2F2F2;">14</td>
															<td style="text-align: center;">${scrVo.secCard.sc_detcode_14 }</td>
															<td style="text-align: center; font-style: italic; background-color: #F2F2F2;">15</td>
															<td style="text-align: center;">${scrVo.secCard.sc_detcode_15 }</td>
														</tr>
														<tr>
															<td style="text-align: center; font-style: italic; background-color: #F2F2F2;">16</td>
															<td style="text-align: center;">${scrVo.secCard.sc_detcode_16}</td>
															<td style="text-align: center; font-style: italic; background-color: #F2F2F2;">17</td>
															<td style="text-align: center;">${scrVo.secCard.sc_detcode_17}</td>
															<td style="text-align: center; font-style: italic; background-color: #F2F2F2;">18</td>
															<td style="text-align: center;">${scrVo.secCard.sc_detcode_18 }</td>
															<td style="text-align: center; font-style: italic; background-color: #F2F2F2;">19</td>
															<td style="text-align: center;">${scrVo.secCard.sc_detcode_19}</td>
															<td style="text-align: center; font-style: italic; background-color: #F2F2F2;">20</td>
															<td style="text-align: center;">${scrVo.secCard.sc_detcode_20 }</td>
														</tr>
														<tr>
															<td style="text-align: center; font-style: italic; background-color: #F2F2F2;">21</td>
															<td style="text-align: center;">${scrVo.secCard.sc_detcode_21}</td>
															<td style="text-align: center; font-style: italic; background-color: #F2F2F2;">22</td>
															<td style="text-align: center;">${scrVo.secCard.sc_detcode_22}</td>
															<td style="text-align: center; font-style: italic; background-color: #F2F2F2;">23</td>
															<td style="text-align: center;">${scrVo.secCard.sc_detcode_23 }</td>
															<td style="text-align: center; font-style: italic; background-color: #F2F2F2;">24</td>
															<td style="text-align: center;">${scrVo.secCard.sc_detcode_24}</td>
															<td style="text-align: center; font-style: italic; background-color: #F2F2F2;">25</td>
															<td style="text-align: center;">${scrVo.secCard.sc_detcode_25 }</td>
														</tr>
														<tr>
															<td style="text-align: center; font-style: italic; background-color: #F2F2F2;">26</td>
															<td style="text-align: center;">${scrVo.secCard.sc_detcode_26}</td>
															<td style="text-align: center; font-style: italic; background-color: #F2F2F2;">27</td>
															<td style="text-align: center;">${scrVo.secCard.sc_detcode_27}</td>
															<td style="text-align: center; font-style: italic; background-color: #F2F2F2;">28</td>
															<td style="text-align: center;">${scrVo.secCard.sc_detcode_28 }</td>
															<td style="text-align: center; font-style: italic; background-color: #F2F2F2;">29</td>
															<td style="text-align: center;">${scrVo.secCard.sc_detcode_29}</td>
															<td style="text-align: center; font-style: italic; background-color: #F2F2F2;">30</td>
															<td style="text-align: center;">${scrVo.secCard.sc_detcode_30 }</td>
														</tr>
													</tbody>
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
			
	</script>

