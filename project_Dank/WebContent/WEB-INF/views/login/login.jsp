<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- article 영역 시작 -->
<div id="article">
	<div id="header2">
		<h1>SurveyClient 예제</h1>
		<p id="time">Oct 1th, 2020</p>
	</div>
	<!-- 로그인 폼작업 s-->
	<!-- 로그인 폼작업 e-->

	<div class="content">
		<!-- 상단의 푸른색 공간 시작 -->
		<div class="panel-header bg-primary-gradient">
			<div class="page-inner py-5">
				<div
					class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
					<div>
						<h2 class="text-white pb-2 fw-bold">검색</h2>
						<h5 class="text-white op-7 mb-2">
							<a href="index" class="btn btn-white btn-sm btn-border mr-1"><span
								class="flaticon-home"></span></a> <span class="h2 mr-1"> > </span>
							<a href="momo3" class="btn btn-white btn-sm btn-border mr-1">로그인</a>

						</h5>
					</div>
					<div class="ml-md-auto py-2 py-md-0">
						<a href="checkbalance"
							class="btn btn-white btn-border btn-round mr-2">빠른 페이지</a> <a
							href="qna" class="btn btn-secondary btn-round">고객센터</a>
					</div>
				</div>
			</div>
		</div>
		<!-- 상단의 푸른색 공간 끝 -->
		<div class="page-inner mt--5">
			<!-- 페이지 레이아웃 시작 -->
			<div class="row row-card-no-pd">
				<div class="col-md-12">
					<div class="card">


						<div class="card-body">
							<div class="row">
								<div class="col-md-4">
									<div class="table-responsive table-hover table-sales">
										<div style="margin: auto;">
											<form method="post" action="login" >
												<div id="loginbox" style="border: 1px solid gray;">
													<div class="form-group has-success">
														<label for="successInput">email</label>
														<input type="email" id="mem_email" name="mem_email">
													</div>
	
													<div class="form-group has-success">
														<label for="successInput">password</label>
														<input type="password" id="mem_pwd" name="mem_pwd" class="form-control">
													</div>
													<input type="submit" value="로그인" >
												</div>
											</form>
											<div id="abutton"
												style="text-align: center; margin-top: 20px;">
												<a href="memberForm"><button class="btn btn-primary btn-xs"
														id="ab1">회원가입</button></a>&nbsp;&nbsp;&nbsp;&nbsp; <a
													href="tap"><button class="btn btn-primary btn-xs"
														id="ab2">아이디/비밀번호찾기</button></a>
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

						<div class="card-body"></div>
					</div>
				</div>
			</div>

			<!-- 페이지 레이아웃 끝 -->
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