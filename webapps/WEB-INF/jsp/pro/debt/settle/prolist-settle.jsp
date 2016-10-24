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
</script>
<!-- 项目结算管理 -->
<div class="bjui-pageHeader" id="prolist-issue-search">
    <form id="pagerForm" data-toggle="ajaxsearch" action="<%=request.getContextPath()%>/debt/proissue/settle/prolist.do" method="post">
        <div class="bjui-searchBar">
            <%@ include file="/WEB-INF/jsp/pro/debt/search/search_itembase.jsp" %>
            <label>结算状态：</label> 
			<select name="settleStatus" id="select2" data-toggle="selectpicker" class="show-tick">
				<option value="0" <c:if test="${search.settleStatus==0}">selected</c:if>>结算未完成</option>
				<option value="1" <c:if test="${search.settleStatus==1}">selected</c:if>>结算完成</option>
			</select>
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

<div class="bjui-pageContent" id="prolist-issue-list">
    <table data-toggle="tablefixed" data-width="100%">
    	<thead>
    	<tr>
    		<th align="center" width="14%">项目信息</th>
    		<th align="center" width="14%">融资方信息</th>
    		<th align="center" width="16%">融资信息</th>
    		<th align="center" width="16%">资金募集情况</th>
    		<th align="center" width="20%">发布/确认时间</th>
    		<th align="center" width="6%">项目状态</th>
    		<th align="center" width="6%">结算状态</th>
    		<th align="center" width="8%">操作</th>
    	</tr>
    	</thead>
    	<tbody>
    	<c:forEach var="obj" items="${list}">
	    	<tr>
	    		<td>编号：<a href="<%=request.getContextPath()%>/debt/proissue/proinfo/view.do?id=${obj.id}" 
	    				data-toggle="dialog" data-width="1000"  data-height="600" data-id="dialog-mask" 
	    				data-mask="true" >${obj.projectCode }</a><br/>
	    			<span class="text-tit pull-left">名称：</span><a href="<%=request.getContextPath()%>/debt/proissue/proinfo/view.do?id=${obj.id}" 
	    				data-toggle="dialog" data-width="1000"  data-height="600" data-id="dialog-mask" 
	    				data-mask="true" class="text-omit pull-left">${obj.projectName }</a>
	    		</td>
	    		<td><a href="<%=request.getContextPath()%>/user/view.do?id=${obj.loanUserId}" 
	    				data-toggle="dialog" data-width="1000"  data-height="600" data-id="dialog-mask" 
	    				data-mask="true" >${obj.loanUserName }</a></td>
	    		<td>预融资额：<fmt:formatNumber value="${obj.projectMoney }"/> 元<br />投资收益率：<fmt:formatNumber value="${obj.investProfit *100 }" pattern="0.00"/>% <br />项目周期：${obj.projectLimit }<c:if test="${obj.projectLimitTypeId==1}">天</c:if><c:if test="${obj.projectLimitTypeId==2}">月</c:if><c:if test="${obj.projectLimitTypeId==3}">年</c:if><br />还款方式：<c:forEach var="item" items="${systypeRepayList}"><c:if test="${obj.repayTypeId==item.id}">${item.repayTypeName}</c:if></c:forEach> </td>
	    		<td>
	    		已募资金：<fmt:formatNumber value="${obj.raiseMoney }" pattern="0.00"/>  元<br />
	    		募集比例：<fmt:formatNumber value="${obj.raiseMoney*100/obj.projectMoney }"/>%<br />
	    		确权金额：<fmt:formatNumber value="${obj.cfmRightMoney }" pattern="0.00"/>  元<br />
	    		确权比例：<fmt:formatNumber value="${obj.cfmRightMoney*100/obj.projectMoney }"/>%<br />
	    		</td>
	    		<td>
	    		认购结束：<fmt:formatDate value="${obj.buyTimeEnd }" pattern="yyyy-MM-dd HH:mm:ss"/><br/>
	    		交易确认：<fmt:formatDate value="${obj.cfmRightTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
	    		</td>
	    		<td align="center">${obj.getProStatusDesc() }</td>
	    		<td align="center">
	    		${obj.getSettleStatusDesc() }
	    		</td>
	    		<td>
	    		<c:if test="${(obj.isNotReleaseMoney() || obj.isNotRefund()) && powerlist.contains('/debt/proissue/settle/settleindex.do') }">
	    				<a href="<%=request.getContextPath()%>/debt/proissue/settle/settleindex.do?projectId=${obj.id}" 
	    				class="btn btn-blue" data-toggle="dialog" data-width="1000"  
	    				data-height="600" data-id="dialog-mask" data-mask="true">结算处理</a><br/>
	    		</c:if>
	    		<!-- 
	    			<c:if test="${obj.isCfmrightinfo() }">
	    				<a href="/debt/proissue/proinfo/cfmrightinfo.do?projectId=${obj.id}" 
	    				data-toggle="dialog" data-width="1000"  
	    				data-height="600" data-id="dialog-mask" data-mask="true">核保结果</a>
	    			</c:if>
	   				 -->
	    			<a href="<%=request.getContextPath()%>/debt/proissue/settle/settledetail.do?projectId=${obj.id}" 
	    				data-toggle="dialog" data-width="1000"  
	    				data-height="600" data-id="dialog-mask" data-mask="true">结算明细</a>
	    		</td>
	    	</tr>
    	</c:forEach>
    	</tbody>
    </table>
</div>
<%@ include file="/WEB-INF/jsp/common/pageFooter.jsp" %>
