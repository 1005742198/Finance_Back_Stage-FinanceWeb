<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
function callback(json){
	if(json.statusCode == 200){
		$(this).alertmsg("correct", json.message);
		$(this).dialog("refresh");
	}else if(json.statusCode == 602){
		$(this).alertmsg("warn", json.message);
	}else{
		$(this).alertmsg("error", json.message);
	}
	
}

function refresh(){
	$(this).dialog("refresh");
}
</script>
<!--渠道交易记录总表-->
<div class="bjui-pageHeader"  id="channelrecord-header">
 <form id="pagerForm" data-toggle="ajaxsearch" action="<%=request.getContextPath()%>/debt/proissue/cfmright/toimporttraderecord.do?projectId=${project.id}" method="post">
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
                <td>
                    <label class="control-label">挂牌规模：</label>
                    <span>${project.projectMoney}</span>
                </td>
                <td>
                    <label class="control-label">募集时间：</label>
                    <span>
                    	<fmt:formatDate value="${project.buyTimeStart}" pattern="MM.dd"/>-
                    	<fmt:formatDate value="${project.buyTimeEnd}" pattern="MM.dd"/>
                    </span>
                </td>
            </tr>
   	</tbody>
  </table>
  
  <table class="table table-condensed table-hover" width="100%">
        <tbody>
            <tr>
                <td>
				<label class="control-label">导入交易明细</label>
				<a style="margin-left:20px;" href="<%=request.getContextPath()%>/debt/proissue/cfmright/addtradefile.do?projectId=${project.id}" 
			  				class="btn btn-blue pull-right" data-toggle="dialog" data-width="800"  
			  				data-height="280" data-id="add_traderecord_id" data-mask="true" >新增导入文件</a>
			    <a href="javascript:;" class="btn btn-blue pull-right" onclick="refresh();">刷新</a>
			    
                 </td>
            </tr>
   		</tbody>
  </table>
</div>
<div class="bjui-pageContent" id="repay-paylist-list">
    <table data-toggle="tablefixed" data-width="100%">
    	<thead>
    	<tr>
    		<th>投资顾问全称</th>
    		<th>投资顾问编号</th>
    		<th>导入数据总数(条)</th>
    		<th>导入投资总金额(元)</th>
    		<th>导入状态</th>
    		<th>导入时间</th>
    		<th>操作</th>
    	</tr>
    	</thead>
    	<tbody>
    	<c:forEach var="list" items="${tradeList}">
    	<tr>
    		<td>${list.saleAgentName}</td>
    		<td>${list.saleAgentCode}</td>
    		<td>${list.totalNumber}</td>
    		<td><fmt:formatNumber value="${list.totalTradeMoney}" pattern="0.00"/></td>
    		<td>
    			<c:forEach items="${importStatusDesc}" var="item">
    				<c:if test="${list.importStatus == item.status }">
    					${item}
    				</c:if>
    			</c:forEach>
    		</td>
    		<td><fmt:formatDate value="${list.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
    		<td>
    			<c:if test="${list.importStatus == 4 || list.importStatus == 3}">
    			<a href="<%=request.getContextPath()%>/debt/proissue/cfmright/tradedetaillist.do?tradeId=${list.id}" 
	    				class="btn btn-blue" data-toggle="dialog" data-width="1000"  
	    				data-height="700" data-id="traderecorddetail_id" data-mask="true" >查看</a>
    			</c:if>
	    		<c:if test="${list.importStatus == 4}">
	    				<a href="<%=request.getContextPath()%>/debt/proissue/cfmright/torefreshuploadtradefile.do?tradeId=${list.id}" 
	    				class="btn btn-blue" data-toggle="dialog" data-width="800"  
	    				data-height="280" data-id="add_traderecord_id" data-mask="true" >重新上传</a><br/>
	    		</c:if>
    		
    		</td>
    		
    	</tr>
    	</c:forEach>
    	</tbody>
    </table>
</div>
<%@ include file="/WEB-INF/jsp/common/pageFooter.jsp" %>

