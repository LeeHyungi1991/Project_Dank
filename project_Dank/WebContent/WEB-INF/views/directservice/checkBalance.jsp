<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="content">
				<!-- ����� Ǫ���� ���� ���� -->
				<div class="panel-header bg-primary-gradient">
					<div class="page-inner py-5">
						<div class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
							<div>
								<h2 class="text-white pb-2 fw-bold">Dank</h2>
								<h5 class="text-white op-7 mb-2">�������. Dank �����������Դϴ�.</h5>
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
				<div class="row">
						<!-- ���� ��ư 4�� ���� -->
						<div class="col-md-2">
							<!-- ���� ��ȸ -->
							<div class="card card-primary bg-primary-gradient" href="#pills-home-nobd">
								<div class="card-body">
									<h2 class="mb-2">���� ��ȸ</h2>
									<p class="d-flex justify-content-between pb-1 pt-1">Check balance</p>
								</div>
							</div>
							<!-- ���� ��ȸ -->
							<!-- ���� ��ü -->
							<div class="card" id="transfer">
								<div class="card-body pb-0">
									<h2 class="mb-2">���� ��ü</h2>
									<p class="text-muted">Wire money</p>
								</div>
							</div>
							<!-- ���� ��ü -->
							<!-- �м� -->
							<div class="card" id="analysis">
								<div class="card-body pb-0">
									<h2 class="mb-2">�м�</h2>
									<p class="text-muted">Analysis</p>
								</div>
							</div>
							<!-- �м� -->
							<!-- ȯ�� ��ȸ -->
							<div class="card" id="exchangeRate">
								<div class="card-body pb-0">
									<h2 class="mb-2">ȯ�� ��ȸ</h2>
									<p class="text-muted">Exchange rate</p>
								</div>
							</div>
							<!-- ȯ�� ��ȸ -->
						</div>
						<!-- ���� ��ư 4�� �� -->
						<div class="col-md-10">
							<div class="card">
								<div class="card-header">
									<div class="card-head-row">
										<div class="card-title">������ȸ</div>
									</div>
								</div>
								<div class="card-body">
									<div class="chart-container" style="min-height: 425px">
									
									<div class="row">
									<div class="col-5">
									
									<form action="chkvalue" method="post" >
										<table class="table mt-1">
											<tbody>
												<tr>
													<th scope="col">���� ��ȣ</th>
													<td>
														<div class="col-md-12 p-0">
															<input type="text" class="form-control input-full" 
															id="accountNumber" name="accountNumber" placeholder="(-���� �Է�)" maxlength="10">
														</div>
													</td>
												</tr>
												<tr>
													<th scope="col">���� ��ȣ</th>
													<td>
														<div class="col-md-12 p-0">
															<input type="password" class="form-control input-full" 
															id="accountPassword" name="accountPassword" placeholder="(4�ڸ�)" maxlength="4">
														</div>
													</td>
												</tr>
												<tr>
													<th scope="col">�ֹι�ȣ</th>
													<td>
														<div class="col-md-12 p-0">
															<input type="text" class="form-control input-full" 
															id="cnn" name="cnn" placeholder="(�� 6�ڸ�)" maxlength="6">
														</div>
													</td>
												</tr>
												<tr>
													<th scope="col">��ȸ����</th>
													<td>
														<div class="col-md-12 p-0">
															<label class="form-radio-label">
																<input class="form-radio-input" type="radio" name="type" checked="checked" value="0">
																<span class="form-radio-sign">��ü</span>
															</label>
															<label class="form-radio-label ml-12">
																<input class="form-radio-input" type="radio" name="type" value="1">
																<span class="form-radio-sign">�Ա�</span>
															</label>
															<label class="form-radio-label ml-12">
																<input class="form-radio-input" type="radio" name="type" value="2">
																<span class="form-radio-sign">���</span>
															</label>
														</div>
													</td>
												</tr>
												<tr>
													<th scope="col">��ȸ ��¥</th>
													<td>
														<div class="col-md-12 p-0">
															<input class="form-control" type="date" id="searchDate" name="searchDate">
														</div>
													</td>
												</tr>
											</tbody>
											<tfoot>
												<tr>
													<th colspan="2">
														<div class="row">
															<div class="col-md-6 ml-auto mr-auto">
																<input type="submit" value="��ȸ" class="btn btn-success"/>
															</div>
														</div>
													</th>
												</tr>
											</tfoot>
										</table>
										</form>
									</div>
									
									<div class="col-md-7">
										<table class="table mt-1">
											<thead>
												<tr>
													<th scope="col">��¥</th>
													<th scope="col">���</th>
													<th scope="col">���ݾ�</th>
												</tr>
											</thead>
											
											<tbody>
												<tr>
													<c:if test="${type!=null}">
														<td>2020.05.22</td>
														<td>�Ⱦ����</td>
														<td>
															<p class="blockquote blockquote-primary">284,000��</p>
															<span class="h6" style="text-align: left;">620,520��</span>
														</td>
													</c:if>
												</tr>
												
											</tbody>
										</table>
									</div>
								</div>
										<canvas id="statisticsChart"></canvas>
									</div>
									<div id="myChartLegend">
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- ���� ������ �� -->
					<!-- ������ ���̾ƿ� �� -->
				</div>
			</div>


			
			<script>
			/* ������ �̵� �ڹٽ�ũ��Ʈ ���� */
			$("#checkBalance").click(function() {
				location = "checkbalance";
			});
			$("#transfer").click(function() {
				location = "transfer";
			});
			$("#analysis").click(function() {
				location = "analysis";
			});
			$("#exchangeRate").click(function() {
				location = "exchangerate";
			});
			/* ������ �̵� �ڹٽ�ũ��Ʈ �� */
			
		Circles.create({
			id:'circles-1',
			radius:45,
			value:60,
			maxValue:100,
			width:7,
			text: 5,
			colors:['#f1f1f1', '#FF9E27'],
			duration:400,
			wrpClass:'circles-wrp',
			textClass:'circles-text',
			styleWrapper:true,
			styleText:true
		})

		Circles.create({
			id:'circles-2',
			radius:45,
			value:70,
			maxValue:100,
			width:7,
			text: 36,
			colors:['#f1f1f1', '#2BB930'],
			duration:400,
			wrpClass:'circles-wrp',
			textClass:'circles-text',
			styleWrapper:true,
			styleText:true
		})

		Circles.create({
			id:'circles-3',
			radius:45,
			value:40,
			maxValue:100,
			width:7,
			text: 12,
			colors:['#f1f1f1', '#F25961'],
			duration:400,
			wrpClass:'circles-wrp',
			textClass:'circles-text',
			styleWrapper:true,
			styleText:true
		})

		var totalIncomeChart = document.getElementById('totalIncomeChart').getContext('2d');

		var mytotalIncomeChart = new Chart(totalIncomeChart, {
			type: 'bar',
			data: {
				labels: ["S", "M", "T", "W", "T", "F", "S", "S", "M", "T"],
				datasets : [{
					label: "Total Income",
					backgroundColor: '#ff9e27',
					borderColor: 'rgb(23, 125, 255)',
					data: [6, 4, 9, 5, 4, 6, 4, 3, 8, 10],
				}],
			},
			options: {
				responsive: true,
				maintainAspectRatio: false,
				legend: {
					display: false,
				},
				scales: {
					yAxes: [{
						ticks: {
							display: false //this will remove only the label
						},
						gridLines : {
							drawBorder: false,
							display : false
						}
					}],
					xAxes : [ {
						gridLines : {
							drawBorder: false,
							display : false
						}
					}]
				},
			}
		});

		$('#lineChart').sparkline([105,103,123,100,95,105,115], {
			type: 'line',
			height: '70',
			width: '100%',
			lineWidth: '2',
			lineColor: '#ffa534',
			fillColor: 'rgba(255, 165, 52, .14)'
		});
	</script>

