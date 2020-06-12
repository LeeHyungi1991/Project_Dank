<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
								 <a href="transfer" class="btn btn-white btn-sm btn-border mr-1">��ü�ϱ�</a>
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
							
						<div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<div class="card-title">��ü</div>
								</div>
								<div class="card-body" style="margin-bottom: 20px;">
									<div class="row">
									<div class="col-md-2 col-lg-2"></div>
										<div class="col-md-8 col-lg-8">
										<form action="transfer_process" method="post" id="needform">
											<div class="form-group">
												<label for="email2">��ݰ��¹�ȣ</label>
<!-- 												<input type="text" name="myac" class="form-control" style="width: 400px; margin-left: 10%;" id="email2" placeholder="110-111-12345 : ���뿹��"> -->
														<select class="form-control" style="width: 400px; margin-left: 10%;" name="myac" id="myac" form="needform" >
														<c:forEach var="k" items="${myaclist }">
														  <option value="${k}">${k}</option>
<!-- 														  <option>��� : 11188584-547-445</option> -->
<!-- 														  <option>���� : 116-56-54456-45</option> -->
<!-- 														  <option selected="selected">���� : 11155-99-88775</option> -->
														  </c:forEach>
														</select>
											</div>
											<hr class="my-0">
											
											<div class="form-group " >
												<label for="email2" >�Աݰ��¹�ȣ</label>
												<br />
												  <div class="selectgroup w-40 " style="margin-left: 10%;" >
													<label class="selectgroup-item"  >
														<input type="radio"  value="50" class="selectgroup-input" >
														<span class="selectgroup-button" style="width: 200px;">+100��</span>
													</label>
													<label class="selectgroup-item">
														<input type="radio"  value="200" class="selectgroup-input">
														<span class="selectgroup-button" style="width: 200px;">+50��</span>
													</label>
													
											
												</div>
												<div class="form-inline" style="margin-left: 10%;" >
												<input type="text" placeholder="����" class="form-control" style=" text-align:center; width: 100px;" />
												<input type="text" name="yourac" placeholder="�Ա� ���� ��ȣ" id="inputacval" maxlength="10" class="form-control" style=" text-align:center; width: 300px;"/>
												<input type="button" id="inputac" value="������ȿüũ"  />
												<input type="hidden" name="youracmem" placeholder="����ڵ�" id="trmem" class="form-control" style=" text-align:center; background-color:red; width: 300px;"/>
												<div id="ajaxtarget"></div>
												    </div>
												 </div>
												 <hr class="my-0">
												 <div class="form-group " >
												<label for="email2" >��ü�ݾ�</label>
												<br />
												  <div class="selectgroup w-30 " style="margin-left: 11%;" >
													<label class="selectgroup-item"  >
														<input type="radio"  value="50" class="selectgroup-input" >
														<span class="selectgroup-button">+100��</span>
													</label>
													<label class="selectgroup-item">
														<input type="radio"  value="200" class="selectgroup-input">
														<span class="selectgroup-button">+50��</span>
													</label>
													<label class="selectgroup-item">
														<input type="radio"  value="200" class="selectgroup-input">
														<span class="selectgroup-button">+10��</span>
													</label>
													<label class="selectgroup-item">
														<input type="radio"  value="200" class="selectgroup-input">
														<span class="selectgroup-button">+5��</span>
													</label>
													<label class="selectgroup-item">
														<input type="radio"  value="200" class="selectgroup-input">
														<span class="selectgroup-button">����</span>
													</label>
											
												</div>
												<div class="form-inline" style="margin-left: 10%;" >
												
												<input type="text" name="trmoney" placeholder="��ü �ݾ�" class="form-control" style=" text-align:center; width: 360px;"/>
												    </div>
												 </div>
												 <hr class="my-0">
												 <div class="form-group " >
												<label for="email2" >�޴º� ���� ǥ��</label>
												<br />
												  
												<div class="form-inline" style="margin-left: 10%;" >
												
												<input type="text" name="youracwrite" placeholder="10�� �̳�" maxlength="10" class="form-control" style=" text-align:center; width: 360px;"/>
												    </div>
												 </div>
											
												 <div class="form-group " >
												<label for="email2" >�� ���� ǥ��</label>
												<br />
												  
												<div class="form-inline" style="margin-left: 10%;" >
												
												<input type="text" name="myacwrite" placeholder="10�� �̳�"  maxlength="10" class="form-control" style=" text-align:center; width: 360px;"/>
												    </div>
												 </div>
												 
												 <div class="form-group "  >
												 <a href="transfer_auto"><button type="button" class="btn btn-success  btn-lg" style="margin-left: 2%; width: 25%; ">�ڵ���ü</button></a>
												 <input type="submit" value="Ȯ��" class="btn btn-success  btn-lg" style="margin-left: 20%; width: 25%; "/>
												
												 </div>
											
											</form>
											
											
											
											
											</div>
											
											
											
							

										
									</div>
								</div>
								
							</div>
						</div>
						</div>
						

						

				
				</div>
				
			</div>


	
			
			
	<script>
		$(document).ready(function() {
			$('#inputac').click(function() {
				$('#ajaxtarget').html('?')
				$('#trmem').val(' ')
				//alert($('#myac').val())
				
				//alert("ss");
				$.ajax({
					url:'getmemcodewhentr?acnum='+$('#inputacval').val(),
					success: function (data) {
					console.log(data)
						if(data === 0){
							console.log(data)
						}else{
							$('#trmem').val(data)
							console.log($('#trmem').val())
							$('#ajaxtarget').html('Ȯ�δ� ��ü ��������')
						}
						
						
						
						
					}
					//error : function(xhr, textStatus, errorThrown){
				        // Error��, ó��
// 				        console.log(xhr);
// 				        console.log(textStatus);
// 				        console.log(errorThrown);
				    //}

				})
				
				
				
				
			})
		})
	</script>

