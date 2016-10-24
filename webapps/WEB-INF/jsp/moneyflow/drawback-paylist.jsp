<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 
投资者者退款明细
 -->
<div class="bjui-pageHeader" id="apply-paylist-search">
    <form id="pagerForm" data-toggle="ajaxsearch" action="<%=request.getContextPath()%>/moneyflow/drawbacklist.do" method="post">
        <input type="hidden" name="pageSize" value="${pageSize}">
        <div class="bjui-searchBar">
            <label>项目编号：</label><input type="text" name="projectCode" value="<c:out value='${search.projectCode}'/>" class="form-control" size="10" data-rule="integer"/>
           	<label>项目名称：</label><input type="text" name="projectName" value="<c:out value='${search.projectName}'/>" class="form-control" size="20" />
            <label>投资者：</label><input type="text" name="orderUserName" value="<c:out value='${search.orderUserName}'/>" class="form-control" size="10" />
            <button type="submit" class="btn-default" data-icon="search" data-clear-query="false">查询</button>
            <a class="btn btn-default" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">重置查询</a>
        </div>
    </form>
</div>
<div class="bjui-pageContent" id="apply-paylist-search">
        <table data-toggle="tablefixed" data-width="100%">
    	<thead>
    	<tr>
    		<th align="center" width="28%">项目信息</th>
    		<th align="center" width="22%">投资者名称</th>
    		<th align="center" width="18%">退款金额(元)</th>
    		<th align="center" width="14%">退款状态</th>
    		<th align="center" width="18%">退款时间</th>
    	</tr>
    	</thead>
    	<tbody>
    	<c:forEach var="list" items="${list}">
    	<tr>
		<td>项目编号：${list.projectCode }<br />
    		<span class="text-tit pull-left">项目名称：</span><a href="<%=request.getContextPath()%>/moneyflow/getprojectinfo.do?id=${list.projectId}" 
    				data-toggle="dialog" data-width="1000"  data-height="600" data-id="dialog-mask" 
    				data-mask="true" class="text-omit pull-left">${list.projectName }</a>
    		</td>
    		<td>${list.showName() }</td>
    		<td><fmt:formatNumber value="${list.refundMoney }" pattern="0.00"/></td>
    		<td align="center">${list.getRefundStatusDesc() }</td>
    		<td align="center"><fmt:formatDate value="${list.refundCfmTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
    	</tr>
    	</c:forEach>
    	</tbody>
    </table>
</div>
<%@ include file="/WEB-INF/jsp/common/pageFooter.jsp" %>
