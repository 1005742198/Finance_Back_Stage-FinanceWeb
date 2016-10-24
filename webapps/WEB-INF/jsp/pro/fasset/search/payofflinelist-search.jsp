<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 线下支付订单到款确认列表 -->
<div class="bjui-pageHeader" id="prolist-issue-search">
    <form id="pagerForm" data-toggle="ajaxsearch" action="<%=request.getContextPath()%>${searchAddress}" method="post">
        <div class="bjui-searchBar">
			<label>项目编号：</label>
			<input type="text" name="projectCode" value="<c:out value='${search.projectCode}'/>" class="form-control" size="10" data-rule="integer"/>
			<label>项目名称：</label>
			<input type="text" name="projectName" value="<c:out value='${search.projectName}'/>" class="form-control" size="10" />
			<label>转让单号：</label>
			<input type="text" name="orderNumber" value="<c:out value='${search.orderNumber}'/>" class="form-control" size="15" />
			<label>转让人：</label>
			<input type="text" name="orderUserName" value="<c:out value='${search.orderUserName}'/>" class="form-control" size="15" />
            <button type="submit" class="btn-default" data-icon="search" data-clear-query="false">查询</button>
            <a class="btn btn-default" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">重置查询</a>
        </div>
    </form>
</div>

<div class="bjui-pageContent" id="prolist-issue-list">
 <table data-toggle="tablefixed" data-width="100%">
    	<thead>
    	<tr>
    		<th align="center" width="14%">转让单号</th>
    		<th align="center" width="20%">资产信息</th>
    		<th align="center" width="14%">转让时间</th>
    		<th align="center" width="14%">投资人</th>
    		<th align="center" width="10%">报价金额(元)</th>
    		<th align="center" width="10%">保证金金额(元)</th>
    		<th align="center" width="10%">已支付金额(元)</th>
    		<th align="center" width="8%">操作</th>
    	</tr>
    	</thead>
    	<tbody>
    		<c:if test="${not empty list}">
    			<c:forEach items="${list}" var="obj">
    		<tr>
    			<td>${obj.orderApplyBizNumber}</td>
	    		<td>项目编号：<a href="<%=request.getContextPath()%>/fasset/proissue/proinfo/view.do?id=${obj.projectId}" 
	    				data-toggle="dialog" data-width="1000"  data-height="600" data-id="dialog-mask" 
	    				data-mask="true" >${obj.projectCode}</a><br/>
	    			<span class="text-tit pull-left">名称：</span><a href="<%=request.getContextPath()%>/fasset/proissue/proinfo/view.do?id=${obj.projectId}" 
	    				data-toggle="dialog" data-width="1000"  data-height="600" data-id="dialog-mask" 
	    				data-mask="true" class="text-omit pull-left">${obj.projectName}</a>
	    		</td>
    			<td>
    				<fmt:formatDate value="${obj.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
    			</td>
    			<td>${obj.orderUserName }</td>
    			<td>
    				<fmt:formatNumber value="${obj.orderMoney}"  pattern="0.00" maxFractionDigits="2"/>
    			</td>
    			<td><fmt:formatNumber value="${obj.guaranteeMoney}"  pattern="0.00" maxFractionDigits="2"/></td>
    			<td><fmt:formatNumber value="${obj.paidMoney}"  pattern="0.00" maxFractionDigits="2"/></td>
	    		<td>
	    		<c:if test="${powerlist.contains('/fasset/prosearch/payoffline-cfm-info.do')}">
	    			<a href="<%=request.getContextPath()%>/fasset/prosearch/payoffline-cfm-info.do?orderApplyId=${obj.id}" 
	    				data-toggle="dialog" data-width="1300"  
	    				data-height="500" data-id="dialog-mask" data-mask="true">到款确认明细</a>
	    		</c:if>
	    		</td>
    		</tr>
    			</c:forEach>
    		</c:if>
    		
    	</tbody>
    </table> 
</div>
