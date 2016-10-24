<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!--核保不通过/超募资金退款明细-->
 <table>
 	<tr><td>
 	<label class="control-label">退款明细：</label> 
 	</td></tr>
 </table>
<div class="bjui-pageContent tableContent" id="pro-drawbacklist-list">
    <table data-toggle="tablefixed" data-width="100%" data-height="200">
    	<thead>
    	<tr>
    		<th>报价方</th>
    		<th>支付金额(元)</th>
    		<th>退款金额(元)</th>
    		<th>退款原因</th>
    		<th>退款账户</th>
    		<th>退款时间</th>
    		<th>退款状态</th>
    	</tr>
    	</thead>
    	<tbody>
    	<c:forEach var="obj" items="${drawbackList}">
    	<tr>
    		<td>${obj.showName()}</td>
    		<td><fmt:formatNumber value="${obj.paidMoney}" pattern="0.00"/> </td>
    		<td><fmt:formatNumber value="${obj.refundMoney}" pattern="0.00"/> </td>
    		<td>${obj.refundDesc}</td>
    		<td>${obj.applyPayCardAccount}</td>
    		<!-- 未成功退款，则显示退款发起时间，退款成功显示退款成功时间 -->
    		<td><fmt:formatDate value="${obj.refundCfmTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
    		<td>${obj.getRefundStatusDesc()}</td>
    	</tr>
    	</c:forEach>
    	</tbody>
    </table>
</div>