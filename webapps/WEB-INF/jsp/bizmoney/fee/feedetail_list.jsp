<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 费用明细列表 -->
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="<%=request.getContextPath()%>/bizmoney/fee/feedetail_list.do" method="post">
       <input type="hidden" name="id" value="${search.id}">
        <div class="bjui-searchBar"> 
        	 <label>归集状态：</label>
          	 <select name="gatherStatus" data-toggle="selectpicker" class="show-tick" style="display: none;" size="10">
				<option value="">-全部-</option>
				<c:forEach var="item" items="${gatherStatusDesc}" >
					<option value="${item.status}" <c:if test="${search.gatherStatus==item.status }">selected</c:if>>${item}</option>
				</c:forEach> 
			</select>
            <button type="submit" class="btn-default" data-icon="search" data-clear-query="false">查询</button>
            <a class="btn btn-default" href="javascript:;" data-toggle="reloadsearch"  data-clear-query="true" data-icon="undo">重置查询</a>
        </div>
    </form>
</div>
<div class="bjui-pageContent">
    <table data-toggle="tablefixed" data-width="100%">
    	<thead>
    	<tr>
    		<th align="center">编号</th>
    		<th align="center">会员id</th>
    		<th align="center">项目id</th>
    		<th align="center">费用金额</th>
    		<th align="center">归集状态</th>
    		<th align="center">归集时间</th>
    	</tr>
    	</thead>
    	<tbody>
    	<c:forEach var="obj" items="${list}">
    	<tr>
    		<td>${obj.id }</td>
    		<td>${obj.userId}</td>
    		<td>${obj.projectId}</td>
    		<td><fmt:formatNumber value="${obj.feeAmount }" pattern="0.00"/>元</td>
    		<td>${obj.getGatherStatusDesc() }</td>
    		<td><fmt:formatDate value="${obj.gatherTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
    	</tr>
    	</c:forEach>
    	</tbody>
    </table>
</div>
<%@ include file="/WEB-INF/jsp/common/pageFooter.jsp" %>
