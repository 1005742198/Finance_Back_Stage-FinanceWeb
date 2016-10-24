<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!--核保明细-->
<div class="bjui-pageHeader hide">
    <form id="pagerForm" data-toggle="ajaxsearch" action="<%=request.getContextPath()%>/fasset/proissue/settle/pro-cfmright-detail.do">
        <input type="hidden" name="pageSize" value="${pageSize}">
        <input type="hidden" name="projectId" value="${search.projectId}">
    </form>
</div>
<div class="bjui-pageContent" id="pro-cfmright-detail">
 	<table data-toggle="tablefixed" data-height="200">
	<thead>
    	<tr>
    		<th width="120px">投资人</th>
    		<th>转让报价(元)</th>
    		<th>保证金金额(元)</th>
    		<th>已支付金额(元)</th>
    		<th width="120px">到账时间</th>
    		<th width="50px">成交状态</th>
    		<th>退款金额(元)</th>
    		<th>违约金(元)</th>
    	</tr>
    	</thead>
    	<tbody>
    	<c:forEach var ="obj" items="${list }">
	    	<tr>
	    		<td>${obj.orderUserName }</td>
	    		<td><fmt:formatNumber value="${obj.orderMoney}" pattern="0.00"/></td>
	    		<td><fmt:formatNumber value="${obj.guaranteeMoney}" pattern="0.00"/></td>
	    		<td><fmt:formatNumber value="${obj.paidMoney}" pattern="0.00"/></td>
	    		<td><fmt:formatDate value="${obj.payCfmTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	    		<td>${obj.getContractStatusDesc() }</td>
	    		<td><fmt:formatNumber value="${obj.refundMoney }" pattern="0.00"/></td>
	    		<td><fmt:formatNumber value="${obj.breakPayMoney }" pattern="0.00"/></td>
	    	</tr>
    	</c:forEach>
    	</tbody>
    </table> 
</div>
<%@ include file="/WEB-INF/jsp/common/pageFooter.jsp" %>
