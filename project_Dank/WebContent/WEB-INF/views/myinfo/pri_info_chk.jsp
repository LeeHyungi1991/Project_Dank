<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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
								 <a href="pri_info_chk" class="btn btn-white btn-sm btn-border mr-1">������ ��ȸ</a>
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
									
									
								</div>
								
								<div class="card-body">
									<div class="row">
										<div class="col-md-10">
											<div class="table-responsive table-hover table-sales">
											<div  style="margin: auto;">
									
									
									
									
									
										
										<c:forEach items="${list }" var="e" varStatus="i">
										
									<div class="card-body" style="">
									
									
									
							
									
									<table class="table mt-3">
										<thead>
											<tr>
												<th scope="col">�⺻����</th>
												<th scope="col"></th>
												<th scope="col"></th>
												<th scope="col"></th>
											</tr>
										</thead>
										
										<tbody>
										
										
											<tr>
												<td> �̸� </td>
												<td> ${e.mem_name}</td>
												
											</tr>
											<tr>
												<td>�޴�����ȣ</td>
												<td>${e.mem_phn}</td>
												
											</tr>
											
											
											
										
										</tbody>
										
									</table>
									
									<table class="table mt-3">
										<thead>
											<tr>
												<th scope="col">��������</th>
												<th scope="col"></th>
												<th scope="col"></th>
												<th scope="col"></th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>���� �ּ�</td>
												<td> ${e.mem_loc} </td>
												
											</tr>
											<tr>
												<td>���� ��ȭ��ȣ</td>
												<td>010-1234-5678</td>
												
											</tr>
											
										</tbody>
									</table>
									
									<table class="table mt-3">
										<thead>
											<tr>
												<th scope="col">�������</th>
												<th scope="col"></th>
												<th scope="col"></th>
												<th scope="col"></th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>ȸ�� ���</td>
												<td>���̾Ƹ��</td>
												
											</tr>
											<tr>
												<td>����Ʈ</td>
												<td>785,000</td>
												
											</tr>
											
										</tbody>
									</table>
									
									<table class="table mt-2">
										<thead>
											<tr>
												<th scope="col">�⺻����</th>
												<th scope="col"></th>
												<th scope="col"></th>
												<th scope="col"></th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>sms���ſ���</td>
												<td>����</td>
												
											</tr>
									
											
										</tbody>
									</table>
								</div>
										
						
						</c:forEach>
						
										
										
										<div id="buttons" style="text-align: center;">
									<a href="pri_info_chk2"><button class="btn btn-primary btn-round">����</button></a>
									<button class="btn btn-primary btn-round">Ȯ��</button>
									</div>
										
										
									
									
									
									
									
									
								</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="mapcontainer">
												<div id="map-example" class="vmap"></div>
											</div>
										</div>
									</div>
								</div>
								
								<div class="card-body">
								
								</div>
							</div>
						</div>
					</div>
					
					<!-- ������ ���̾ƿ� �� -->
				</div>
			</div>


			
			<script>$("#checkBalance").click(function() {
				location = "checkBalance";
			});
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
