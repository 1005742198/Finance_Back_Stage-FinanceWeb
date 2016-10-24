<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 
项目综合查询
 -->
<div class="bjui-pageHeader" id="prolist-search-search">
    <form id="pagerForm" data-toggle="ajaxsearch" action="<%=request.getContextPath()%>/debt/prosearch/search.do" method="post">
        <input type="hidden" name="pageSize" value="${pageSize}">
        <div class="bjui-searchBar">
			<%@ include file="/WEB-INF/jsp/pro/debt/search/search_itembase.jsp" %>
            <button type="button" class="showMoreSearch" data-toggle="moresearch" data-name="custom2">
            	<i class="fa fa-angle-double-down"></i></button>
            <button type="submit" class="btn-default" data-icon="search" data-clear-query="false">查询</button>
            <a class="btn btn-default" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">重置查询</a>
        </div>
        <div class="bjui-moreSearch">
			<%@ include file="/WEB-INF/jsp/pro/debt/search/search_itemext.jsp" %>
        </div>
    </form>
</div>

<div class="bjui-pageContent"  id="prolist-search-list">
    <table data-toggle="tablefixed" data-width="100%">
    	<thead>
    	<tr>
    		<th align="center" width="14%">项目信息</th>
    		<th align="center" width="14%">融资方信息</th>
    		<th align="center" width="16%">融资信息</th>
    		<th align="center" width="20%">时间相关</th>
    		<th align="center" width="16%">融资情况</th>
    		<th align="center" width="6%">项目状态</th>
    		<th align="center" width="6%">结算状态</th>
    		<th align="center" width="8%">操作</th>
    	</tr>
    	</thead>
    	<tbody>
    	<c:forEach var="list" items="${list}">
    	<tr>
		<td>编号：${list.projectCode}<br />
    		<span class="text-tit pull-left">名称：</span><a href="<%=request.getContextPath()%>/debt/proissue/proinfo/view.do?id=${list.id}" 
    				data-toggle="dialog" data-width="1000"  data-height="600" data-id="dialog-mask" 
    				data-mask="true" class="text-omit pull-left">${list.projectName}</a>
    		</td>
			<td>
				<span class="text-tit pull-left">融资顾问：</span><a href="<%=request.getContextPath()%>/user/view.do?id=${list.memberId}" 
			    				data-toggle="dialog" data-width="1000"  data-height="600" data-id="dialog-mask" 
			    				data-mask="true" class="text-omit pull-left">${list.memberName}</a><br />
			<span class="text-tit pull-left">融资方：</span><a href="<%=request.getContextPath()%>/user/view.do?id=${list.loanUserId}" 
    				data-toggle="dialog" data-width="800"  data-height="600" data-id="dialog-mask" 
    				data-mask="true" class="text-omit pull-left">${list.loanUserName}</a>
    		</td>
    		<td>
			预融资额：<fmt:formatNumber value="${list.projectMoney}" pattern="0.00"/>元<br />
			投资收益率：<fmt:formatNumber value="${list.investProfit*100}" pattern="0.00"/>% <br />
			项目周期：${list.projectLimit}<c:if test="${list.projectLimitTypeId==1}">天</c:if><c:if test="${list.projectLimitTypeId==2}">月</c:if><c:if test="${list.projectLimitTypeId==3}">年</c:if><br />
			还款方式：<c:forEach var="item" items="${systypeRepayList}"><c:if test="${item.id==list.repayTypeId}">${item.repayTypeName}</c:if></c:forEach><br />
			</td>
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
    		<td align="center" ><c:forEach var="item" items="${projectStatusDesc}"><c:if test="${item.value==list.projectStatus}">${item}</c:if></c:forEach></td>
    		<td align="center" >
    		${list.getSettleStatusDesc() }
    		</td>
    		<td align="center" >
    			<a href="<%=request.getContextPath()%>/debt/orderapply/list.do?projectId=${list.id}" 
    				data-toggle="dialog" data-width="1000"  
    				data-height="600" data-id="dialog-mask" data-mask="true">认购详情</a><br >
    			<c:if test="${list.projectStatus == 10 || list.projectStatus == -1 || list.projectStatus == -2}">
	    			<a href="<%=request.getContextPath()%>/debt/proissue/proinfo/cfmrightinfo.do?projectId=${list.id}" 
	    				data-toggle="dialog" data-width="1000"  
	    				data-height="600" data-id="dialog-mask" data-mask="true">核保结果</a><br >
	    		<c:if test="${list.projectStatus == 10}">
	    			<a href="<%=request.getContextPath()%>/debt/proclaims/repay/planlist.do?projectId=${list.id}" 
	    				data-toggle="dialog" data-width="1000"  
	    				data-height="600" data-id="dialog-mask" data-mask="true">还款计划</a><br >
	    			<a href="<%=request.getContextPath()%>/debt/proclaims/payinvest/planlist.do?projectId=${list.id}" 
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
