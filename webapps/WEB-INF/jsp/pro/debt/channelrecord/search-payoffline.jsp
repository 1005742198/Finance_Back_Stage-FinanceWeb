<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
function closeConfirm(){
	$(this).navtab("refresh");
}
</script>
<!-- 线下支付订单列表用于到款确认 -->
<div class="bjui-pageHeader" id="prolist-issue-search">
    <form id="pagerForm" data-toggle="ajaxsearch" action="<%=request.getContextPath()%>/debt/proissue/projectpayoffline/search.do" method="post">
    <input type="hidden" name="pageSize" value="${pageSize}">
        <div class="bjui-searchBar">
			<label>项目编号：</label>
			<input type="text" name="projectCode" value="<c:out value='${search.projectCode}'/>" class="form-control" size="10" data-rule="integer"/>
			<label>项目名称：</label>
			<input type="text" name="projectName" value="<c:out value='${search.projectName}'/>" class="form-control" size="10" />
            <button type="submit" class="btn-default" data-icon="search" data-clear-query="false">查询</button>
            <a class="btn btn-default" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">重置查询</a>
        </div>
    </form>
</div>

<div class="bjui-pageContent" id="prolist-issue-list">
 <table data-toggle="tablefixed" data-width="100%">
    	<thead>
    	<tr>
    		<th align="center" width="14%">项目名称</th>
    		<th align="center" width="6%">项目代码</th>
    		<th align="center" width="8%">业务类型</th>
    		<th align="center" width="14%">投资顾问</th>
    		<th align="center" width="14%">投资资金</th>
    		<th align="center" width="12%">待确认金额</th>
    		<th align="center" width="12%">已确认金额</th>
    		<th align="center" width="14%">到款状态</th>
    		<th align="center" width="8%">操作</th>
    	</tr>
    	</thead>
    	<tbody>
    		<c:if test="${not empty list}">
    			<c:forEach items="${list}" var="obj">
    		<tr>
    			<td>${obj.projectName}</td>
    			<td>${obj.projectCode}</td>
    			<td>${obj.productTypeDesc}</td>
    			
    			<td>${obj.saleAgentName}</td>
    			<td>${obj.investMoney}</td>
    			<td>${obj.investMoney - obj.confirmedMoney}</td>
    			<td>${obj.confirmedMoney}</td>
    			
    			<td>${obj.confirmStatusDesc}</td>
	    		<td>
	    			<a href="<%=request.getContextPath()%>/debt/proissue/projectpayoffline/payoffline-cfm-info.do?id=${obj.id}" 
	    				class="btn btn-blue" data-toggle="dialog" data-width="1300"  
	    				data-height="530" data-id="dialog-mask" data-mask="true">到款明细</a>
	    		</td>
    		</tr>
    			</c:forEach>
    		</c:if>
    		
    	</tbody>
    </table> 
</div>
<%@ include file="/WEB-INF/jsp/common/pageFooter.jsp" %>