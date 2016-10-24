<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!--费用结算划付列表-->
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="<%=request.getContextPath()%>/fee/settle/member-paylist.do" method="post">
		<input type="hidden" name="pageSize" value="${pageSize }">
		<input type="hidden" name="feeId" value="${search.feeId }">
    </form>
</div>
<div class="bjui-pageContent" id="info-settle-release-list">
 	<table data-toggle="tablefixed" data-width="100%" >
	<thead>
    	<tr>
    		<th>编号</th>
    		<th>收款方</th>
    		<th>收款账号</th>
    		<th>划付金额(元)</th>
    		<th>划付状态</th>
    		<th>划付时间</th>
    	</tr>
    	</thead>
    	<tbody>
    		<c:forEach var="obj" items="${list }">
		    	<tr>
		    		<td>${obj.id }</td>
		    		<td>${obj.accountName }</td>
		    		<td>${obj.cardAccount }</td>
		    		<td><fmt:formatNumber value="${obj.moneyAmount }" pattern="0.00"/></td>
		    		<td>${obj.getPayStatusDesc() }</td>
		    		<td><fmt:formatDate value="${obj.payResultTime }" pattern="yyyy-MM-dd"/></td>
		    	</tr>
    		</c:forEach>
    	</tbody>
    </table> 
</div>
<%@ include file="/WEB-INF/jsp/common/pageFooter.jsp" %>