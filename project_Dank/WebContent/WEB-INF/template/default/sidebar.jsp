<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- Sidebar -->
		<div class="sidebar sidebar-style-2">			
			<div class="sidebar-wrapper scrollbar scrollbar-inner">
				<div class="sidebar-content">
					<!-- �α��� â ���� -->
					<div class="form-group">
						<label for="email2">�̸���</label>
						<input type="email" class="form-control" id="email2" placeholder="Enter Email">
					</div>
					<div class="form-group">
						<label for="password">�н�����</label>
						<input type="password" class="form-control" id="password" placeholder="Password">
					</div>
					<div class="form-group">
						<a href="loginPage" class="btn btn-primary btn-block">
							<span class="btn-label mr-2"></span>�α���
						</a>
					</div>
					<div class="form-group">
						<a href="#" class="btn btn-primary btn-block">
							<span class="btn-label mr-2"></span>ȸ������
						</a>
					</div>
					
					<!-- �α��� â �� -->
					<!-- �α��� �� �� ���� -->
					<div class="user">
						<div class="avatar-sm float-left mr-2">
							<img src="resources/img/profile.jpg" alt="..." class="avatar-img rounded-circle">
						</div>
						<div class="info">
							<a data-toggle="collapse" href="#collapseExample" aria-expanded="true">
								<span>
									
									<span class="user-level">ȫ�浿</span>
									<span class="caret"></span>
								</span>
							</a>
							<div class="clearfix"></div>

							<div class="collapse in" id="collapseExample">
								<ul class="nav">
									<li>
										<a href="#profile">
											<span class="link-collapse">����������</span>
										</a>
									</li>
									<li>
										<a href="#edit">
											<span class="link-collapse">�α׾ƿ�</span>
										</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<!-- �α��� �� �� -->
					<ul class="nav nav-primary">
						
						<li class="nav-item">
							<a data-toggle="collapse" href="#deposit">
								<i class="fas fa-layer-group"></i>
								<p>����</p>
								<span class="caret"></span>
							</a>
							<div class="collapse" id="deposit">
								<ul class="nav nav-collapse">
									<li>
										<a href="inquire">
											<span class="sub-item">��ȸ</span>
										</a>
									</li>
									<li>
										<a href="transfer">
											<span class="sub-item">��ü</span>
										</a>
									</li>
									<li>
										<a href="new">
											<span class="sub-item">�ű�</span>
										</a>
									</li>
									<li>
										<a href="deposite_cancle">
											<span class="sub-item">����</span>
										</a>
									</li>
									<li>
										<a href="analysis">
											<span class="sub-item">�м�</span>
										</a>
									</li>
								</ul>
							</div>
						</li>
						<li class="nav-item">
							<a data-toggle="collapse" href="#sidebarLayouts">
							<i class="fas fa-layer-group"></i>
							<p>����</p>
							<span class="caret"></span>
							</a>
							<div class="collapse" id="sidebarLayouts">
								<ul class="nav nav-collapse">
									<li>
										<a href="product">
											<span class="sub-item">��ǰ�Ұ�</span>
										</a>
									</li>
									<li>
										<a href="application">
											<span class="sub-item">���� ��û</span>
										</a>
									</li>
									<li>
										<a href="fileuploadhome">
											<span class="sub-item">���� ����</span>
										</a>
									</li>
									<li>
										<a href="check">
											<span class="sub-item">���� ��Ȳ ��ȸ</span>
										</a>
									</li>
									<li>
										<a href="repayment">
											<span class="sub-item">���� ��ȯ</span>
										</a>
									</li>
									<li>
										<a href="caculator">
											<span class="sub-item">���� ����</span>
										</a>
									</li>
								</ul>
							</div>
						</li>
						<li class="nav-item">
							<a data-toggle="collapse" href="#forms">
								<i class="fas fa-layer-group"></i>
								<p>������</p>
								<span class="caret"></span>
							</a>
							<div class="collapse" id="forms">
								<ul class="nav nav-collapse">
									<li>
										<a href="qna">
											<span class="sub-item">���� ã�� ����</span>
										</a>
									</li>
									<li>
										<a href="1on1question_prichk">
											<span class="sub-item">1:1 �����ϱ�</span>
										</a>
									</li>
									<li>
										<a href="forms/forms.jsp">
											<span class="sub-item">���� ���Ǳ�</span>
										</a>
									</li>
									<li>
										<a href="forms/forms.jsp">
											<span class="sub-item">����� ATM ��ȸ</span>
										</a>
									</li>
								</ul>
							</div>
						</li>
						<li class="nav-item">
							<a data-toggle="collapse" href="#tables">
								<i class="fas fa-layer-group"></i>
								<p>�� ���� ����</p>
								<span class="caret"></span>
							</a>
							<div class="collapse" id="tables">
								<ul class="nav nav-collapse">
									<li>
										<a href="pri_info_chk">
											<span class="sub-item">�� ���� ��ȸ / ����</span>
										</a>
									</li>
									<li>
										<a href="tap">
											<span class="sub-item">ID ��ȸ</span>
										</a>
									</li>
									<li>
										<a href="mem_pw_reset_input">
											<span class="sub-item">����� ��ȣ �缳��</span>
										</a>
									</li>
									<li>
										<a href="security">
											<span class="sub-item">����ī�� / OTP</span>
										</a>
									</li>
								</ul>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<!-- End Sidebar -->