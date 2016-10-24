<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 主管已审核，待平台审核的项目 -->
<div class="bjui-pageHeader" id="prolist-review-search">
    <form id="pagerForm" data-toggle="ajaxsearch" action="<%=request.getContextPath()%>/debt/proissue/recordreview/${action}.do" method="post">
        <input type="hidden" name="pageSize" value="${pageSize}">
        <div class="bjui-searchBar">
            <%@ include file="/WEB-INF/jsp/pro/debt/recordsearch/search_itembase.jsp" %>
            <label>提交时间：</label>
            <input type="text" name="updateTimeBegin" value="${search.updateTimeBegin }" class="form-control" size="10" data-toggle="datepicker"
			data-pattern="yyyy-MM-dd" data-nobtn="true" data-rule="date"/>
			<label>-</label>
			<input type="text" name="updateTimeEnd" value="${search.updateTimeEnd }" class="form-control" size="10" data-toggle="datepicker"
			data-pattern="yyyy-MM-dd" data-nobtn="true" data-rule="date"/>
            <button type="submit" class="btn-default" data-icon="search" data-clear-query="false">查询</button>
            <a class="btn btn-default" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">重置查询</a>
        </div>
    </form>
</div>

<div class="bjui-pageContent" id="prolist-review-list">
    <table data-toggle="tablefixed" data-width="100%">
    	<thead>
    	<tr>
    		<th align="center" width="15%">提交时间</th>
    		<th align="center" width="15%">融资方</th>
    		<th align="center" width="15%">备案代码</th>
    		<th align="center" width="15%">备案简称</th>
    		<th align="center" width="12%">拟募集规模</th>
    		<th align="center" width="8%">拟定期限</th>
    		<th align="center" width="10%">拟定年化收益率</th>
    		<th align="center" width="10%">拟还款方式</th>
    		<th align="center" width="15%">操作</th>
    	</tr>
    	</thead>
    	<tbody>
    	<c:forEach var="obj" items="${list}">
    	<tr>
    		<td><fmt:formatDate value="${obj.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
    		<td><a href="<%=request.getContextPath()%>/user/view.do?id=${obj.loanUserId}" 
    				data-toggle="dialog" data-width="800"  data-height="600" data-id="dialog-mask" 
    				data-mask="true" class="text-omit pull-left">${obj.loanUserName}</a></td>
    		<td>${obj.recordCode}</td>
    		<td><a href="<%=request.getContextPath()%>/debt/proissue/recordinfo/view.do?id=${obj.id}" 
    				data-toggle="dialog" data-width="1000"  data-height="600" data-id="dialog-mask" 
    				data-mask="true" class="text-omit pull-left">${obj.recordName}</a></td>
			<td><fmt:formatNumber value="${obj.projectMoney}" pattern="0.00"/>元</td>
    		<td>${obj.projectLimit}<c:forEach var="item" items="${projectLimitTypeList}"><c:if test="${obj.projectLimitTypeId==item.type}">${item}</c:if></c:forEach></td>
    		<td><fmt:formatNumber value="${obj.investProfit*100}" pattern="0.00"/>%</td>
    		<td><c:forEach var="item" items="${systypeRepayList}"><c:if test="${obj.repayTypeId==item.id}">${item.repayTypeName}</c:if></c:forEach></td>
    		<td>
    			<c:if test="${powerlist.contains('/debt/proissue/recordreview/view.do')}">
    			<a href="<%=request.getContextPath()%>/debt/proissue/recordreview/view.do?id=${obj.id}" 
	   				class="btn btn-blue" data-toggle="dialog" data-width="800"  
	   				data-height="400" data-id="dialog-mask" data-mask="true">审核</a>
	   			</c:if>
    			<a href="<%=request.getContextPath()%>/debt/proissue/proinfo/feedlist.do?projectId=${obj.id}&belongType=1" 
    				data-toggle="dialog" data-width="1000"  
    				data-height="600" data-id="dialog-mask" data-mask="true">审核记录</a>
    		</td>
    	</tr>
    	</c:forEach>
    	</tbody>
    </table>
</div>
<%@ include file="/WEB-INF/jsp/common/pageFooter.jsp" %>
