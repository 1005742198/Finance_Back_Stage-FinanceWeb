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
    <form id="pagerForm" data-toggle="ajaxsearch" action="<%=request.getContextPath()%>${searchAddress}" method="post">
        <div class="bjui-searchBar">
            <%@ include file="/WEB-INF/jsp/pro/fasset/search/search_itembase.jsp" %>
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
			<%@ include file="/WEB-INF/jsp/pro/fasset/search/search_itemext.jsp" %>
        </div>
    </form>
</div>

<div class="bjui-pageContent" id="prolist-issue-list">
    <table data-toggle="tablefixed" data-width="100%">
    	<thead>
    	<tr>
    		<th align="center" width="18%">项目信息</th>
    		<th align="center" width="18%">转让方信息</th>
    		<th align="center" width="15%">转让信息</th>
    		<th align="center" width="17%">发布/确认时间</th>
    		<th align="center" width="7%">项目状态</th>
    		<th align="center" width="7%">结算状态</th>
    		<th align="center" width="8%">操作</th>
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
	    		<td><span class="text-tit pull-left">转让方：</span><a href="<%=request.getContextPath()%>/user/view.do?id=${obj.loanUserId}" 
	    				data-toggle="dialog" data-width="1000"  data-height="600" data-id="dialog-mask" 
	    				data-mask="true" class="text-omit pull-left">${obj.loanUserName }</a><br />
	    			<span class="text-tit pull-left">交易顾问：</span><a href="<%=request.getContextPath()%>/user/view.do?id=${obj.memberId}" 
			    				data-toggle="dialog" data-width="1000"  data-height="600" data-id="dialog-mask" 
			    				data-mask="true" class="text-omit pull-left">${obj.memberName}</a>
			    </td>
	    		<td>挂牌金额：<fmt:formatNumber value="${obj.projectMoney}" pattern="0.00"/> 元<br />交易保证金：<fmt:formatNumber value="${obj.guaranteeMoney }" pattern="0.00"/><c:if test="${obj.guaranteeValueType ==1 }">元</c:if><c:if test="${obj.guaranteeValueType ==2 }">%</c:if><br />挂牌天数：${obj.projectLimit }天<br />转让方式：${obj.getTransferTypeDesc() }</td>
	    		<td>
	    		转让结束：<fmt:formatDate value="${obj.buyTimeEnd }" pattern="yyyy-MM-dd HH:mm:ss"/><br/>
	    		交易确认：<fmt:formatDate value="${obj.cfmRightTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
	    		</td>
	    		<td align="center"><c:forEach var="item" items="${projectStatusDesc}"><c:if test="${item.value==obj.projectStatus}">${item}</c:if></c:forEach></td>
	    		<td align="center">
	    			${obj.getSettleStatusDesc() }
	    		</td>
	    		<td>
	    			<c:if test="${(obj.settleStatus != 3) && powerlist.contains('/fasset/proissue/settle/viewsettle.do')}">
	    				<a href="<%=request.getContextPath()%>${settleControllerRoot}/viewsettle.do?projectId=${obj.id}" 
	    				class="btn btn-blue" data-toggle="dialog" data-width="1000"  
	    				data-height="600" data-id="dialog-mask" data-mask="true">结算处理</a><br/>
	    			</c:if>
	    				<!-- 
	    			<c:if test="${obj.isCfmrightinfo() }">
	    			 -->
	    				<a href="<%=request.getContextPath()%>${settleControllerRoot}/settledetail.do?projectId=${obj.id}" 
	    				data-toggle="dialog" data-width="1000"  
	    				data-height="600" data-id="dialog-mask" data-mask="true">结算明细</a>
	    				<!-- 
	    			</c:if>
	    			 -->
	    		</td>
	    	</tr>
    	</c:forEach>
    	</tbody>
    </table>
</div>
<%@ include file="/WEB-INF/jsp/common/pageFooter.jsp" %>
