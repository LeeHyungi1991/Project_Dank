<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>


<div class="content">
				<!-- ����� Ǫ���� ���� ���� -->
				<div class="panel-header bg-primary-gradient">
					<div class="page-inner py-5">
						<div class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
							<div>
								<h2 class="text-white pb-2 fw-bold">����</h2>
								<h5 class="text-white op-7 mb-2">
								<a href="index" class="btn btn-white btn-sm btn-border mr-1"><span class="flaticon-home"/></a>
								 <span class="h2 mr-1"> > </span>
								 <a href="deposite_cancle" class="btn btn-white btn-sm btn-border mr-1">����</a> 
								 <span class="h2 mr-1"> > </span>
								 <a href="deposite_cancle_input_info" class="btn btn-white btn-sm btn-border mr-1">���������Է�</a>
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
				<div class="row">
							
						<div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<div class="card-title">����</div>
								</div>
								<div class="card-body" style="margin-bottom: 20px; margin-top: 0">
									<div class="row">
									<div class="col-md-1 col-lg-1"></div>
										<div class="col-md-10 col-lg-10">
										
<!-- 							<div class="card"> -->
<!-- 								<div class="card-header"> -->
<!-- <!-- 									<div class="card-title">Hoverable Table</div> --> 
									
<!-- 								</div> -->
<!-- 								<div class="card-body"> -->
									<table class="table table-hover">
										
										
										
										
										
													<thead>
													<tr>
													<th colspan="2" style="border-style: none;" >
													<span >����� ���� ��ǰ</span>
													</th>
													</tr>
													</thead>
													
													
													<tbody>
													<tr>
														<td style="border-style: none; width: 60px; ">��</td >
														<td  style="border-style: none; width: 140px;">���� ���� ����</td>
														<td style="width: 400px; border-style: none;">���¹�ȣ : 110-123-789998</td>
														<td style="border-style: none;">
<!-- 															<button type="button" class="btn btn-info ">�����ϱ�</button> -->
														</td>
														
													</tr>
													<tr>
														<td style="border-style: none;"></td>
														<td style="border-style: none;" >���Գ�¥ :</td>
														<td style="border-style: none;"> 2020.09.09</td>
														
													</tr>
													<tr >
														<td style="border-style: none;"></td>
														<td style="border-style: none;">�ܾ� : </td>
														<td style="border-style: none;"> 700��</td>
														<td style="border-style: none;">
<!-- 															<a href="">�������� ���� ��������</a> -->
														</td>
														
													</tr>
												
									</table>
									
									<hr />
									
									 <div class="form-inline" style="margin-left: 10%;">
									<span>�Ա� ���¹�ȣ</span><input type="text" class="form-control" style="width: 400px; margin-left: 30px;" placeholder="���¹�ȣ�� �Է����ּ���"/>
									</div>
									 <div class="form-inline" style="margin-left: 10%;">
									<span>���� ��й�ȣ</span><input type="text" class="form-control" style="width: 400px; margin-left: 30px;" placeholder="��й�ȣ�� �Է����ּ���"/>
									</div>
									
									<div style="margin-left: 60%; margin-top: 30px;" >
									<a href="deposite_cancle"><button type="button" class="btn btn-info ">���</button></a>
									<a href="deposite_cancle_check_select"><button type="button" class="btn btn-info ">�����ϱ�</button></a>
								
								
								</div>
								
								
<!-- 								</div> -->
<!-- 							</div> -->
							
							
						
											
										</div>
											
											
											
							

										
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
