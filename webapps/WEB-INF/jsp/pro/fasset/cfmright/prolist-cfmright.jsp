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
<div class="bjui-pageHeader" id="prolist-issue-cfmright-search">
    <form id="pagerForm" data-toggle="ajaxsearch" action="<%=request.getContextPath()%>${cfmRightControllerRoot}/prolist.do" method="post">
        <div class="bjui-searchBar">
           	<%@ include file="/WEB-INF/jsp/pro/fasset/search/search_itembase.jsp" %>
            <button type="button" class="showMoreSearch" data-toggle="moresearch" data-name="custom2">
            	<i class="fa fa-angle-double-down"></i></button>
            <button type="submit" class="btn-default" data-icon="search" data-clear-query="false">查询</button>
            <a class="btn btn-default" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">重置查询</a>
        </div>
        <div class="bjui-moreSearch">
			<%@ include file="/WEB-INF/jsp/pro/fasset/search/search_itemext.jsp" %>
        </div>
    </form>
</div>

<div class="bjui-pageContent" id="prolist-issue-cfmright-list">
    <table data-toggle="tablefixed" data-width="100%">
    	<thead>
    	<tr>
    		<th align="center" width="15%">项目信息</th>
    		<th align="center" width="15%">转让方信息</th>
    		<th align="center" width="16%">转让信息</th>
    		<th align="center" width="20%">发布/转让时间</th>
    		<th align="center" width="16%">转让情况</th>
    		<th align="center" width="8%">项目状态</th>
    		<th align="center" width="10%">执行审核</th>
    	</tr>
    	</thead>
    	<tbody>
    	<c:forEach var="obj" items="${list}">
	    	<tr>
	    		<td>编号：${obj.projectCode }<br/>
	    			<span class="text-tit pull-left">名称：</span><a href="<%=request.getContextPath()%>/fasset/proissue/proinfo/view.do?id=${obj.id}" 
	    				data-toggle="dialog" data-width="1000"  data-height="600" data-id="dialog-mask" 
	    				data-mask="true" class="text-omit pull-left">${obj.projectName }</a>
	    		</td>
	    		<td>
					<span class="text-tit pull-left">转让方：</span><a href="<%=request.getContextPath()%>/user/view.do?id=${obj.loanUserId}" 
	    				data-toggle="dialog" data-width="800"  data-height="600" data-id="dialog-mask" 
	    				data-mask="true" class="text-omit pull-left">${obj.loanUserName}</a><br />
					<span class="text-tit pull-left">交易顾问：</span><a href="<%=request.getContextPath()%>/user/view.do?id=${obj.memberId}" 
				    				data-toggle="dialog" data-width="1000"  data-height="600" data-id="dialog-mask" 
				    				data-mask="true" class="text-omit pull-left">${obj.memberName}</a>
	    				</td>
    			<td>挂牌金额：<fmt:formatNumber value="${obj.projectMoney}" pattern="0.00"/>元<br />交易保证金：<fmt:formatNumber value="${obj.guaranteeMoney }" pattern="0.00"/><c:if test="${obj.guaranteeValueType ==1 }">元</c:if><c:if test="${obj.guaranteeValueType ==2 }">%</c:if><br />挂牌天数：${obj.projectLimit}天<br />转让方式：${obj.getTransferTypeDesc() }</td>
	    		<td>
	    		项目发布：<fmt:formatDate value="${obj.publishTime }" pattern="yyyy-MM-dd HH:mm:ss"/><br />
	    		转让开始：<fmt:formatDate value="${obj.buyTimeStart }" pattern="yyyy-MM-dd HH:mm:ss"/><br />
	    		转让结束：<fmt:formatDate value="${obj.buyTimeEnd }" pattern="yyyy-MM-dd HH:mm:ss"/>
	    		</td>
	    		<td>
	    		意向报价方：<span id="quotedCnt_${obj.id}">0</span>个 <br />
	    		最高报价：<span id="quotedMaxMoney_${obj.id}">0</span>元
	    		</td>
	    		<td align="center"><c:forEach var="item" items="${projectStatusDesc}"><c:if test="${item.value==obj.projectStatus}">${item}</c:if></c:forEach></td>
	    		<td>
	    		
		    		<c:if test="${obj.isPurchase() && powerlist.contains('/fasset/proissue/cfmright/startbuy.do')}">
			    		<a href="<%=request.getContextPath()%>${cfmRightControllerRoot}/startbuy.do?projectId=${obj.id}" 
		    				class="btn btn-blue" data-toggle="doajax" data-mask="true" data-callback="afterChangeStatus()"
		    				data-confirm-msg="确认立即启动转让吗？">立即启动转让</a><br/>
			    	</c:if>
		    		<c:if test="${obj.isPurchaseEnd() && powerlist.contains('/fasset/proissue/cfmright/endbuy.do') }">
			    		<a href="<%=request.getContextPath()%>${cfmRightControllerRoot}/endbuy.do?projectId=${obj.id}" 
		    				class="btn btn-blue" data-toggle="doajax" data-mask="true" data-callback="afterChangeStatus()"
		    				data-confirm-msg="确认要结束转让吗？">结束转让</a><br/>
		    		</c:if>
	    			<c:if test="${obj.isDelayPage() && powerlist.contains('/fasset/proissue/cfmright/delayPage.do') }">
	    			<a href="<%=request.getContextPath()%>${cfmRightControllerRoot}/delayPage.do?projectId=${obj.id}" 
	    				class="btn btn-blue" data-toggle="dialog" data-width="800"  
	    				data-height="500" data-id="dialog-mask" data-mask="true">审核延长转让</a><br/>
	    			</c:if>
	    			<c:if test="${powerlist.contains('/debt/proissue/cfmright/toimporttraderecord.do') && obj.isImportTradeRecode()}">
		    			<a href="<%=request.getContextPath()%>/debt/proissue/cfmright/toimporttraderecord.do?projectId=${obj.id}" 
	    				class="btn btn-blue" data-toggle="dialog" data-width="1000"  
	    				data-height="700" data-id="traderecord_id" data-mask="true" data-callback="afterToImportTradeRecord()" data-on-close="closeImportTrade">导入交易明细</a><br/>
	    			</c:if>
	    			<c:if test="${obj.isDocfmright() && powerlist.contains('/fasset/proissue/cfmright/beforecfmright.do') }">
		    			<a href="<%=request.getContextPath()%>${cfmRightControllerRoot}/beforecfmright.do?id=${obj.id}" 
	    				class="btn btn-blue" data-toggle="dialog" data-width="1000"  
	    				data-height="700" data-id="dialog-mask" data-mask="true" data-callback="afterToCfmright()">核保审核</a><br/>
	    			</c:if>
	    			<a href="<%=request.getContextPath()%>/fasset/orderapply/bidlist.do?projectId=${obj.id}" 
	    				data-toggle="dialog" data-width="1000"  
	    				data-height="600" data-id="dialog-mask" data-mask="true">报价明细</a>
	    		</td>
	    	</tr>
    	</c:forEach>
    	</tbody>
    </table>
</div>
<script type="text/javascript">
$.ajax({
	type:"GET",
	url:"<%=request.getContextPath()%>/fasset/proissue/cfmright/quoteInfo.do?ids=${ids}",
	cache: 'false',
	dataType: 'json',
	success:function(data){
		if(data != undefined) {
			for(var i=0; i<data.length; i++) {
				var info = data[i];
				$("#quotedCnt_"+info.projectId).text(info.quotedCnt);
				$("#quotedMaxMoney_"+info.projectId).text(info.quotedMaxMoney);
			}
		}
	}
});
</script>
<%@ include file="/WEB-INF/jsp/common/pageFooter.jsp" %>
