<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 项目还款扣款记录 -->
<div class="bjui-pageHeader" id="prolist-repay-search">
    <form id="pagerForm" data-toggle="ajaxsearch" action="<%=request.getContextPath()%>/incomeright/proclaims/repay/repaylist.do" method="post">
        <input type="hidden" name="pageSize" value="${search.pageSize}">
                <input type="hidden" name="projectId" value="${search.projectId}">
        <input type="hidden" name="periodNumber" value="${search.periodNumber}">
        <div class="bjui-searchBar">
			<label>扣款状态：</label>
			<select name="payStatus" id="select2" data-toggle="selectpicker" class="show-tick" style="display: none;">
				<option value="">全部</option>
				<option value="3" <c:if test="${search.payStatus==3}">selected</c:if>>扣款中</option>
				<option value="2" <c:if test="${search.payStatus==2}">selected</c:if>>扣款成功</option>
				<option value="4" <c:if test="${search.payStatus==4}">selected</c:if>>扣款失败</option>
			</select>
            <button type="submit" class="btn-default" data-icon="search" data-clear-query="false">查询</button>
            <a class="btn btn-default" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">重置查询</a>
        </div>
    </form>
</div>
<div class="bjui-pageContent" id="repay-paylist-list">
    <table data-toggle="tablefixed" data-width="100%">
    	<thead>
    	<tr>
    		<th>期数序号</th>
    		<th>正常还款时间</th>
    		<th>应还/扣款金额(元)</th>
    		<th>扣款详情</th>
    		<th>到账确认时间</th>
    		<th>扣款状态</th>
    		<th>支付方式</th>
    	</tr>
    	</thead>
    	<tbody>
    	<c:forEach var="list" items="${list}">
    	<tr>
    		<td>${list.periodNumber}</td>
    		<td><fmt:formatDate value="${list.planRepayDate}" pattern="yyyy-MM-dd"/></td>
    		<td>应还金额：<fmt:formatNumber value="${list.totalPay-paymoney}" pattern="0.00"/><br>
    		扣款金额：<fmt:formatNumber value="${list.payAmount}" pattern="0.00"/></td>
    		<c:if test="${list.payStatus==2}">
    		<c:set var="paymoney" value="${paymoney+list.payAmount }"></c:set>
    		</c:if>
    		<td>
    		扣款时间：<fmt:formatDate value="${list.transferTime}" pattern="yyyy-MM-dd HH:mm:ss"/><br/>
    		扣款账户名称：${list.accountName }<br/>
    		<c:if test="${list.payApplyType ==1 }">
	    		扣款账号：${list.cardAccount }<br/>
	    		扣款银行：${list.bankChannelName }
    		</c:if>
    		<c:if test="${list.payApplyType ==2 }">
	    		扣款账号：${list.offlineAccount }<br/>
	    		扣款银行：${list.offlineBankName }
    		</c:if>
    		</td>
    		<td><fmt:formatDate value="${list.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
    		<td><c:if test="${list.payStatus==3}">扣款中</c:if><c:if test="${list.payStatus==2}">扣款成功</c:if><c:if test="${list.payStatus==4}">扣款失败</c:if></td>
    		<td><c:if test="${list.payApplyType==1}">线上还款</c:if><c:if test="${list.payApplyType==2}">线下还款</c:if></td>
    	</tr>
    	</c:forEach>
    	</tbody>
    </table>
</div>
<%@ include file="/WEB-INF/jsp/common/pageFooter.jsp" %>
