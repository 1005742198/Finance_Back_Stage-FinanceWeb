<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!--结算放款明细-->
<div class="bjui-pageContent" id="info-settle-release-list">
 	<table data-toggle="tablefixed" data-width="100%"  data-height="200">
	<thead>
    	<tr>
    		<th>放款编号</th>
    		<th>账户名称</th>
    		<th>收款账号</th>
    		<th>收款银行开户行</th>
    		<th>放款金额(元)</th>
    		<th>支付状态</th>
    		<th>放款时间</th>
    	</tr>
    	</thead>
    	<tbody>
    	<c:forEach var="obj" items="${list }">
	    	<tr>
	    		<td>${obj.paymentNo }</td>
	    		<td>${obj.accountName }</td>
	    		<td>${obj.cardAccount }</td>
	    		<td>${obj.cardProName }${obj.cardCityName }${obj.subBankName }</td>
	    		<td><fmt:formatNumber value="${obj.moneyAmount }" pattern="0.00"/></td>
	    		<td>${obj.getPayStatusDesc() }</td>
	    		<td><fmt:formatDate value="${obj.payResultTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	    	</tr>
    	</c:forEach>
    	</tbody>
    </table> 
</div>
