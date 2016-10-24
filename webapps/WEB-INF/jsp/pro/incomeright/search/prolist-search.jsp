<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 
项目综合查询
 -->
<div class="bjui-pageHeader" id="prolist-search-search">
    <form id="pagerForm" data-toggle="ajaxsearch" action="<%=request.getContextPath()%>/incomeright/prosearch/search.do" method="post">
        <input type="hidden" name="pageSize" value="${pageSize}">
        <div class="bjui-searchBar">
			<%@ include file="/WEB-INF/jsp/pro/incomeright/search/search_itembase.jsp" %>
            <button type="button" class="showMoreSearch" data-toggle="moresearch" data-name="custom2">
            	<i class="fa fa-angle-double-down"></i></button>
            <button type="submit" class="btn-default" data-icon="search" data-clear-query="false">查询</button>
            <a class="btn btn-default" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">重置查询</a>
        </div>
        <div class="bjui-moreSearch">
			<%@ include file="/WEB-INF/jsp/pro/incomeright/search/search_itemext.jsp" %>
        </div>
    </form>
</div>

<div class="bjui-pageContent"  id="prolist-search-list">
    <table data-toggle="tablefixed" data-width="100%">
    	<thead>
    	<tr>
    		<th align="center" width="16%">产品名称</th>
    		<th align="center" width="16%">发行人信息</th>
    		<th align="center" width="16%">产品基本信息</th>
    		<th align="center" width="20%">时间相关</th>
    		<th align="center" width="16%">融资情况</th>
    		<th align="center" width="8%">产品状态</th>
    		<th align="center" width="8%">操作</th>
    	</tr>
    	</thead>
    	<tbody>
    	<c:forEach var="list" items="${list}">
    	<tr>
		<td>
			代码：<a href="<%=request.getContextPath()%>/incomeright/proinfo/view.do?id=${list.id}" 
	    				data-toggle="dialog" data-width="1000"  data-height="600" data-id="dialog-mask" 
	    				data-mask="true" >${list.projectCode }</a><br/>
    		<span class="text-tit pull-left">名称：</span><a href="<%=request.getContextPath()%>/incomeright/proinfo/view.do?id=${list.id}" 
    				data-toggle="dialog" data-width="1000"  data-height="600" data-id="dialog-mask" 
    				data-mask="true" class="text-omit pull-left">${list.projectName}</a>
    		</td>
    		<td><a href="<%=request.getContextPath()%>/user/view.do?id=${list.loanUserId}" 
    				data-toggle="dialog" data-width="800"  data-height="600" data-id="dialog-mask" 
    				data-mask="true" >${list.loanUserName}</a></td>
    		<td>挂牌规模：<fmt:formatNumber value="${list.projectMoney}" pattern="0.00"/>元<br />
    		预期年化收益率：<fmt:formatNumber value="${list.investProfit*100}"  pattern="0.00"/>%<br />
    		产品期限：${list.projectLimit}<c:if test="${list.projectLimitTypeId==1}">天</c:if><c:if test="${list.projectLimitTypeId==2}">月</c:if><c:if test="${list.projectLimitTypeId==3}">年</c:if><br />
    		还款方式：<c:forEach var="item" items="${systypeRepayList}"><c:if test="${list.repayTypeId==item.id}">${item.repayTypeName}</c:if></c:forEach></td>
    		<td>
    		创建时间：<fmt:formatDate value="${list.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/><br />
    		发布时间：<fmt:formatDate value="${list.publishTime}" pattern="yyyy-MM-dd HH:mm:ss"/><br />
    		认购开始：<fmt:formatDate value="${list.buyTimeStart}" pattern="yyyy-MM-dd HH:mm:ss"/><br />
    		募集结束：<fmt:formatDate value="${list.buyTimeEnd}" pattern="yyyy-MM-dd HH:mm:ss"/><br />
    		核保时间：<fmt:formatDate value="${list.cfmRightTime}" pattern="yyyy-MM-dd HH:mm:ss"/><br />
    		放款时间：<fmt:formatDate value="${list.releaseMoneyTime}" pattern="yyyy-MM-dd HH:mm:ss"/><br />
    		</td>
    		<td>
    		确权金额：<fmt:formatNumber value="${list.cfmRightMoney}" pattern="0.00"/>元<br />
    		放款金额：<fmt:formatNumber value="${list.cfmRightMoney-list.fee}" pattern="0.00"/>元<br />
    		融资费用：<fmt:formatNumber value="${list.fee}" pattern="0.00"/>元<br />
    		</td>
    		<td align="center"><c:forEach var="item" items="${projectStatusDesc}"><c:if test="${item.value==list.projectStatus}">${item}</c:if></c:forEach></td>
    		<td align="center">
    			<a href="<%=request.getContextPath()%>/debt/orderapply/list.do?projectId=${list.id}" 
    				data-toggle="dialog" data-width="1000"  
    				data-height="600" data-id="dialog-mask" data-mask="true">认购详情</a><br >
    			<c:if test="${list.projectStatus == 10 || list.projectStatus == -1 || list.projectStatus == -2}">
	    			<a href="<%=request.getContextPath()%>/incomeright/proinfo/cfmrightinfo.do?projectId=${list.id}" 
	    				data-toggle="dialog" data-width="1000"  
	    				data-height="600" data-id="dialog-mask" data-mask="true">核保结果</a><br >
	    			<c:if test="${list.projectStatus == 10 && list.manageDuration == 1}">
	    			<a href="<%=request.getContextPath()%>/incomeright/proclaims/repay/planlist.do?projectId=${list.id}" 
	    				data-toggle="dialog" data-width="1000"  
	    				data-height="600" data-id="dialog-mask" data-mask="true">还款计划</a><br >
	    			<a href="<%=request.getContextPath()%>/incomeright/proclaims/payinvest/planlist.do?projectId=${list.id}" 
	    				data-toggle="dialog" data-width="1000"  
	    				data-height="600" data-id="dialog-mask" data-mask="true">兑付计划</a>
	    			</c:if>
    			</c:if>
    		</td>
    	</tr>
    	</c:forEach>
    	</tbody>
    </table>
</div>
<%@ include file="/WEB-INF/jsp/common/pageFooter.jsp" %>
