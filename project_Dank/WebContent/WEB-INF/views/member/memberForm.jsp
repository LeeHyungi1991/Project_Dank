<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- article ���� ���� -->
<div id="article">
	<div id="header2">
		<h1>SurveyClient ����</h1>
		<p id="time">Oct 1th, 2020</p>
	</div>
	<div id="section2">
		<div id="header4">
			<h2>�������� �ۼ� �� ����</h2>
		</div>
			<%-- Content ������ ���ڸ� --%>`<form method="post" action="memberIn">
			<table>
<tr>
					<td>�̸���</td>
					<td><input type="text" name="mem_email" maxlength="10">
					</td>
				<tr>
						<tr><td colspan="2" id="target"></td></tr>
				<tr>
					<td>��й�ȣ</td>
					<td><input type="password" name="mem_pwd" maxlength="10">
					</td>
					</tr>
					</td>
				</tr>
		
					<tr>
					<td>�̸�</td>
					<td><input type="text" name="mem_name" maxlength="10">
					</td>
					</tr>
						<tr>
					<td>��ȭ��ȣ</td>
					<td><input type="text" name="mem_phn" maxlength="10">
					</td>
					</tr>
						<tr>
					<td>�������</td>
					<td><input type="text" name="mem_birth" maxlength="10">
					</td>
					</tr>
						<tr>
					<td>����</td>
					
					<td><input type = "radio" name = mem_gender value = "����" checked = "checked"> ����    
       				 <input type = "radio" name = "mem_gender" value = "����"> ����
       				 </td>
							</tr>
							
						<tr>
					<td>�ּ�</td>
					<td><input type="text" name="mem_loc" maxlength="10">
					</td>
					</tr>
						<tr>
					<td>�������� ����</td>
					<td>   <input type = "radio" name = "mem_prichk" value = "����"> ����
        	        <input type = "radio" name = "MEM_PRICHK" value = "�ź�"> �ź�<br>



					</td>
					</tr>
					<tr>
					 <tr><td colspan="2">
					<input	type="submit" NAME="signup" value="�����ϱ�">
						</td>	</tr>
				
				
			</table>
		</form>
		<%-- Content ������ ���ڸ� --%>
		<p>�������ؽ�Ʈ�� �� �������� �Ҹ��� ���α׷��� ���� �� �������� "����"�� �� ���������� ���� ������ �о�鿩
			��ǻ�� ����Ϳ� ����ϴ� ���·� ���̰� �ȴ�. �׷��� ���� ����ڴ� �� �������� �ִ� �����۸�ũ�� ���� �ٸ� ������
			�̵��ϰų�, �� �������� �����ϰ� �ִ� ������ �Ϸ��� ������ ���� ���� �ִ�. �����۸�ũ�� ���� �̵��ϴ� ������ ���� ��
			����(web surfing, ��ȭ��: ������) �Ǵ� �� ����¡�̶� �Ѵ�. �׸��� ���õ� ������� ���ִ� �� ����������
			������ �� ����Ʈ�� �Ѵ�.</p>
		<div id="footer2">
			<p>���� ���̵� ���� ������ ������ ������� ����� �� �ְڴ�. ù��° ���ϵ� �� �ڿ��� ��ġ ���� ��� ���� ���
				URL. �ι�° ���� �ڿ� �̸��� �����ϴ� ��������(protocol) ���� ��� HTTP, �ڿ��� ���̸� ���� ���� �� ��
				�ִ� ��� ���� ��� HTML.</p>
		</div>
	</div>
	<div id="footer3">Article Footer</div>
</div>
<!-- article ���� �� -->
<div id="aside">
	<div id="header5">
		<h1>Siderbar Heading</h1>
	</div>
	<p>������ �� ������ �ƴ� ���ü��� ���� ������� aside�� ǥ���� �� �ִ�. ������ ���������� ����� ���� ����
		����Ʈ ��ũ�� �ȳ���, nav ����� �׷� ���� aside ��ҷ� ��� �� �� �ִ�. ���� ��α׿��� �¿��� ���̵�ٸ�
		�ǹ��ϴ� �����μ� ���̵���� Ư������ ���� �ʼ������� �ʾƼ� ǥ�ø� �ص� �ǰ� �� �ص� �Ǵ� ����� �Ǵ� �������� �������
		�ڸ��� �� �ִ�.</p>
</div>