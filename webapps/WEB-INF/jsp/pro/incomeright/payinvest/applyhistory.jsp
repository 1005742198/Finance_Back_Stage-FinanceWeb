<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 申请历史 -->
<div class="bjui-pageHeader" id="prolist-issue-search">
    <form id="pagerForm" data-toggle="ajaxsearch" action="<%=request.getContextPath()%>/incomeright/proissue/settle/applyhistory.do" method="post">
    	<input type="hidden" name="relationId" value="${search.relationId }">
    </form>
</div>

<div class="bjui-pageContent" id="prolist-issue-list">
    <table data-toggle="tablefixed" data-width="100%">
    	<thead>
    	<tr>
    		<th align="center" width="8%">申请人</th>
    		<th align="center" width="8%">申请金额</th>
    		<th align="center" width="10%">申请时间</th>
    		<th align="center" width="16%">申请意见</th>
    		<th align="center" width="8%">申请结果</th>
    		<th align="center" width="8%">复核人</th>
    		<th align="center" width="10%">复核时间</th>
    		<th align="center" width="16%">复核意见</th>
    	</tr>
    	</thead>
    	<tbody>
    	<c:forEach var="obj" items="${list}">
	    	<tr>
	    		<td>${obj.createOperatorName }</td>
	    		<td><fmt:formatNumber value="${obj.applyMoney }" pattern="0.00"/>  元</td>
	    		<td><fmt:formatDate value="${obj.createTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	    		<td>${obj.applyRemark }</td>
	    		<td><c:forEach var="item" items="${SpecialApplyStatus}"><c:if test="${obj.applyStatus==item.status}">${item}</c:if></c:forEach></td>
	    		<td>${obj.auditOperatorName }</td>
	    		<td><fmt:formatDate value="${obj.auditTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	    		<td>${obj.auditRemark }</td>
	    	</tr>
    	</c:forEach>
    	</tbody>
    </table>
</div>
<%@ include file="/WEB-INF/jsp/common/pageFooter.jsp" %>
