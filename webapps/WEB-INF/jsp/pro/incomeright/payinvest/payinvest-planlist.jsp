<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 项目兑付计划列表 -->
<div class="bjui-pageHeader" id="prolist-repay-search">
    <form id="pagerForm" data-toggle="ajaxsearch" action="<%=request.getContextPath()%>/incomeright/proclaims/payinvest/planlist.do?projectId=${search.projectId}" method="post">
        <div class="bjui-searchBar">
			<label>兑付状态：</label>
			<select name="payInvestStatus" id="select2" data-toggle="selectpicker" class="show-tick" style="display: none;">
				<option value="">全部</option>
				<c:forEach var="item" items="${payInvestStatusDesc}">
				<option value="${item.value}" <c:if test="${search.payInvestStatus==item.value}">selected</c:if>>${item}</option>
				</c:forEach>
			</select>
            <button type="submit" class="btn-default" data-icon="search" data-clear-query="false">查询</button>
            <a class="btn btn-default" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">重置查询</a>
        </div>
    </form>
</div>
<div class="bjui-pageContent" id="payinvest-planlist">
    <table data-toggle="tablefixed" data-width="100%">
    	<thead>
    	<tr>
    		<th>期数序号</th>
    		<th>本期计息周期</th>
    		<th>兑付人数</th>
    		<th>正常兑付时间</th>
    		<th>应兑/已兑金额</th>
    		<th>逾期罚息金额</th>
    		<th>逾期天数</th>
    		<th>兑付时间</th>
    		<th>当期状态</th>
    	</tr>
    	</thead>
    	<tbody>
    	<c:forEach var="list" items="${list}">
    	<tr>
    		<td>${list.periodNumber}</td>
    		<td>
    		计息开始：<fmt:formatDate value="${list.interestStartDate}" pattern="yyyy-MM-dd"/><br />
    		计息截止：<fmt:formatDate value="${list.interestEndDate}" pattern="yyyy-MM-dd"/>
    		</td>
    		<td>${list.investNum}人</td>
    		<td><fmt:formatDate value="${list.payInvestDate}" pattern="yyyy-MM-dd"/></td>
    		<td>应兑付金额：<fmt:formatNumber value="${list.investPrincipal+list.investInterest+list.investOverInterest}" pattern="0.00"/>元<br>
    		已兑付金额：<fmt:formatNumber value="${list.paidInvestPrincipal+list.paidInvestInterest+list.paidInvestOverInterest}" pattern="0.00"/>元</td>
    		<td><fmt:formatNumber value="${list.investOverInterest}" pattern="0.00"/>元</td>
    		<td>${list.investOverDay}</td>
    		<td><fmt:formatDate value="${list.lastPayInvestTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
    		<td><c:forEach var="item" items="${payInvestStatusDesc}"><c:if test="${item.value==list.payInvestStatus}">${item}</c:if></c:forEach><c:if test="${list.investOverDay>0}">&nbsp;&nbsp;<span class="red">逾期</span></c:if></td>
    	</tr>
    	</c:forEach>
    	</tbody>
    </table>
</div>
