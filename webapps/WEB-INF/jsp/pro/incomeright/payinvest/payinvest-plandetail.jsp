<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 项目兑付投资者明细查询
查询时，只有查具体用户时，可以查所有期
在没有其他查询条件下，不能列出所有期
 -->
<div class="bjui-pageHeader" id="payinvest-plandetail-search">
    <form id="pagerForm" data-toggle="ajaxsearch" action="<%=request.getContextPath()%>/incomeright/proclaims/payinvest/plandetail.do?projectId=${search.projectId}" method="post">
        <input type="hidden" name="pageSize" value="${pageSize}">
        <input type="hidden" name="projectId" value="${search.projectId}">
        <input type="hidden" name="periodNumber" value="${search.periodNumber}">
        <div class="bjui-searchBar">
            <label>投资者：</label><input type="text" name="userName" value="<c:out value='${search.userName}'/>" class="form-control" size="10" />
            <label class="control-label x110">兑付状态：</label> 
			<select name="repayStatus" id="select3" data-toggle="selectpicker" class="show-tick" style="display: none;">
					<option value="" selected>-全部-</option>
					<c:forEach var="item" items="${repayStatusDesc}">
					<option value="${item.value}" <c:if test="${item.value==search.repayStatus}">selected</c:if>>${item}</option>
					</c:forEach>
			</select>
            <button type="submit" class="btn-default" data-icon="search" data-clear-query="false">查询</button>
            <a class="btn btn-default" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">重置查询</a>
        </div>
    </form>
</div>
<div class="bjui-pageContent" id="payinvest-plandetail-list">
    <table data-toggle="tablefixed" data-width="100%">
    	<thead>
    	<tr>
    		<th align="center">投资者名称</th>
    		<th align="center">收款卡(*)</th>
    		<th align="center">应兑日期</th>
    		<th align="center">应兑金额(元)</th>
    		<th align="center">逾期</th>
    		<th align="center">已兑总金额(元)</th>
    		<th align="center">兑付状态</th>
    	</tr>
    	</thead>
    	<tbody>
    	<c:forEach var="list" items="${list}">
    	<tr>
    		<td>${list.showName() }</td>
    		<td><c:if test="${list.channelName!=null}">[${list.channelName}]${list.getCardInfoShow() }</c:if></td>
    		<td><fmt:formatDate value="${list.payInvestDate}" pattern="yyyy-MM-dd"/></td>
    		<td>应兑金额：<fmt:formatNumber value="${list.principal+list.interest+list.overInterest}" pattern="0.00"/><br>
    		其中本金：<fmt:formatNumber value="${list.principal}" pattern="0.00"/><br>
    		其中利息：<fmt:formatNumber value="${list.interest}" pattern="0.00"/><br>
    		</td>
    		<td>
    		逾期利息：<fmt:formatNumber value="${list.overInterest}" pattern="0.00"/>
    		<br>逾期天数：${list.overDay }
    		</td>
    		<td>
    		<fmt:formatNumber value="${list.paidPrincipal+list.paidTotalInterest+list.paidOverInterest}" pattern="0.00"/></td>
    		<td><c:forEach var="item" items="${repayStatusDesc}"><c:if test="${item.value==list.repayStatus}">${item}</c:if></c:forEach></td>
    	</tr>
    	</c:forEach>
    	</tbody>
    </table>
</div>
<%@ include file="/WEB-INF/jsp/common/pageFooter.jsp" %>
