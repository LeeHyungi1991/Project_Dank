<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ page trimDirectiveWhitespaces="true" %>
	
	<c:forEach var="e" items="${atlist }">
	<table border="1">
	<tr>
		<td colspan="5">TAS2R38 �����ڴ� PAV�� AVI Ÿ�� �� ������ �ִµ�, PAV Ÿ���� 100�迡�� 1000�� ���� ������ ���ϰ� �����ٰ� �Ѵ�. �̴� ���̸� �Ծ ���������̹Ƿ� �̷��� �����ڸ� Ÿ�� �� ����� ���̸� �Ⱦ��� ���ۿ� ����</td>
	</tr>
	
	<tr>
		<td rowspan="2" >�������</td><td>��ݰ�������</td><td>${e.ac_num }</td><td>�����º�</td><td>${e.myname }</td>
	</tr>
	<tr>
		<td>�������ǥ�ó���</td><td>${e.ata_myacmemo }</td><td>HD</td><td>HD</td>
	</tr>
	
	<tr>
		<td rowspan="2" >�Ա�����</td><td>�Աݰ�������</td><td>${e.ata_yourac }</td><td>�޴º�</td><td>${e.yourname }</td>
	</tr>
	<tr>
		<td>�Ա�����ǥ�ó���</td><td>${e.ata_youracmemo }</td><td>HD</td><td>HD</td>
	</tr>
	<tr>
		<td rowspan="4" >�ڵ���ü����</td><td>������</td><td>${e.ata_startdate }</td><td>������</td><td><!-- ${e.ata_stopdate } -->//</td>
	</tr>
	<tr>
		<td>��ü�ݾ�</td><td>${e.ata_setmoney }</td><td>��ü����</td><td><!-- ${e.ata_dterm } -->//</td>
	</tr>
	<tr>
		<td>��ü�ð�</td><td>${e.ata_time }</td><td>�����Ȳ</td><td>${e.ata_ing }</td>
	</tr>
	<tr>
		<td>���Ῡ��</td><td>
		<c:if test="${e.ata_check eq 1}"> ��ü��</c:if>
		<c:if test="${e.ata_check eq 0}"> ������ü�ȴ�</c:if>
		<c:if test="${e.ata_check eq -1}"> ������</c:if>
		
		</td><td>HD</td><td>HD</td>
	</tr>
	</table>
	</c:forEach>