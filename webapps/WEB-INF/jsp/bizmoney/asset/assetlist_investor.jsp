<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 投资者资产列表 -->
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="<%=request.getContextPath()%>/bizmoney/asset/investorlist.do" method="post">
        <input type="hidden" name="pageSize" value="${pageSize }">
        <div class="bjui-searchBar">
        	<label>项目编号：</label><input type="text" name="projectCode" value="<c:out value='${search.projectCode }'/>" class="form-control" size="10" data-rule="integer"/>
            <label>项目名称：</label><input type="text" name="projectName" value="<c:out value='${search.projectName }'/>" class="form-control" size="20"/>
        	<label>投资者：</label><input type="text" name="userName" value="<c:out value='${search.userName }'/>" class="form-control" size="10"/>
            <button type="submit" class="btn-default" data-icon="search" data-clear-query="false">查询</button>
            <a class="btn btn-default" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">重置查询</a>
        </div>
    </form>
</div>
<div class="bjui-pageContent">
    <table data-toggle="tablefixed" data-width="100%" >
    	<thead>
    	<tr>
    		<th align="center" width="13%">投资者信息</th>
    		<th align="center" width="16%">项目信息</th>
    		<th align="center" width="8%">资产日期</th>
    		<th align="center" width="12%">投资本金</th>
    		<th align="center" width="11%">预期利息</th>
    		<th align="center" width="12%">未还本金</th>
    		<th align="center" width="10%">已付收益</th>
    		<th align="center" width="10%">未付收益</th>
    		<th align="center" width="8%">到期日</th>
    	</tr>
    	</thead>
    	<tbody>
    	<c:forEach var="list" items="${list}">
    	<tr>
    	<td><a href="<%=request.getContextPath()%>/user/view.do?id=${list.userId}&userType=1" 
    				data-toggle="dialog" data-width="1000"  data-height="600" data-id="dialog-mask" 
    				data-mask="true" >${list.showName() }</a>
    	</td>
		<td>项目编号：${list.projectCode }<br />
    		<span class="text-tit pull-left">项目名称：</span>
			<c:choose>
    		<c:when test="${list.productTypeId==1 }">
    		<a href="<%=request.getContextPath()%>/debt/proissue/proinfo/view.do?id=${list.projectId}" 
    				data-toggle="dialog" data-width="1000"  data-height="600" data-id="dialog-mask" 
    				data-mask="true" class="text-omit pull-left">${list.projectName}</a>
    		</c:when>
    		<c:when test="${list.productTypeId==2 }">
    		<a href="<%=request.getContextPath()%>/fasset/proissue/proinfo/view.do?id=${list.projectId}" 
	    				data-toggle="dialog" data-width="1000"  data-height="600" data-id="dialog-mask" 
	    				data-mask="true" class="text-omit pull-left">${list.projectName }</a>
    		</c:when>
    		<c:when test="${list.productTypeId==3 }">
    		<a href="<%=request.getContextPath()%>/incomeright/proinfo/view.do?id=${list.projectId}" 
	    				data-toggle="dialog" data-width="1000"  data-height="600" data-id="dialog-mask" 
	    				data-mask="true" class="text-omit pull-left">${list.projectName }</a>
    		</c:when>
    		<c:otherwise>
    		${list.projectName }
    		</c:otherwise>		
    		</c:choose>
    		</td>
    	<td align="center"><fmt:formatDate value="${list.assetDate }" pattern="yyyy-MM-dd"/></td>
    	<td><fmt:formatNumber value="${list.assetPrincipal }" pattern="0.00"/>元</td>
    	<td><fmt:formatNumber value="${list.expectedIncome }" pattern="0.00"/>元</td>
    	<td><fmt:formatNumber value="${list.assetBal }" pattern="0.00"/>元</td>
    	<td><fmt:formatNumber value="${list.paidIncome }" pattern="0.00"/>元</td>
    	<td><c:choose><c:when test="${list.unPaidIncome>0 }"><fmt:formatNumber value="${list.unPaidIncome }" pattern="0.00"/></c:when><c:otherwise>0.00</c:otherwise></c:choose>元</td>
    	<td align="center"><fmt:formatDate value="${list.expireDate }" pattern="yyyy-MM-dd"/></td>
    	</tr>
    	</c:forEach>
    	</tbody>
    </table>
</div>
<%@ include file="/WEB-INF/jsp/common/pageFooter.jsp" %>
