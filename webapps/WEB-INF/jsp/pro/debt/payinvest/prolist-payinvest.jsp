<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 
项目兑付管理：兑付投资者
 -->
<div class="bjui-pageHeader" id="prolist-payinvest-search">
    <form id="pagerForm" data-toggle="ajaxsearch" action="<%=request.getContextPath()%>/debt/proclaims/payinvest/recentlylist.do" method="post">
         <input type="hidden" name="pageSize" value="${pageSize}">
        <div class="bjui-searchBar">
			<%@ include file="/WEB-INF/jsp/pro/debt/payinvest/search_itembase.jsp" %>
            <button type="submit" class="btn-default" data-icon="search" data-clear-query="false">查询</button>
            <a class="btn btn-default" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">重置查询</a>
        </div>
    </form>
</div>

<div class="bjui-pageContent"  id="prolist-payinvest">
    <table data-toggle="tablefixed" data-width="100%">
    	<thead>
    	<tr>
    		<th align="center" width="18%">项目信息</th>
    		<th align="center" width="18%">融资方信息</th>
    		<th align="center" width="17%">项目融资信息</th>
    		<th align="center" width="17%">应兑情况</th>
    		<th align="center" width="17%">实兑情况</th>
    		<th align="center" width="6%">兑付状态</th>
    		<th align="center" width="9%">操作</th>
    	</tr>
    	</thead>
    	<tbody>
    	<c:forEach var="list" items="${list}">
    	<tr>
    		<td>编号：<a href="<%=request.getContextPath()%>/debt/proissue/proinfo/view.do?id=${list.projectId}" 
    				data-toggle="dialog" data-width="1000"  data-height="600" data-id="dialog-mask" 
    				data-mask="true">${list.projectCode}</a><br />
    			<span class="text-tit pull-left">名称：</span><a href="<%=request.getContextPath()%>/debt/proissue/proinfo/view.do?id=${list.projectId}" 
    				data-toggle="dialog" data-width="1000"  data-height="600" data-id="dialog-mask" 
    				data-mask="true" class="text-omit pull-left">${list.projectName}</a>
    		</td>
			<td>
				<span class="text-tit pull-left">融资顾问：</span><a href="<%=request.getContextPath()%>/user/view.do?id=${list.memeberId}" 
    				data-toggle="dialog" data-width="1000"  data-height="600" data-id="dialog-mask" 
    				data-mask="true" class="text-omit pull-left">${list.memberName}</a><br />
    			<span class="text-tit pull-left">融资方：</span><a title="${list.loanUserName}" href="<%=request.getContextPath()%>/user/view.do?id=${list.loanUserId}" 
    				data-toggle="dialog" data-width="800"  data-height="600" data-id="dialog-mask" 
    				data-mask="true" class="text-omit pull-left">${list.loanUserName}</a>
    		</td>
    		<td>
			融资金额：<fmt:formatNumber value="${list.projectMoney}" pattern="0.00"/>元<br />
			投资收益率(年化)：<fmt:formatNumber value="${list.investProfit*100}" pattern="0.00"/>% <br />
			项目周期：${list.projectLimit}<c:if test="${list.projectLimitTypeId==1}">天</c:if><c:if test="${list.projectLimitTypeId==2}">月</c:if><c:if test="${list.projectLimitTypeId==3}">年</c:if><br />
			还款方式：<c:forEach var="item" items="${systypeRepayList}"><c:if test="${list.repayTypeId==item.id}">${item.repayTypeName}</c:if></c:forEach><br />
			</td>
    		<td>
    		应兑期数:${list.periodNumber}<br />
    		应兑日期:<fmt:formatDate value="${list.payInvestDate}" pattern="yyyy-MM-dd"/><br />
    		应兑金额:<fmt:formatNumber value="${list.investPrincipal+list.investInterest+list.investOverInterest}" pattern="0.00" />元<br />
    		融资方已还：<fmt:formatNumber value="${list.paidPrincipal+list.paidInterest+list.paidOverInterest}" pattern="0.00"/>元
    		</td>
    		<td>
    		兑付日期:<fmt:formatDate value="${list.lastPayInvestTime}" pattern="yyyy-MM-dd"/><br />
    		兑付金额:<fmt:formatNumber value="${list.paidInvestPrincipal+list.paidInvestInterest+list.paidInvestOverInterest}" pattern="0.00"/>元<br />
    		</td>
    		<td align="center"><c:forEach var="item" items="${payInvestStatusDesc}"><c:if test="${item.value==list.payInvestStatus}">${item}</c:if></c:forEach></td>
    		<td>
    			<c:if test="${list.canPayInvest()}">
    			<c:choose>
    				<c:when test="${list.paidFailNum>0 && powerlist.contains('/debt/proclaims/payinvest/payfailedindex.do')}">
    				<a href="<%=request.getContextPath()%>/debt/proclaims/payinvest/payfailedindex.do?repayPlanId=${list.id}" 
    				class="btn btn-blue" data-toggle="dialog" data-width="1000"  
    				data-height="600" data-id="dialog-mask" data-mask="true">失败兑付</a><br/>
    				</c:when>
    				<c:otherwise>
    				<c:if test="${powerlist.contains('/debt/proclaims/payinvest/payindex.do') }">
	    			<a href="<%=request.getContextPath()%>/debt/proclaims/payinvest/payindex.do?repayPlanId=${list.id}" 
	    				class="btn btn-blue" data-toggle="dialog" data-width="1000"  
	    				data-height="600" data-id="dialog-mask" data-mask="true">兑付划款</a><br/>
	    			</c:if>
	    			</c:otherwise>
    			</c:choose>
	    		</c:if>	
    		    <a href="<%=request.getContextPath()%>/debt/proclaims/payinvest/planlist.do?projectId=${list.projectId}" 
    				data-toggle="dialog" data-width="1000"  
    				data-height="600" data-id="dialog-mask" data-mask="true">兑付计划列表</a><br/>
    			<a href="<%=request.getContextPath()%>/debt/proclaims/payinvest/plandetail.do?projectId=${list.projectId}&periodNumber=${list.periodNumber}" 
    				data-toggle="dialog" data-width="1000"  
    				data-height="600" data-id="dialog-mask" data-mask="true">兑付投资者明细</a><br/>
    			<a href="<%=request.getContextPath()%>/debt/proclaims/payinvest/paylist.do?projectId=${list.projectId}&periodNumber=${list.periodNumber}" 
    				data-toggle="dialog" data-width="1000"  
    				data-height="600" data-id="dialog-mask" data-mask="true">兑付划款明细</a>
    		</td>
    	</tr>
    	</c:forEach>
    	</tbody>
    </table>
</div>
<%@ include file="/WEB-INF/jsp/common/pageFooter.jsp" %>
