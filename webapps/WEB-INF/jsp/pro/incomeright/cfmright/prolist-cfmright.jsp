<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
function afterToCfmright(json){
	if(json.statusCode != 200)
		$(this).alertmsg("error", json.message);
}
function afterChangeStatus(json){
	if(json.statusCode == 200){
		$(this).alertmsg("correct", json.message);
	}else{
		$(this).alertmsg("error", json.message);
	}
}
function closeImportTrade(){
	$(this).navtab("refresh");
}
</script>
<!-- 项目交易审核/确权管理 -->
<div class="bjui-pageHeader" id="prolist-issue-search">
    <form id="pagerForm" data-toggle="ajaxsearch" action="<%=request.getContextPath()%>/incomeright/cfmright/prolist.do" method="post">
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

<div class="bjui-pageContent" id="prolist-issue-list">
    <table data-toggle="tablefixed" data-width="100%">
    	<thead>
    	<tr>
			<th align="center" width="15%">产品名称</th>
    		<th align="center" width="15%">发行人信息</th>
    		<th align="center" width="16%">产品基本信息</th>
    		<th align="center" width="20%">发布/认购时间</th>
    		<th align="center" width="16%">资金募集情况</th>
    		<th align="center" width="8%">项目状态</th>
    		<th align="center" width="10%">执行审核</th>
    	</tr>
    	</thead>
    	<tbody>
    	<c:forEach var="obj" items="${list}">
	    	<tr>
	    	<td>编号：<a href="<%=request.getContextPath()%>/incomeright/proinfo/view.do?id=${obj.id}" 
	    				data-toggle="dialog" data-width="1000"  data-height="600" data-id="dialog-mask" 
	    				data-mask="true" >${obj.projectCode }</a><br/>
    			<span class="text-tit pull-left">名称：</span><a href="<%=request.getContextPath()%>/incomeright/proinfo/view.do?id=${obj.id}" 
    				data-toggle="dialog" data-width="1000"  data-height="600" data-id="dialog-mask" 
    				data-mask="true" class="text-omit pull-left">${obj.projectName}</a>
    		</td>
    		<td><a href="<%=request.getContextPath()%>/user/view.do?id=${obj.loanUserId}" 
    				data-toggle="dialog" data-width="800"  data-height="600" data-id="dialog-mask" 
    				data-mask="true" >${obj.loanUserName}</a></td>
    		<td>预融资额：<fmt:formatNumber value="${obj.projectMoney}" pattern="0.00"/>元<br />投资收益率：<fmt:formatNumber value="${obj.investProfit*100}"  pattern="0.00"/>%
    		 <br />产品周期：${obj.projectLimit}<c:if test="${obj.projectLimitTypeId==1}">天</c:if><c:if test="${obj.projectLimitTypeId==2}">月</c:if><c:if test="${obj.projectLimitTypeId==3}">年</c:if><br />还款方式：<c:forEach var="item" items="${systypeRepayList}"><c:if test="${obj.repayTypeId==item.id}">${item.repayTypeName}</c:if></c:forEach></td>
    		 <td>
	    		产品发布：<fmt:formatDate value="${obj.publishTime }" pattern="yyyy-MM-dd HH:mm:ss"/><br />
	    		认购开始：<fmt:formatDate value="${obj.buyTimeStart }" pattern="yyyy-MM-dd HH:mm:ss"/><br />
	    		认购结束：<fmt:formatDate value="${obj.buyTimeEnd }" pattern="yyyy-MM-dd HH:mm:ss"/>
	    		</td>
	    		<td>
	    		已募资金：<fmt:formatNumber value="${obj.raiseMoney}" pattern="0.00"/>  元<br />
	    		募集比例：<fmt:formatNumber value="${obj.raiseMoney*100/obj.projectMoney}" pattern="0.00"/>%<br />
	    		</td>
	    		<td align="center">${obj.getProStatusDesc() }</td>
	    		<td>
		    		<c:if test="${powerlist.contains('/incomeright/cfmright/startbuy.do') && obj.isPurchase() }">
			    		<a href="<%=request.getContextPath()%>/incomeright/cfmright/startbuy.do?projectId=${obj.id}" 
		    				class="btn btn-blue" data-toggle="doajax" data-mask="true"
		    				data-callback="afterChangeStatus()" data-confirm-msg="确定要启动认购？">立即启动认购</a><br/>
			    	</c:if>
		    		<c:if test="${powerlist.contains('/incomeright/cfmright/endbuy.do') && obj.isPurchaseEnd() }">
			    		<a href="<%=request.getContextPath()%>/incomeright/cfmright/endbuy.do?projectId=${obj.id}" 
		    				class="btn btn-blue" data-toggle="doajax" data-mask="true"
		    				data-callback="afterChangeStatus()" data-confirm-msg="确定要结束认购？">结束认购</a><br/>
		    		</c:if>
	    			<c:if test="${powerlist.contains('/incomeright/cfmright/delayPage.do') && obj.isDelayPage() }">
	    			<a href="<%=request.getContextPath()%>/incomeright/cfmright/delayPage.do?projectId=${obj.id}" 
	    				class="btn btn-blue" data-toggle="dialog" data-width="800"  
	    				data-height="500" data-id="dialog-mask" data-mask="true">审核延长认购</a><br/>
	    			</c:if>
	    			<c:if test="${powerlist.contains('/debt/proissue/cfmright/toimporttraderecord.do') && obj.isImportTradeRecode()}">
		    			<a href="<%=request.getContextPath()%>/debt/proissue/cfmright/toimporttraderecord.do?projectId=${obj.id}" 
	    				class="btn btn-blue" data-toggle="dialog" data-width="1000"  
	    				data-height="700" data-id="traderecord_id" data-mask="true" data-callback="afterToImportTradeRecord()" data-on-close="closeImportTrade">导入交易明细</a><br/>
	    			</c:if>
	    			<c:if test="${powerlist.contains('/incomeright/cfmright/beforecfmright.do') && obj.isDocfmright() }">
		    			<a href="<%=request.getContextPath()%>/incomeright/cfmright/beforecfmright.do?id=${obj.id}" 
	    				class="btn btn-blue" data-toggle="dialog" data-width="1000"  
	    				data-height="700" data-id="dialog-mask" data-mask="true" data-callback="afterToCfmright()">核保审核</a><br/>
	    			</c:if>
	    			<a href="<%=request.getContextPath()%>/debt/orderapply/list.do?projectId=${obj.id}" 
	    				data-toggle="dialog" data-width="1000"  
	    				data-height="600" data-id="dialog-mask" data-mask="true">认购明细</a>
	    		</td>
	    	</tr>
    	</c:forEach>
    	</tbody>
    </table>
</div>
<%@ include file="/WEB-INF/jsp/common/pageFooter.jsp" %>
