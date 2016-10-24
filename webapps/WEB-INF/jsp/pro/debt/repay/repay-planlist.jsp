<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 项目还款计划明细 -->
<div class="bjui-pageHeader" id="prolist-repay-search">
    <form id="pagerForm" data-toggle="ajaxsearch" action="<%=request.getContextPath()%>/debt/proclaims/repay/planlist.do?projectId=${search.projectId}" method="post">
        <div class="bjui-searchBar">
			<label>还款状态：</label>
			<select name="repayStatus" id="select2" data-toggle="selectpicker" class="show-tick" style="display: none;">
				<option value="">全部</option>
				<c:forEach var="item" items="${repayStatusDesc}">
				<option value="${item.value}" <c:if test="${search.repayStatus==item.value}">selected</c:if>>${item}</option>
				</c:forEach>
			</select>
            <button type="submit" class="btn-default" data-icon="search" data-clear-query="false">查询</button>
            <a class="btn btn-default" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">重置查询</a>
        </div>
    </form>
</div>
<div class="bjui-pageContent" id="repay-planlist-list">
    <table data-toggle="tablefixed" data-width="100%" >
    	<thead>
    	<tr>
    		<th>期数序号</th>
    		<th>本期计息周期</th>
    		<th>正常还款时间</th>
    		<th>本金/利息</th>
    		<th>应还/已还金额(元)</th>
    		<th>逾期罚息金额(元)</th>
    		<th>逾期天数</th>
    		<th>还款时间</th>
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
    		<td><fmt:formatDate value="${list.planRepayDate}" pattern="yyyy-MM-dd"/></td>
    		<td>
    		计息本金：<fmt:formatNumber value="${list.interestPrincipal}" pattern="0.00"/>
    		<br/>应还本金：<fmt:formatNumber value="${list.principal}" pattern="0.00"/>
    		<br/>应还利息：<fmt:formatNumber value="${list.interest}" pattern="0.00"/>
    		</td>
    		<td>应还金额：<fmt:formatNumber value="${list.principal+list.interest+list.overInterest}" pattern="0.00"/><br>
    		已还金额：<fmt:formatNumber value="${list.paidPrincipal+list.paidInterest+list.paidOverInterest}" pattern="0.00"/>
    		</td>
    		<td><fmt:formatNumber value="${list.overInterest}" pattern="0.00"/></td>
    		<td>${list.overDay}</td>
    		<td><fmt:formatDate value="${list.lastRepayTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
    		<td><c:forEach var="item" items="${repayStatusDesc}"><c:if test="${item.value==list.repayStatus}">${item}</c:if></c:forEach><c:if test="${list.overDay>0}">&nbsp;&nbsp;<span class="red">逾期</span></c:if></td>
    	</tr>
    	</c:forEach>
    	</tbody>
    </table>
</div>
