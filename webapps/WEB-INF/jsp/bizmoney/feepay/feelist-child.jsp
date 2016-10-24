<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 会员费用列表 -->
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="<%=request.getContextPath()%>/fee/settle/feelist-child.do?feeId=${search.feeId}&userId=${search.userId}" method="post">
        <div class="bjui-searchBar"> 
        	<label>项目编号：</label><input type="text" name="projectCode" value="<c:out value='${search.projectCode }'/>" class="form-control" size="10" data-rule="integer"/>
            <label>项目名称：</label><input type="text" name="projectName" value="<c:out value='${search.projectName }'/>" class="form-control" size="20"/>
           	<!--  <label>划付状态：</label><select name="payStatus" id="status" data-toggle="selectpicker" class="show-tick" style="display: none;" size="10">
				<option value="">-全部-</option>
				<c:forEach var="status" items="${feePayStatus }">
					<option value="${status.status }" <c:if test="${search.payStatus==status.status }">selected</c:if>>${status }</option>
				</c:forEach>
			</select>-->
            <button type="button" class="showMoreSearch" data-toggle="moresearch" data-name="custom2">
            	<i class="fa fa-angle-double-down"></i></button>
            <button type="submit" class="btn-default" data-icon="search" data-clear-query="false">查询</button>
            <a class="btn btn-default" href="javascript:;" data-toggle="reloadsearch"  data-clear-query="true" data-icon="undo">重置查询</a>
        </div>
        <div class="bjui-moreSearch">
			<%@ include file="/WEB-INF/jsp/bizmoney/fee/searchfee_ext.jsp" %>
        </div>
    </form>
</div>
<div class="bjui-pageContent">
    <table data-toggle="tablefixed" data-width="100%">
    	<thead>
    	<tr>
    		<th align="center">序号</th>
    		<th align="center">项目信息</th>
    		<th align="center">确权金额</th>
    		<th align="center">服务费信息</th>
    		<th align="center">费用时间</th>
    		<!-- <th align="center">划付状态</th>
    		<th align="center">划付时间</th> -->
    	</tr>
    	</thead>
    	<tbody>
    	<c:forEach var="obj" items="${list}">
    	<tr>
    		<td>${obj.id }</td>
    		<td>项目编号：${obj.projectCode}<br />
    		项目名称：<a href="<%=request.getContextPath()%>/moneyflow/getprojectinfo.do?id=${obj.projectId}" 
    				data-toggle="dialog" data-width="1000"  data-height="600" data-id="dialog-feechild" 
    				data-mask="true" >${obj.projectName}</a></td>
    		<td><fmt:formatNumber value="${obj.cfmRightMoney }" pattern="0.00"/>元</td>
    		<td><c:choose><c:when test="${obj.feeType==1}">平台</c:when><c:when test="${obj.feeType==2}">投资</c:when><c:otherwise>融资</c:otherwise></c:choose>服务费:<fmt:formatNumber value="${obj.feeAmount }" pattern="0.00"/>元<br />
    		服务费率：<c:if test="${obj.feeType==1}"><fmt:formatNumber value="${obj.platformFee}" type="percent" maxFractionDigits="3" minFractionDigits="2"/></c:if>
    		<c:if test="${obj.feeType==3}"><fmt:formatNumber value="${obj.advioserFee}" type="percent" maxFractionDigits="3" minFractionDigits="2"/></c:if>
    		<c:if test="${obj.feeType==2}"><fmt:formatNumber value="${obj.investAdvioserFee}" type="percent" maxFractionDigits="3" minFractionDigits="2"/></c:if></td>
    		<td><fmt:formatDate value="${obj.createTime }" pattern="yyyy-MM-dd"/></td>
    		 <!--<td><c:forEach var="item" items="${feePayStatus}"><c:if test="${item.status==obj.payStatus}">${item}</c:if></c:forEach></td>
    		<td><fmt:formatDate value="${obj.payTime }" pattern="yyyy-MM-dd"/></td> -->
    	</tr>
    	</c:forEach>
    	</tbody>
    </table>
</div>
<%@ include file="/WEB-INF/jsp/common/pageFooter.jsp" %>
