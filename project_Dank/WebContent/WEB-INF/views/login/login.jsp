<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- article ���� ���� -->

	<div class="content">
		<!-- ����� Ǫ���� ���� ���� -->
		<div class="panel-header bg-primary-gradient">
			<div class="page-inner py-5">
				<div
					class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
					<div>
						<h2 class="text-white pb-2 fw-bold">����</h2>
						<h5 class="text-white op-7 mb-2">
							<a href="index" class="btn btn-white btn-sm btn-border mr-1"><span
								class="flaticon-home"></span></a> <span class="h2 mr-1"> > </span>
							<a href="momo3" class="btn btn-white btn-sm btn-border mr-1">�α���</a>

						</h5>
					</div>
					<div class="ml-md-auto py-2 py-md-0">
						<a href="checkbalance"
							class="btn btn-white btn-border btn-round mr-2">���� ������</a> <a
							href="qna" class="btn btn-secondary btn-round">������</a>
					</div>
				</div>
			</div>
		</div>
		<!-- ����� Ǫ���� ���� �� -->
		<div class="page-inner mt--5">
			<!-- ������ ���̾ƿ� ���� -->
			<div class="row col-md-6 ml-auto mr-auto">
				<div class="col-md-12">
					<div class="card">
						<div class="card-body">
							<div class="row">
								<div class="col-md-12">
									<div class="table-responsive table-hover table-sales">
										<div style="margin: auto;">
											<!-- �α��� ��� ���� -->
											<form method="post" action="login" >
												<div class="form-group">
													<label for="email2">�̸���</label>
													<input type="email" class="form-control" id="mem_email" name="mem_email" placeholder="Enter Email" value="wlsgb94@naver.com">
												</div>
												<div class="form-group">
													<label for="password">�н�����</label>
													<input type="password" class="form-control" id="mem_pwd" name="mem_pwd" placeholder="Password" value="1234">
												</div>
												<div class="form-group">
													<input type="submit" class="btn btn-primary btn-block" value="�α���" />
												</div>
											</form>
											<!-- �α��� ��� �� -->
											<div id="abutton" style="text-align: center; margin-top: 20px;">
												<a href="memberForm"><button class="btn btn-primary btn-xs"
														id="ab1">ȸ������</button></a>&nbsp;&nbsp;&nbsp;&nbsp; <a
													href="tap"><button class="btn btn-primary btn-xs"
														id="ab2">���̵�/��й�ȣã��</button></a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="card-body"></div>
					</div>
				</div>
			</div>

			<!-- ������ ���̾ƿ� �� -->
		</div>
	</div>





	<script>
		$("#checkBalance").click(function() {
			location = "checkBalance";
		});
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