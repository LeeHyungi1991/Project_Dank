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
								 <a href="repayment" class="btn btn-white btn-sm btn-border mr-1">�����ȯ</a>
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
											<div class="col-10 jumbotron">
												
												<h3>���� ��û ����</h3>
												<div class="form-group">
													<label for="name" class="col-sd-2 control-label">�̸�</label>
													<div class="col-sd-10">
   														<input type="email" class="form-control" id="name" readonly="readonly" value="��û�� �̸�">
   													</div>
												</div>
												
												<hr>
												<h3>���� ����</h3>
												<div class="form-group">
													<label for="loanname" class="col-sd-2 control-label">�����</label>
													<div class="col-sd-10">
	   													<input type="email" class="form-control" id="loanname" readonly="readonly" value="������ ����">
													</div>
												</div>
												
												<div class="form-group">
													<label for="interestrate" class="col-sd-2">��������</label>
													<div class="col-sd-10">
   														<input type="email" class="form-control" id="interestrate" readonly="readonly" value="������ ���� ����">
   													</div>
												</div>
												<div class="form-group">
												<label for="amount" class="col-sd-2">���� ��� �ݾ�</label>
												<div class="col-sd-10">
												<input type="number" class="form-control" id="amount" value="30000000" readonly="readonly">
												</div>
												
											</div>
				 								
												<div class="form-group">
												<label for="period" class="col-sd-2">��ȯ�Ⱓ</label>
												<div class="col-sd-10">
												<select class="form-control" id="period" >
													<option selected="selected">10��</option>
												</select>
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
					
			<p class="text-center"><button type="button" class="btn btn-info" onclick="location='repaymentform'">��ȯ�ϱ�</button></p>
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

