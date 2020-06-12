<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true" %>
<table class="table table-hover">
<tr>
	<th>회차</th>
	<th>납입원금</th>
	<th>대출이자</th>
	<th>월상환금</th>
	<th>대출잔금</th>
</tr>
<c:forEach items="${list }" var="e" varStatus="i">
<tr>
	<td>${i.index+1 }</td>
	<td>${e.repayM }</td>
	<td>${e.repayR }</td>
	<td>${e.repayMR }</td>
	<td>${e.balance }</td>
</tr>
</c:forEach>
</table>