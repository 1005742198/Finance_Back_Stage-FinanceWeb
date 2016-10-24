<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 某期兑付明细 -->
<div class="bjui-pageHeader" id="pro-payinvestdetail-search">
	<table style="width:100%">
	<tr>
		<td><span>兑付期数：${obj.periodNumber},本期未兑付总金额:<fmt:formatNumber value="${obj.investPrincipal+obj.investInterest+obj.investOverInterest-obj.paidInvestPrincipal-obj.paidInvestInterest-obj.paidInvestOverInterest}" pattern="0.00"/>,兑付投资者:${total}人</span></td>
	</tr>
	</table>
    <form id="pagerForm" data-toggle="ajaxsearch" action="<%=request.getContextPath()%>/debt/proclaims/payinvest/payindex.do?index=2&repayPlanId=${obj.id}" method="post">
        <input type="hidden" name="pageSize" value="${pageSize}">
        <div class="bjui-searchBar">
            <label>投资者：</label><input type="text" name="userName" value="<c:out value='${search.userName}'/>" class="form-control" size="10" />
            <button type="submit" class="btn-default" data-icon="search" data-clear-query="false">查询</button>
            <a class="btn btn-default" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">重置查询</a>
        </div>
    </form>
</div>

<div class="bjui-pageContent"  id="pro-payinvestdetail-list">
    <table data-toggle="tablefixed" data-width="100%" data-height="340">
    	<thead>
    	<tr>
    		<th align="center">投资者</th>
    		<th align="center" width="90">收款卡(*)</th>
    		<th align="center">应兑付金额(元)</th>
    		<th align="center">逾期</th>
    		<th align="center">已兑付金额(元)</th>
    	</tr>
    	</thead>
    	<tbody>
    	<c:forEach var="list" items="${planList}">
    	<tr>
    		<td>${list.userName }</td>
    		<td><c:if test="${list.channelName!=null}">[${list.channelName}]${list.getCardInfoShow() }</c:if></td>
    		<td>应兑付金额：<fmt:formatNumber value="${list.principal+list.interest+list.overInterest}" pattern="0.00"/><br>
    		其中本金：<fmt:formatNumber value="${list.principal}" pattern="0.00"/><br>
    		其中利息：<fmt:formatNumber value="${list.interest}" pattern="0.00"/></td>
    		<td>应兑付逾期利息：<fmt:formatNumber value="${list.overInterest}" pattern="0.00"/><br>
    		逾期天数：${list.overDay }</td>
    		<td>已兑付金额：<fmt:formatNumber value="${list.paidPrincipal+list.paidTotalInterest+list.paidOverInterest}" pattern="0.00"/><br>
    		其中本金：<fmt:formatNumber value="${list.paidPrincipal}" pattern="0.00"/><br>
    		其中利息：<fmt:formatNumber value="${list.paidTotalInterest}" pattern="0.00"/><br>
    		其中逾期：<fmt:formatNumber value="${list.paidOverInterest}" pattern="0.00"/></td>
    	</tr>
    	</c:forEach>
    	</tbody>
    </table>
</div>
<%@ include file="/WEB-INF/jsp/common/pageFooter.jsp" %>
