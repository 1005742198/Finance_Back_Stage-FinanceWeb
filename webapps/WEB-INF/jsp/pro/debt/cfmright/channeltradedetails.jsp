<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!--渠道交易记录总表-->
<div class="bjui-pageHeader"  id="channelrecord-header">
 <form id="pagerForm" data-toggle="ajaxsearch" action="<%=request.getContextPath()%>/debt/proissue/cfmright/tradedetaillist.do?tradeId=${bizChannelTrade.id}" method="post">
 </form>
<table class="table table-condensed table-hover" width="100%">
        <tbody>
            <tr>
                <td>
                    <label class="control-label x90 text-tit pull-left">挂牌项目名称：</label>
                    <span class="text-omit pull-left">${project.projectName}</span>
                 </td>
                <td>
                    <label class="control-label x90">挂牌项目编号：</label>
                    <span>${project.projectCode}</span>
                </td>
             </tr>
             <tr>
                <td>
                    <label class="control-label x90">投资顾问名称：</label>
                    <span>${bizChannelTrade.saleAgentName}</span>
                </td>
                <td>
                    <label class="control-label x90">投资顾问编号：</label>
                    <span>${bizChannelTrade.saleAgentCode}</span>
                </td>
            </tr>
             <tr>
                <td colspan="2">
                    	本次导入的数据条数：<span class="red">${bizChannelTrade.totalNumber }</span>条；导入投资金额总计：<span class="red">${bizChannelTrade.totalTradeMoney }</span>元
                </td>
            </tr>
   	</tbody>
  </table>
</div>
<div class="bjui-pageContent" id="repay-paylist-list">
    <table data-toggle="tablefixed" data-width="100%">
    	<thead>
    	<tr>
    		<th>交易时间</th>
    		<th>项目分期名称</th>
    		<th>分期代码</th>
    		<th>投资金额</th>
    		<th>客户姓名</th>
    		<th>证件类型</th>
    		<th>证件编号</th>
    		<th>客户编号</th>
    		<th>注册时间</th>
    	</tr>
    	</thead>
    	<tbody>
    	<c:forEach var="obj" items="${detailList}">
    	<tr>
    		<td><fmt:formatDate value="${obj.tradeTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
    		<td>${obj.projectPeriodName}</td>
    		<td>${obj.periodCode}</td>
    		<td><fmt:formatNumber value="${obj.tradeMoney}" pattern="0.00"/></td>
    		<td>${obj.userRealName}</td>
    		<td><c:forEach var="idType" items="${idTypeList}"><c:if test="${idType.typeId==obj.idTypeId}">${idType.typeName }</c:if></c:forEach></td>
    		<td>${obj.idNumber}</td>
    		<td>${obj.userCode}</td>
    		<td><fmt:formatDate value="${obj.registerTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
    	</tr>
    	</c:forEach>
    	</tbody>
    </table>
</div>
<%@ include file="/WEB-INF/jsp/common/pageFooter.jsp" %>

