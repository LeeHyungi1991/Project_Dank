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
								 <a href="caculator" class="btn btn-white btn-sm btn-border mr-1">���ڰ���</a>
								 </h5>
							</div>
							<div class="ml-md-auto py-2 py-md-0">
								<a href="checkbalance" class="btn btn-white btn-border btn-round mr-2">���� ������</a>
								<a href="#" class="btn btn-secondary btn-round">������</a>
							</div>
						</div>
					</div>
				</div>
		
		<!--��ȯ�ؾ��ϴ� ����  -->
		<form action="" class="form-horizontal">
				<div class="row mt--4">
				<div class="col-sm-6 col-md-3"></div>
						<div class="col-sm-6 col-md-6">
								<div class="card card-stats card-round">
								
									<div class="card-body ">
										<div class="row">
											<div class="col-2"></div>
											
											<div class="form-group col-8">
												<label class="form-label">��ȯ���</label>
												<div class="selectgroup w-100">
													<label class="selectgroup-item">
														<input type="radio" name="type" value="1" class="selectgroup-input" checked="checked">
														<span class="selectgroup-button">�����ݱյ�</span>
													</label>
													<label class="selectgroup-item">
														<input type="radio" name="type" value="2" class="selectgroup-input">
														<span class="selectgroup-button">���ݱյ�</span>
													</label>
													<label class="selectgroup-item">
														<input type="radio" name="type" value="3" class="selectgroup-input">
														<span class="selectgroup-button">�����Ͻ�</span>
													</label>
												</div>
											</div>
											<div class="col-2"></div>
											</div>
										
										<div class="row">
										<div class="col-2"></div>
												<div class="form-group col-8">
												<label class="form-label">��ȯ�Ⱓ</label>
												<div class="selectgroup w-100">
													<label class="selectgroup-item">
														<input type="radio" name="term" value="1" class="selectgroup-input" checked="checked">
														<span class="selectgroup-button">��</span>
													</label>
													<label class="selectgroup-item">
														<input type="radio" name="term" value="2" class="selectgroup-input">
														<span class="selectgroup-button">��</span>
													</label>
													<label>
														<input type="number" class="form-control input-lg">
													</label>
												</div>
											</div>
											<div class="col-2"></div>
										</div>	
										
										<div class="row">
										<div class="col-2"></div>
										<div class="col-5">
												<div class="form-group">
												<label class="form-label">���� �ݾ�</label>
												<div class="selectgroup w-100">
													<label>
														<input type="number" class="form-control input-lg">
													</label>
												</div>
											</div>
										</div>
										
										<div class="col-3">
												<div class="form-group">
												<label class="form-label">������</label>
												<div class="selectgroup w-100">
													<label>
														<input type="number" class="form-control input-lg" step="0.1">
													</label>
												</div>
											</div>
										</div>
										</div>
										<div class="row">
											<div class="col-2"></div>
											<div class="col-4">
											<button type="button" class="btn btn-primary"> �ʱ�ȭ </button>
											</div>
											<div class="col-4">
											<button type="button" class="btn btn-primary">����ϱ�</button>
											</div>
										</div>
										
									</div>
								</div>
							</div>
		<div class="col-sm-6 col-md-3"></div>
			
						</div>
		</form>
			</div>
		
			


			
			
			<script>
			
			
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

