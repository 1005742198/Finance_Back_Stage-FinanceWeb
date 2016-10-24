<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch"  action="<%=request.getContextPath()%>/toolbox/projectperiod/getprojectlist.do">
    <div class="bjui-searchBar">
        	<label class="control-label x110">项目编码：</label>
		    <input type="text" name="projectCode" id="projectCode" value="<c:out value='${search.projectCode }'/>" class="form-control" size="13" data-rule="" />
		    <label class="control-label x110">项目名称：</label>
		    <input type="text" name="projectName" id="projectName" value="${search.projectName }" class="form-control" size="13" />
		    <label>创建日期：</label>
			<input type="text" name="createTimeBegin" value="${search.createTimeBegin }" class="form-control" size="10" data-toggle="datepicker"
			data-pattern="yyyy-MM-dd" data-nobtn="true" data-rule="date"/>
			<label>-</label>
			<input type="text" name="createTimeEnd" value="${search.createTimeEnd }" class="form-control" size="10" data-toggle="datepicker"
			data-pattern="yyyy-MM-dd" data-nobtn="true" data-rule="date"/>
			<button type="submit" class="btn-default" data-icon="search">项目查询</button>
			<a class="btn btn-default" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">重置查询</a>
        </div>
</form>
</div>
<div class="bjui-pageContent">
<c:if test="${not empty projectList }">
    <table data-toggle="tablefixed" data-width="100%">
    	<thead>
    	<tr>
    		<th align="center">项目编码</th>
    		<th align="center">募集金额</th>
    		<th align="center">项目名称</th>
    		<th align="center">投资收益率</th>
    		<th align="center">项目期限</th>
    		<th align="center">项目起息日</th>
    		<th align="center">项目到期日</th>
    		<th align="center">还款方式</th>
    		<th align="center">创建日期</th>
    		<th align="center">操作</th>
    	</tr>
    	</thead>
    	<tbody>
    	<c:forEach var="obj" items="${projectList }">
	    	<tr>
	    		<td>${obj.projectCode }</td>
	    		<td>${obj.projectMoney }</td>
	    		<td>${obj.projectName }</td>
	    		
	    		<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${obj.investProfit*100}" />%</td>
	    		<td>${obj.projectLimit }&nbsp;${obj.projectLimitTypeDesc}</td>
	    		<td><fmt:formatDate value="${obj.valueDate}" pattern="yyyy-MM-dd"/></td>    		
	    		<td><fmt:formatDate value="${obj.expireDate}" pattern="yyyy-MM-dd"/></td>
	    		<td>${obj.repayTypeName}</td>
	    		<td><fmt:formatDate value="${obj.createTime}" pattern="yyyy-MM-dd"/></td>
	    		<td><%-- <a href="<%=request.getContextPath()%>/toolbox/projectperiod/calculateperiod.do?type=3&projectCode=${obj.projectCode}&repayTypeName=${obj.repayTypeName}" 
		   					class="btn btn-blue" data-toggle="dialog" data-width="1000"  
		   					data-height="600" data-id="dialog-mask" data-mask="true">生成分期</a> --%>
		   			<a href="javascript:;" class="btn btn-blue project" title="选择本项" onclick="formProject(this)" data-icon="check" data-value='${obj.id}'>选择</a>
		   		</td>
	    		
	    	</tr>
    	</c:forEach>
    	</tbody>
    </table>
</c:if>
</div>
<c:if test="${not empty projectList }">
	<%@ include file="/WEB-INF/jsp/common/pageFooter.jsp" %>
</c:if>
<script>
	function formProject(obj) {
		$(this).navtab({ url:'<%=request.getContextPath()%>/toolbox/projectperiod/getperiodfield.do?id='+$(obj).attr("data-value"), title:'项目分期计算器'});
		$(this).dialog("closeCurrent");
		$(this).navtab("refresh");
	}
</script>

