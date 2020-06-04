<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>


		<div class="content">
			<!-- ����� Ǫ���� ���� ���� -->
				<div class="panel-header bg-primary-gradient">
					<div class="page-inner py-5">
						<div class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
							<div>
								<h2 class="text-white pb-2 fw-bold">������</h2>
								<h5 class="text-white op-7 mb-2">
								<a href="index" class="btn btn-white btn-sm btn-border mr-1"><span class="flaticon-home"/></a>
								 <span class="h2 mr-1"> > </span>
								 <a href="search" class="btn btn-white btn-sm btn-border mr-1">���� ã�� �ǹ�</a>
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
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<div class="card-head-row">
									<div class="card-title col-3">���� ã�� ����</div>

								
								</div>
							</div>
						
						
						<div class="form-group" id="">
												
												<div class="input-icon" style="display:inline-block;">
													
													<span class="input-icon-addon">
														<i class="fa fa-search" ></i>
													</span>
													<input type="text" class="form-control" placeholder="Search for..."">
													
													
												</div>
												<button class="btn btn-info" style="display: inline-block;">�˻�</button>
											
											</div>
										
								
										<div class="card-body" >
									<ul class="nav nav-pills nav-secondary" id="pills-tab" role="tablist">
										<li class="nav-item">
											<a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true">��ü</a>
										</li>
										<li class="nav-item">
											<a class="nav-link" id="pills-profile-tab" data-toggle="pill" href="#1" role="tab" aria-controls="pills-profile" aria-selected="false">����</a>
										</li>
										<li class="nav-item">
											<a class="nav-link" id="pills-contact-tab" data-toggle="pill" href="#2" role="tab" aria-controls="pills-contact" aria-selected="false">����</a>
										</li>
										<li class="nav-item">
											<a class="nav-link" id="pills-contact-tab" data-toggle="pill" href="#3" role="tab" aria-controls="pills-contact" aria-selected="false">ȸ������</a>
										</li>
										<li class="nav-item">
											<a class="nav-link" id="pills-contact-tab" data-toggle="pill" href="#4" role="tab" aria-controls="pills-contact" aria-selected="false">��Ÿ</a>
										</li>
									</ul>
									<div class="tab-content mt-2 mb-3" id="pills-tabContent">
										<div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
											<p>�̰��� ��ü �� ���̴� ȭ���Դϴ�.</p>
										</div>
										<div class="tab-pane fade" id="1" role="tabpanel" aria-labelledby="pills-profile-tab">
											<p>1.������ �ϸ� � ������ ������?</p>
											<div style="border: 1px solid gray; background-color: #E2E2E2;">
											<p>������ ���� �Ҽ��� ����� ���ڰ� �ɰ̴ϴ�.</p>
											</div>
										</div>
										<div class="tab-pane fade" id="2" role="tabpanel" aria-labelledby="pills-contact-tab">
											<p>1.������ �ϸ� � ������ ������?</p>
											<div style="border: 1px solid gray; background-color: #E2E2E2;">
											<p>����� ���� �ſ� �����������ϴ�.</p>
											</div>
										</div>
										<div class="tab-pane fade" id="3" role="tabpanel" aria-labelledby="pills-contact-tab">
											<p>1.ȸ�������� ���� �ʰ� ���񽺸� �̿��� �� �ֳ���?</p>
											<div style="border: 1px solid gray; background-color: #E2E2E2;">
											<p>�ƴ�.</p>
											</div>
										</div>
										<div class="tab-pane fade" id="4" role="tabpanel" aria-labelledby="pills-contact-tab">
											<p>1.Ȩ�������� ������ �ʾƿ�</p>
											<div style="border: 1px solid gray; background-color: #E2E2E2;">
											<p>õõ�� �������</p>
											</div>
										</div>
									</div>
								</div>
						
						<div class="card-body">
									<div class="demo">
										<ul class="pagination pg-primary">
											<li class="page-item">
												<a class="page-link" href="#" aria-label="Previous">
													<span aria-hidden="true"> < </span>
													<span class="sr-only"></span>
												</a>
											</li>
											<li class="page-item active"><a class="page-link" href="#">1</a></li>
											<li class="page-item"><a class="page-link" href="#">2</a></li>
											<li class="page-item"><a class="page-link" href="#">3</a></li>
											<li class="page-item">
												<a class="page-link" href="#" aria-label="Next">
													<span aria-hidden="true">></span>
													<span class="sr-only"></span>
												</a>
											</li>
										</ul>
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
