<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!--投资兑付明细
查询时，只有查具体用户时，可以查所有期
在没有其他查询条件下，不能列出所有期
-->
<div class="bjui-pageHeader" id="pro-drawbacklist-search">
    <form id="pagerForm" data-toggle="ajaxsearch" action="<%=request.getContextPath()%>/incomeright/proclaims/payinvest/paylist.do?projectId=${search.projectId}" method="post">
        <input type="hidden" name="pageSize" value="${pageSize}">
        <input type="hidden" name="projectId" value="${search.projectId}">
        <input type="hidden" name="periodNumber" value="${search.periodNumber}">
        <div class="bjui-searchBar">
            <label>投资者：</label><input type="text" name="userName" value="<c:out value='${search.userName}'/>" class="form-control" size="10" />
            <label>划款状态：</label> 
			<select name="payStatus" id="select2" data-toggle="selectpicker" class="show-tick" style="display: none;">
				<option value="">全部</option>
				<option value="3" <c:if test="${search.payStatus==3}">selected</c:if>>处理中</option>
				<option value="2" <c:if test="${search.payStatus==2}">selected</c:if>>处理成功</option>
				<option value="4" <c:if test="${search.payStatus==4}">selected</c:if>>处理失败</option>
			</select>
            <button type="submit" class="btn-default" data-icon="search" data-clear-query="false">查询</button>
            <a class="btn btn-default" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">重置查询</a>
        </div>
    </form>
</div>
<div class="bjui-pageContent tableContent" id="pro-drawbacklist-list">
    <table data-toggle="tablefixed" data-width="100%">
    	<thead>
    	<tr>
    		<th align="center">兑付期数</th>
    		<th align="center">投资者</th>
    		<th align="center">收款银行卡(*)</th>
    		<th align="center">兑付金额(元)</th>
    		<th align="center">划款时间</th>
    		<th align="center">划款状态</th>
    	</tr>
    	</thead>
    	<tbody>
    	<c:forEach var="list" items="${list}">
    	<tr>
    		<td>${list.periodNumber }</td>
    		<td>${list.showName() }</td>
    		<td><c:if test="${list.channelName!=null}">[${list.channelName}]${list.getCardInfoShow() }</c:if></td>
    		<td>应划款金额：<fmt:formatNumber value="${list.totalPay}" pattern="0.00"/><br>
    		实际划款金额：<fmt:formatNumber value="${list.payMoney}" pattern="0.00"/></td>
    		<td><fmt:formatDate value="${list.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
    		<td><c:if test="${list.payStatus==3}">处理中</c:if><c:if test="${list.payStatus==2}">处理成功</c:if><c:if test="${list.payStatus==4}">处理失败</c:if></td>
    	</tr>
    	</c:forEach>
    	</tbody>
    </table>
<%@ include file="/WEB-INF/jsp/common/pageFooter.jsp" %>
</div>