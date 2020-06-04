<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>


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
								<a href="#" class="btn btn-secondary btn-round">������</a>
							</div>
						</div>
					</div>
				</div>
				<!-- ����� Ǫ���� ���� �� -->
				<div class="page-inner mt--5">
				<!-- ������ ���̾ƿ� ���� -->
				<div class="row">
						<!-- ���� ��ư ���� -->
						<div class="col-md-2">
							<!-- ���� ��ȸ -->
							<div class="card" id="checkBalance">
								<div class="card-body pb-0">
									<h2 class="mb-2">���� ��ȸ</h2>
									<p class="text-muted">Check balance</p>
								</div>
							</div>
							<!-- ���� ��ȸ -->
							<!-- ���� ��ü -->
							<div class="card" id="wireMoney">
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
							<div class="card card-primary bg-primary-gradient">
								<div class="card-body">
									<h2 class="mb-2">ȯ�� ��ȸ</h2>
									<p class="d-flex justify-content-between pb-1 pt-1">Exchange rate</p>
								</div>
							</div>
							<!-- ȯ�� ��ȸ -->
						</div>
						<!-- ���� ��ư �� -->
						<div class="col-md-10">
							<div class="card">
								<div class="card-header">
									<div class="card-head-row">
										<div class="card-title">ȯ�� ��ȸ</div>
									</div>
								</div>
								<div class="card-body">
									<div class="chart-container" style="min-height: 425px">
										<div class="row">
										<div class="col-md-4 ml-auto">
											<table style="width: 250px;">
												<tr>
													<th>
														<div class="row">
															<div class="col-12">
																<span>��ȸ ������</span>
															</div>
														</div>
													</th>
													<th>
														<div class="row">
															<div class="col-12">
																<select class="form-control" id="exampleFormControlSelect1">
																	<option>2020.05.01</option>
																	<option>2020.05.02</option>
																	<option>2020.05.03</option>
																	<option>2020.05.04</option>
																	<option>2020.05.05</option>
																</select>
															</div>
														</div>
													</th>
												</tr>
											</table>
											</div>
										</div>
									<div class="row">
									<div class="col-md-6 ml-auto mr-auto">
										<table class="table table-striped mt-3">
										<thead>
											<tr>
												<th scope="col">����</th>
												<th scope="col">��ȭ</th>
												<th scope="col">�Ÿű�����</th>
												<th scope="col">T/C ��Ƕ�</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>�̱�(�޷�)</td>
												<td>USD</td>
												<td>1,300</td>
												<td>1,200</td>
											</tr>
											<tr>
												<td>�Ϻ�(��ȭ)</td>
												<td>JPY</td>
												<td>1,200</td>
												<td>1,100</td>
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
			$("#wireMoney").click(function() {
				location = "wiremoney";
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

