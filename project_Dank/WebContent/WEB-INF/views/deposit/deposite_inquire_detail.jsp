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
								 <a href="inquire" class="btn btn-white btn-sm btn-border mr-1">��ȸ</a> 
								 <span class="h2 mr-1"> > </span>
								 <a href="inquire_detail" class="btn btn-white btn-sm btn-border mr-1">����ȸ</a>
								 </h5>
							</div>
							<div class="ml-md-auto py-2 py-md-0">
								<a href="checkbalance" class="btn btn-white btn-border btn-round mr-2">���� ������</a>
								<a href="qna" class="btn btn-secondary btn-round">������</a>
							</div>
						</div>
					</div>
				</div>
				<div class="page-inner mt--5">


					
							
							
							
							
							<div class="row">
							<div class="col-md-2"></div>
						<div class="col-md-8">
							<div class="card">
								<div class="card-header">
									<div class="card-title">����ȸ</div>
								</div>
								<div class="card-body">
									<div class="row">
									<div class="col-md-2 col-lg-2"></div>
										<div class="col-md-8 col-lg-8">
											<div class="form-group">
												<label for="email2">��ǰ��</label>
												<input type="text" style="width: 400px;" class="form-control" id="email2" placeholder="110-111-12345 : ���뿹��">
											</div>
											<hr class="my-0">
											<div class="form-group " >
												<label for="email2" >������ȸ</label>
												  <div class="form-inline">
												    <label class="col-xs-4">
												    <input type="text" class="form-control" style="width: 40%; margin: 10px;" placeholder="2020"><span style="margin: 3px;">��</span>
												    <input type="text" class="form-control"  style="width: 40%; margin: 10px;"  placeholder="05">��
												    </label>
												    
												  </div>
											<hr class="my-0">
											</div>
											
											
											<div class="form-group">
												<label class="form-label">��ȸ�Ⱓ</label><br />
											
												<div class="selectgroup w-30 " style="margin-left:20%" >
													<label class="selectgroup-item" >
														<input type="radio" name="value" value="50" class="selectgroup-input" >
														<span class="selectgroup-button">����</span>
													</label>
													<label class="selectgroup-item">
														<input type="radio" name="value" value="100" class="selectgroup-input">
														<span class="selectgroup-button">1����</span>
													</label>
													<label class="selectgroup-item">
														<input type="radio" name="value" value="200" class="selectgroup-input">
														<span class="selectgroup-button">1����</span>
													</label>
											
										</div>
										 <div class="form-inline">
												    <label class="col-xs-4">
												    <input type="text" class="form-control" style="width: 40%; margin: 10px;" placeholder="2020 02 04"><span style="margin: 3px;">~</span>
												    <input type="text" class="form-control"  style="width: 40%; margin: 10px;"  placeholder="2020 04 22">
												    </label>
												    
												  </div>
												 <button type="button" class="btn btn-success" style="margin-left: 35%">��ȸ�ϱ�</button>
											
											
											
											
											
											
										</div>

										
									</div>
								</div>
								
							</div>
						</div>
						</div>
						

						<div class="col-md-12">
						<div class="card">
								<div class="card-header">
									<table>
									<tr>
									<td style="width: 400px; text-align: center;">
									<select class="form-control" style="width: 40%; margin-left: 30px;">
									    <option selected="selected"
									    >��ü</option>
									    <option >�Ϻ�</option>
									    <option >����</option>
									    <option >��Ÿ</option>
									</select>
									</td>
									<td style="width: 400px; text-align: center;">���Աݱݾ� (100��) 5,000,000 ��</td>
									<td style="width: 400px; text-align: center;">����ݱݾ� (10��) 200,000 ��</td>
									</tr>
									</table>
								</div>
								<div class="card-body">
									<table class="table table-hover">
										<thead>
											<tr>
												<th scope="col">�ŷ��Ͻ�</th>
												<th scope="col">������/�޴º�</th>
												<th scope="col">�Աݾ�(��)</th>
												<th scope="col">��ݾ�(��)</th>
												<th scope="col">�ܾ�(��)</th>
												<th scope="col">�۱ݸ޸�</th>
												<th scope="col">�ŷ���</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td scope="col">2020.02.24</td>
												<td scope="col">ȫ�浿</td>
												<td scope="col">120,000</td>
												<td scope="col">0</td>
												<td scope="col">5,000,000</td>
												<td scope="col">����</td>
												<td scope="col">Dank</td>
											</tr>
											<tr>
												<td scope="col">2020.02.25</td>
												<td scope="col">�Ӽ���</td>
												<td scope="col">2,334,234,435</td>
												<td scope="col">5,342,222</td>
												<td scope="col">999,999,999,999</td>
												<td scope="col">����</td>
												<td scope="col">Dank</td>
											</tr>
											
										</tbody>
									</table>
								</div>
								
								<div style="margin: auto;">
								<button class="btn btn-default btn-xs" type="submit">1</button>
								<button class="btn btn-default btn-xs" type="submit">2</button>
								<button class="btn btn-default btn-xs" type="submit">3</button>
								<button class="btn btn-default btn-xs" type="submit">4</button>
								</div>
								<div style="margin:10px auto;">
								<button type="button" class="btn btn-info btn-sm">���� ������</button>
								</div>
							</div>
							</div>

					</div>
				
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

