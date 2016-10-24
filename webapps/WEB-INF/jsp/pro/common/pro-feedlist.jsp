<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 项目动态，包含了所有对项目的后台操作日志 -->
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="<%=request.getContextPath()%>/debt/proissue/proinfo/feedlist.do">
        <input type="hidden" name="pageSize" value="${pageSize}">
        <input type="hidden" name="projectId" value="${search.projectId}">
        <input type="hidden" name="belongType" value="${search.belongType}">
    </form>
</div>
<div class="bjui-pageContent">
    <table class="table table-condensed table-hover" width="100%">
    	<thead>
    	<tr>
    		<th width="25%">操作时间</th>
    		<th width="15%">操作人</th>
    		<th width="15%">操作动态</th>
    		<th width="30%">操作意见</th>
    		<th width="15%">项目状态变更</th>
    	</tr>
    	</thead>
    	<tbody>
    	<c:forEach var="obj" items="${list}">
    	<tr>
    		<td><fmt:formatDate value="${obj.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
    		<td>${obj.createOperatorName}</td>
    		<td>${obj.flowName}</td>
    		<td>${obj.flowFeedOpinion}</td>
    		<td>${obj.flowFeedText}</td>
    	</tr>
    	</c:forEach>
    	</tbody>
    </table>
</div>
<%@ include file="/WEB-INF/jsp/common/pageFooter.jsp" %>
