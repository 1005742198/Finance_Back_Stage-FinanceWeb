<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!--支付渠道入金统计列表 -->
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="<%=request.getContextPath()%>${searchAddress}" method="post">
        <input type="hidden" name="payMoneySummrayId" value="${search.payMoneySummrayId}">
        <div class="bjui-searchBar">
        	<label>支付渠道：</label>
			<select name="payCenterId"  data-toggle="selectpicker" class="show-tick" style="display: none;">
				<option value="">全部</option>
				<c:forEach var="item" items="${payCenterName}">
					<option value="${item.paycenterId}" <c:if test="${search.payCenterId==item.paycenterId}">selected</c:if>>${item.payCenterName}</option>
				</c:forEach>
			</select>
           <label>支付状态：</label>
          	<select name="payStatus" data-toggle="selectpicker" class="show-tick" style="display: none;" size="10">
				<option value="">-全部-</option>
				<c:forEach var="item" items="${payStatusDesc}" >
					<option value="${item.status}" <c:if test="${search.payStatus==item.status }">selected</c:if>>${item}</option>
				</c:forEach> 
			</select>
            <button type="submit" class="btn-default" data-icon="search" data-clear-query="false">查询</button>
            <a class="btn btn-default" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">重置查询</a>
         </div>
    </form>
</div>
<div class="bjui-pageContent">
    <table data-toggle="tablefixed" data-width="100%">
    	<thead>
    	<tr>
    		<th align="center">编号</th>
    		<th align="center">支付渠道</th>
    		<th align="center">结算渠道</th>
    		<th align="center">支付流水号</th>
    		<th align="center">结算金额</th>
    		<th align="center">支付状态</th>
    		<th align="center">创建时间</th>
    	</tr>
    	</thead>
    	<tbody>
    	<c:forEach var="obj" items="${list }">
	    	<tr>
	    		<td>${obj.id }</td>
	    		<td>
	    			<c:forEach items="${payCenterName}" var="item">
    					<c:if test="${obj.payCenterId == item.paycenterId }">${item.payCenterName}</c:if>
    				</c:forEach>
    			</td>
    			<td>
	    			<c:forEach items="${clearCenterDesc}" var="item">
    					<c:if test="${obj.payClearId == item.paycenterId }">${item.payCenterName}</c:if>
    				</c:forEach>
    			</td>
    			<td>${obj.paymentNo}</td>
	    		<td><fmt:formatNumber value="${obj.settleMoney }" pattern="0.00"/></td>
	    		<td>${obj.getPayStatusDesc() }</td>
	    		<td><fmt:formatDate value="${obj.createTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	    	</tr>
    	</c:forEach>
    </table>
</div>
<%@ include file="/WEB-INF/jsp/common/pageFooter.jsp" %>
