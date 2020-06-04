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
								 <a href="transfer" class="btn btn-white btn-sm btn-border mr-1">��ü</a> 
								 <span class="h2 mr-1"> > </span>
								 <a href="transfer_auto_apply" class="btn btn-white btn-sm btn-border mr-1">�ڵ���ü��û</a>
								 </h5>
							</div>
							<div class="ml-md-auto py-2 py-md-0">
								<a href="checkbalance" class="btn btn-white btn-border btn-round mr-2">���� ������</a>
								<a href="#" class="btn btn-secondary btn-round">������</a>
							</div>
						</div>
					</div>
				</div>
			<div class="page-inner mt--5">







				<div class="row">

					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<div class="card-title">�ڵ���ü��û</div>
							</div>
							<div class="card-body" style="margin-bottom: 20px;">
								<div class="row">
									<div class="col-md-2 col-lg-2"></div>
									<div class="col-md-8 col-lg-8">
										<div class="form-group">
											<label for="email2">���¹�ȣ</label> <input type="text"
												class="form-control" id="email2"
												style="width: 400px; margin-left: 10%;"
												placeholder="110-111-12345 : ���뿹��">
										</div>
										<hr class="my-0">

										<div class="form-group ">
											<label for="email2">�Աݰ��¹�ȣ</label>

											<div class="form-inline" style="margin-left: 10%;">
												<input type="text" placeholder="����" class="form-control"
													style="text-align: center; width: 100px;" /> <input
													type="text" placeholder="�Ա� ���� ��ȣ" class="form-control"
													style="text-align: center; width: 300px;" />
											</div>
										</div>
										<hr class="my-0">
										<div class="form-group ">
											<label for="email2">�ڵ���ü����</label> <br />
											<div class="selectgroup w-30 " style="margin-left: 11%;">
												<label class="selectgroup-item"> <input
													type="radio" name="value" value="50"
													class="selectgroup-input"> <span
													class="selectgroup-button">+100��</span>
												</label> <label class="selectgroup-item"> <input
													type="radio" name="value" value="200"
													class="selectgroup-input"> <span
													class="selectgroup-button">+50��</span>
												</label> <label class="selectgroup-item"> <input
													type="radio" name="value" value="200"
													class="selectgroup-input"> <span
													class="selectgroup-button">+10��</span>
												</label> <label class="selectgroup-item"> <input
													type="radio" name="value" value="200"
													class="selectgroup-input"> <span
													class="selectgroup-button">+5��</span>
												</label> <label class="selectgroup-item"> <input
													type="radio" name="value" value="200"
													class="selectgroup-input"> <span
													class="selectgroup-button">����</span>
												</label>

											</div>
											<div class="form-inline" style="margin-left: 10%;">

												<input type="text" placeholder="��ü �ݾ�" class="form-control"
													style="text-align: center; width: 360px;" />
											</div>
										</div>
										<hr class="my-0">
										<div class="form-group ">
											<label for="email2">��ü�ֱ�</label> <br />

											<div class="form-inline" style="margin-left: 10%;">

												<input type="text" placeholder="�ſ� 19��" class="form-control"
													style="text-align: center; width: 360px;" />
											</div>
										</div>

										<div class="form-group ">
											<label for="email2">������/������</label> <br />

											<div class="form-inline" style="margin-left: 10%;">

												<input type="text" placeholder="2020.02.04"
													class="form-control"
													style="text-align: center; width: 165px;" /> <span
													style="font-size: 20px; margin-left: 10px; margin-right: 10px;">~</span>
												<input type="text" placeholder="2020.08.09"
													class="form-control"
													style="text-align: center; width: 165px;" />
											</div>
										</div>

										<div class="form-group ">
											<div class="form-inline">
											
										
								<a href="transfer_auto"><button type="button" class="btn btn-danger "
													style="margin-left: 10%; width: 200px;">���</button></a>
												<button type="button" class="btn btn-success "
													style="margin-left: 10%; width: 200px;">��û</button>
											</div>
										</div>






									</div>






								</div>
							</div>

						</div>
					</div>
				</div>




			
		</div>

	</div>





<script>
	Circles.create({
		id : 'circles-1',
		radius : 45,
		value : 60,
		maxValue : 100,
		width : 7,
		text : 5,
		colors : [ '#f1f1f1', '#FF9E27' ],
		duration : 400,
		wrpClass : 'circles-wrp',
		textClass : 'circles-text',
		styleWrapper : true,
		styleText : true
	})

	Circles.create({
		id : 'circles-2',
		radius : 45,
		value : 70,
		maxValue : 100,
		width : 7,
		text : 36,
		colors : [ '#f1f1f1', '#2BB930' ],
		duration : 400,
		wrpClass : 'circles-wrp',
		textClass : 'circles-text',
		styleWrapper : true,
		styleText : true
	})

	Circles.create({
		id : 'circles-3',
		radius : 45,
		value : 40,
		maxValue : 100,
		width : 7,
		text : 12,
		colors : [ '#f1f1f1', '#F25961' ],
		duration : 400,
		wrpClass : 'circles-wrp',
		textClass : 'circles-text',
		styleWrapper : true,
		styleText : true
	})

	var totalIncomeChart = document.getElementById('totalIncomeChart')
			.getContext('2d');

	var mytotalIncomeChart = new Chart(totalIncomeChart, {
		type : 'bar',
		data : {
			labels : [ "S", "M", "T", "W", "T", "F", "S", "S", "M", "T" ],
			datasets : [ {
				label : "Total Income",
				backgroundColor : '#ff9e27',
				borderColor : 'rgb(23, 125, 255)',
				data : [ 6, 4, 9, 5, 4, 6, 4, 3, 8, 10 ],
			} ],
		},
		options : {
			responsive : true,
			maintainAspectRatio : false,
			legend : {
				display : false,
			},
			scales : {
				yAxes : [ {
					ticks : {
						display : false
					//this will remove only the label
					},
					gridLines : {
						drawBorder : false,
						display : false
					}
				} ],
				xAxes : [ {
					gridLines : {
						drawBorder : false,
						display : false
					}
				} ]
			},
		}
	});

	$('#lineChart').sparkline([ 105, 103, 123, 100, 95, 105, 115 ], {
		type : 'line',
		height : '70',
		width : '100%',
		lineWidth : '2',
		lineColor : '#ffa534',
		fillColor : 'rgba(255, 165, 52, .14)'
	});
</script>

