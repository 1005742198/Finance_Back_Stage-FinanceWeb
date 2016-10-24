<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!--核保不通过/超募资金退款明细-->
 <form id="pagerForm"  data-toggle="ajaxsearch" action="<%=request.getContextPath()%>/incomeright/proissue/settle/info-settle-drawback-list.do?projecId=${search.projectId }" method="post">
 <input type="hidden" name="pageSize" value="${pageSize}">
 </form>
<div class="bjui-pageHeader">
	<table style="width:100%">
	<tr>
		<td><span>已退款总金额:<fmt:formatNumber value="${drawbackMoney}" pattern="0.00"/> (元),已退款总人数:<fmt:formatNumber value="${darwbackUser}"/>。</span></td>
	</tr>
	</table>
    <form id="pagerForm"  data-toggle="ajaxsearch" action="<%=request.getContextPath()%>/incomeright/settle/pro-drawbacklist.do?projectId=${search.projectId}&cfmId=${search.cfmId }" method="post">
        <div class="bjui-searchBar">
            <label>投资者：</label><input type="text" name="applyUserRealName" value="<c:out value='${search.applyUserRealName}'/>" class="form-control" size="10" />
            <label>手机号：</label><input type="text" name="applyUserPhone" value="<c:out value='${search.applyUserPhone}'/>" class="form-control" size="10" />
           <button type="submit" class="btn-default" data-icon="search">查询</button>&nbsp;
            <a class="btn btn-default" data-toggle="reloadsearch" data-icon="undo" data-clear-query="true">重置查询</a>&nbsp;
        </div>
    </form>
</div>
<div class="bjui-pageContent tableContent" id="pro-drawbacklist-list">
    <table data-toggle="tablefixed" data-width="100%" data-height="200">
    	<thead>
    	<tr>
    		<th>投资者</th>
    		<th>银行卡号</th>
    		<th>收款银行</th>
    		<th>发起退款时间</th>
    		<th>退款金额(元)</th>
    		<th>退款状态</th>
    		<th>退款确认时间</th>
    	</tr>
    	</thead>
    	<tbody>
    	<c:forEach var="obj" items="${list}">
    	<tr>
    		<td>${obj.showName()}</td>
    		<td>${obj.applyPayCardAccount}</td>
    		<td>${obj.applyUserBankChannelName }</td>
    		<td><fmt:formatDate value="${obj.refundCfmTime}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
    		<td><fmt:formatNumber value="${obj.refundMoney}" pattern="0.00"/> </td>
    		<td>${obj.getRefundStatusDesc()}</td>
    		<td><fmt:formatDate value="${obj.refundCfmTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
    	</tr>
    	</c:forEach>
    	</tbody>
    </table>
<%@ include file="/WEB-INF/jsp/common/pageFooter.jsp" %>
</div>