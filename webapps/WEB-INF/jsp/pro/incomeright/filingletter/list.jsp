<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 
备案函列表
 -->
<div class="bjui-pageHeader" id="prolist-search-search">
    <form id="pagerForm" data-toggle="ajaxsearch" action="<%=request.getContextPath()%>/income/filingletter/list.do" method="post">
        <div class="bjui-searchBar">
        	<label>备案代码：</label>
			<input type="text" name="recordCode" value="<c:out value='${search.recordCode}'/>" class="form-control" size="10" data-rule="integer"/>
			<label>备案名称：</label>
			<input type="text" name="recordName" value="<c:out value='${search.recordName}'/>" class="form-control" size="15" />
			<label>融资方：</label>
			<input type="text" name="loanUserName" value="<c:out value='${search.loanUserName}'/>" class="form-control" size="15" />
             <button type="button" class="showMoreSearch" data-toggle="moresearch" data-name="custom2">
            	<i class="fa fa-angle-double-down"></i></button>
            <button type="submit" class="btn-default" data-icon="search" data-clear-query="false">查询</button>
            <a class="btn btn-default" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">重置查询</a>
        </div>
        <div class="bjui-moreSearch">
				<label>更新时间：</label>
				<input type="text" name="updateTimeBegin" value="${search.updateTimeBegin }" class="form-control" size="10" data-toggle="datepicker"
				data-pattern="yyyy-MM-dd" data-nobtn="true" data-rule="date"/>
				<label>-</label>
				<input type="text" name="updateTimeEnd" value="${search.updateTimeEnd }" class="form-control" size="10" data-toggle="datepicker"
				data-pattern="yyyy-MM-dd" data-nobtn="true" data-rule="date"/>
        </div>
    </form>
</div>

<div class="bjui-pageContent"  id="prolist-search-list">
    <table data-toggle="tablefixed" data-width="100%">
    	<thead>
    	<tr>
    		<th align="center" width="8%">备案代码</th>
    		<th align="center" width="24%">备案名称</th>
    		<th align="center">融资方</th>
    		<th align="center" width="14%">拟融资规模(元)</th>
    		<th align="center" width="16%">创建时间</th>
    		<th align="center" width="16%">更新时间</th>
    		<th align="center" width="12%">备案确认函</th>
    	</tr>
    	</thead>
    	<tbody>
    	<c:forEach var="list" items="${list}">
    	<tr>
			<td>
    			<a href="<%=request.getContextPath()%>/incomeright/recordinfo/view.do?id=${list.id}" 
    				data-toggle="dialog" data-width="1000"  data-height="600" data-id="dialog-mask" 
    				data-mask="true" >${list.recordCode}</a>
    		</td>
    		<td>
    			<a href="<%=request.getContextPath()%>/incomeright/recordinfo/view.do?id=${list.id}" 
    				data-toggle="dialog" data-width="1000"  data-height="600" data-id="dialog-mask" 
    				data-mask="true"  class="text-omit pull-left">${list.recordName}</a>
    		</td>
			<td>
			<a href="<%=request.getContextPath()%>/user/view.do?id=${list.loanUserId}" 
    				data-toggle="dialog" data-width="800"  data-height="600" data-id="dialog-mask" 
    				data-mask="true" >${list.loanUserName}</a>
    		</td>
    		<td>
    			<fmt:formatNumber value="${list.projectMoney}"/>
    		</td>
    		<td>
    			<fmt:formatDate value="${list.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
    		</td>
    		<td>
    			<fmt:formatDate value="${list.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
    		</td>
    		<td>
    			<a href="<%=request.getContextPath()%>/income/filingletter/downletter.do?id=${list.id}" 
	   				class="btn btn-blue">下载</a>
	   			<a target="_blank" href="<%=request.getContextPath()%>/income/filingletter/printletter.do?id=${list.id}" 
	   				class="btn btn-blue" >预览</a>
    		</td>
    	</tr>
    	</c:forEach>
    	</tbody>
    </table>
</div>
<%@ include file="/WEB-INF/jsp/common/pageFooter.jsp" %>
