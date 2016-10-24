<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 
项目还款查询
 -->
<div class="bjui-pageHeader" id="prolist-repay-query-search">
    <form id="pagerForm" data-toggle="ajaxsearch" action="<%=request.getContextPath()%>/debt/proclaims/repay/list.do" method="post">
        <input type="hidden" name="pageSize" value="${pageSize}">
        <div class="bjui-searchBar">
			<%@ include file="/WEB-INF/jsp/pro/debt/repay/search_itembase.jsp" %>
            <button type="button" class="showMoreSearch" data-toggle="moresearch" data-name="custom2">
            	<i class="fa fa-angle-double-down"></i></button>
            <button type="submit" class="btn-default" data-icon="search" data-clear-query="false">查询</button>
            <a class="btn btn-default" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">重置查询</a>
        </div>
        <div class="bjui-moreSearch">
			<%@ include file="/WEB-INF/jsp/pro/debt/repay/search_itemext.jsp" %>
        </div>
    </form>
</div>

<div class="bjui-pageContent"  id="prolist-repay-query">
	
    <table data-toggle="tablefixed" data-width="100%" >
    	<thead>
    	<tr>
    		<th align="center" width="18%">项目信息</th>
    		<th align="center" width="18%">融资方信息</th>
    		<th align="center" width="16%">项目融资信息</th>
    		<th align="center" width="15%">应还情况</th>
    		<th align="center" width="15%">实还情况</th>
    		<th align="center" width="8%">还款状态</th>
    		<th align="center" width="10%">操作</th>
    	</tr>
    	</thead>
    	<tbody>
    	<c:forEach var="list" items="${list}">
    	<tr>
    		<td>编号：<a href="<%=request.getContextPath()%>/debt/proissue/proinfo/view.do?id=${list.projectId}" 
    				data-toggle="dialog" data-width="1000"  data-height="600" data-id="dialog-mask" 
    				data-mask="true" >${list.projectCode}</a><br />
    			<span class="text-tit pull-left">名称：</span><a href="<%=request.getContextPath()%>/debt/proissue/proinfo/view.do?id=${list.projectId}" 
    				data-toggle="dialog" data-width="1000"  data-height="600" data-id="dialog-mask" 
    				data-mask="true" class="text-omit pull-left">${list.projectName}</a>
    		</td>
    		<td>
    			<span class="text-tit pull-left">融资方：</span><a title="${list.loanUserName}" href="<%=request.getContextPath()%>/user/view.do?id=${list.loanUserId}" 
    				data-toggle="dialog" data-width="800"  data-height="600" data-id="dialog-mask" 
    				data-mask="true" class="text-omit pull-left">${list.loanUserName}</a><br />
    			<span class="text-tit pull-left">融资顾问：</span><a href="<%=request.getContextPath()%>/user/view.do?id=${list.memeberId}" 
    				data-toggle="dialog" data-width="1000"  data-height="600" data-id="dialog-mask" 
    				data-mask="true" class="text-omit pull-left">${list.memberName}</a>
    		</td>
    		<td>
			融资金额：<fmt:formatNumber value="${list.projectMoney}" pattern="0.00"/>元<br />
			投资收益率(年化)：<fmt:formatNumber value="${list.investProfit*100}" pattern="0.00"/>% <br />
			项目周期：${list.projectLimit}<c:if test="${list.projectLimitTypeId==1}">天</c:if><c:if test="${list.projectLimitTypeId==2}">月</c:if><c:if test="${list.projectLimitTypeId==3}">年</c:if><br />
			还款方式：<c:forEach var="item" items="${systypeRepayList}"><c:if test="${list.repayTypeId==item.id}">${item.repayTypeName}</c:if></c:forEach><br />
			</td>
    		<td>
    		应还期数:${list.periodNumber}<br />
    		应还日期:<fmt:formatDate value="${list.planRepayDate}" pattern="yyyy-MM-dd"/><br />
    		应还金额:<fmt:formatNumber value="${list.principal+list.interest+list.overInterest}" pattern="0.00"/>元</td>
    		<td>
    		还款日期:<fmt:formatDate value="${list.lastRepayTime}" pattern="yyyy-MM-dd"/><br />
    		还款金额:<fmt:formatNumber value="${list.paidPrincipal+list.paidInterest+list.paidOverInterest}" pattern="0.00"/>元<br />
    		</td>
    		<td align="center"><c:forEach var="item" items="${repayStatusDesc}"><c:if test="${item.value==list.repayStatus}">${item}</c:if></c:forEach></td>
    		<td>
    			<a href="<%=request.getContextPath()%>/debt/proclaims/repay/planlist.do?projectId=${list.projectId}" 
    				data-toggle="dialog" data-width="1000"  
    				data-height="600" data-id="dialog-mask" data-mask="true">还款计划</a>
    			<a href="<%=request.getContextPath()%>/debt/proclaims/repay/repaylist.do?projectId=${list.projectId}" 
    				data-toggle="dialog" data-width="1000"  
    				data-height="600" data-id="dialog-mask" data-mask="true">扣款记录</a>
    		</td>
    	</tr>
    	</c:forEach>
    	</tbody>
    </table>
</div>
<%@ include file="/WEB-INF/jsp/common/pageFooter.jsp" %>
