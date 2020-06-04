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
								 <a href="product" class="btn btn-white btn-sm btn-border mr-1">�����ǰ</a>
								 </h5>
							</div>
							<div class="ml-md-auto py-2 py-md-0">
								<a href="checkbalance" class="btn btn-white btn-border btn-round mr-2">���� ������</a>
								<a href="#" class="btn btn-secondary btn-round">������</a>
							</div>
						</div>
					</div>
				</div>
				<!--���� ���   -->
				<div class="row mt--4">
				<div class="col-1"></div>
				<div class="row row-card-no-pd col-10">
					
						<div class="col-sm-6 col-md-3">
								<div class="card card-stats card-round">
									<a href="index.jsp">
									<div class="card-body ">
										<div class="row">
											<div class="col-3">
												<div class="icon-big text-center">
													<i class="flaticon-coins text-success"></i>
												</div>
											</div>
											<div class="col-9 col-stats">
												<div class="numbers">
													<p class="card-category">���㺸 ����</p>
													<h4 class="card-title">kosmo����</h4>
												</div>
											</div>
										</div>
									</div>
											</a>
								</div>
							</div>
			
							<div class="col-sm-6 col-md-3">
								<div class="card card-stats card-round">
								<a href="index.jsp">
									<div class="card-body">
										<div class="row">
											<div class="col-3">
												<div class="icon-big text-center">
													<i class="flaticon-coins text-success"></i>
												</div>
											</div>
											<div class="col-9 col-stats">
												<div class="numbers">
													<p class="card-category">���㺸 ����</p>
													<h4 class="card-title">������ ����</h4>
												</div>
											</div>
										</div>
									</div>
									</a>
								</div>
							</div>
							<div class="col-sm-6 col-md-3">
								<div class="card card-stats card-round">
								<a href="index.jsp">
									<div class="card-body">
										<div class="row">
											<div class="col-3">
												<div class="icon-big text-center">
													<i class="flaticon-coins text-success"></i>
												</div>
											</div>
											<div class="col-9 col-stats">
												<div class="numbers">
													<p class="card-category">���㺸 ����</p>
													<h4 class="card-title">�ſ� ����</h4>
												</div>
											</div>
										</div>
									</div>
									</a>
								</div>
							</div>
							<div class="col-sm-6 col-md-3">
								<div class="card card-stats card-round">
								<a href="index.jsp">
									<div class="card-body">
										<div class="row">
											<div class="col-3">
												<div class="icon-big text-center">
													<i class="flaticon-coins text-success"></i>
												</div>
											</div>
											<div class="col-9 col-stats">
												<div class="numbers">
													<p class="card-category">���㺸 ����</p>
													<h4 class="card-title">�︸���� ����</h4>
												</div>
											</div>
										</div>
									</div>
									</a>
								</div>
							</div>
						</div>
				</div>
				<!--���� ���� ������ ��  -->
				<div class="row">
				<div class="col-1"></div>
					<div class="row row-card-no-pd col-10" id="target">
						<div class="col-md-12">
						<h1 class="text-center">���� ������ ���� ���Դϴ�.</h1><br>
						</div>
						<div class="col-md-12">
						<p class="text-center">�˰� ���� ������ Ŭ���� ������!</p>
						</div>
						</div>
						</div>
			<div>
			
			<p class="text-center"><button type="button" class="btn btn-info" onclick="location='applicationform'">���� ��û</button></p>
		
			</div>
			
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
