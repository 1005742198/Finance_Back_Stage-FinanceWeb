<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!--结算退款违约金划付明细-->
<div class="bjui-pageContent" id="info-settle-release-list">
 	<table class="table table-bordered table-hover table-striped table-top"  data-width="100%" >
	<thead>
    	<tr>
    		<th width="17%">划付编号</th>
    		<th width="15%">收款方</th>
    		<th width="15%">收款账户名</th>
    		<th width="16%">收款账号</th>
    		<th width="7%">收款银行</th>
    		<th width="13%">划付金额(元)</th>
    		<th width="7%">划付状态</th>
    		<th width="10%">划付时间</th>
    	</tr>
    	</thead>
    	<tbody>
	    	<tr>
	    		<td>${obj.id }</td>
	    		<td>${obj.receiverRealName }</td>
		    	<td>${obj.receiverAccountName }</td>
	    		<td>${obj.receiverCardAccount }</td>
	    		<td>${obj.receiverBankChannelName }</td>
	    		<td><fmt:formatNumber value="${obj.breakPayMoney }" pattern="0.00"/></td>
	    		<td>${obj.getBreakPayStatusDesc() }</td>
	    		<td><fmt:formatDate value="${obj.breakPayCfmTime }" pattern="yyyy-MM-dd"/></td>
	    	</tr>
    	</tbody>
    </table> 
</div>
