<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 投资/融资顾问服务费列表 -->
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="<%=request.getContextPath()%>/bizmoney/fee/advisorlist.do" method="post">
        <input type="hidden" name="pageSize" value="${pageSize }">
        <div class="bjui-searchBar"> 
        	<label>项目编号：</label><input type="text" name="projectCode" value="<c:out value='${search.projectCode }'/>" class="form-control" size="10" data-rule="integer"/>
            <label>项目名称：</label><input type="text" name="projectName" value="<c:out value='${search.projectName }'/>" class="form-control" size="20"/>
           	<label>划付状态：</label><select name="payStatus" id="status" data-toggle="selectpicker" class="show-tick" style="display: none;" size="10">
				<option value="">-全部-</option>
				<option value="1" <c:if test="${search.payStatus==1 }">selected</c:if>>未付</option>
				<option value="4" <c:if test="${search.payStatus==4 }">selected</c:if>>已付</option>
			</select>
			<label>顾问名称：</label><input type="text" name="feeUserName" value="<c:out value='${search.feeUserName }'/>" class="form-control" size="15"/>
            <button type="button" class="showMoreSearch" data-toggle="moresearch" data-name="custom2">
            	<i class="fa fa-angle-double-down"></i></button>
            <button type="submit" class="btn-default" data-icon="search" data-clear-query="false">查询</button>
            <a class="btn btn-default" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">重置查询</a>
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
    		<th align="center" width="8%">序号</th>
    		<th align="center" width="12%">顾问名称</th>
    		<th align="center" width="8%">顾问类型</th>
    		<th align="center" width="16%">项目信息</th>
    		<th align="center" width="12%">确权金额</th>
    		<th align="center" width="16%">服务费信息</th>
    		<th align="center" width="20%">费用时间</th>
    		<th align="center" width="8%">划付状态</th>
    	</tr>
    	</thead>
    	<tbody>
    	<c:forEach var="list" items="${list}">
    	<tr>
    		<td>${list.id }</td>
    		<td>${list.feeUserName }</td>
    		<td align="center"><c:if test="${list.feeType==3}">融资顾问</c:if><c:if test="${list.feeType==2}">投资顾问</c:if></td>
    		<td>项目编号：${list.projectCode}<br />
    			<span class="text-tit pull-left">项目名称：</span><a href="<%=request.getContextPath()%>/moneyflow/getprojectinfo.do?id=${list.projectId}" 
    				data-toggle="dialog" data-width="1000"  data-height="600" data-id="dialog-mask" 
    				data-mask="true" class="text-omit pull-left">${list.projectName }</a>
    				</td>
    		<td><fmt:formatNumber value="${list.cfmRightMoney }" pattern="0.00"/>元</td>
    		<td>服务费:<fmt:formatNumber value="${list.feeAmount }" pattern="0.00"/>元<br />
    		服务费率：
    		<c:if test="${list.feeType==3}"><fmt:formatNumber value="${list.advioserFee}" type="percent" maxFractionDigits="3" minFractionDigits="2"/></c:if>
    		<c:if test="${list.feeType==2}"><fmt:formatNumber value="${list.investAdvioserFee}" type="percent" maxFractionDigits="3" minFractionDigits="2"/></c:if></td>
    		<td>生成时间：<fmt:formatDate value="${list.createTime }" pattern="yyyy-MM-dd HH:mm:ss"/><br />
    		划付时间：<fmt:formatDate value="${list.feePayCfmTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
    		<td align="center"><c:forEach var="item" items="${feePayStatusDesc}"><c:if test="${item.status==list.feePayStatus}">${item}</c:if></c:forEach></td>
    	</tr>
    	</c:forEach>
    	</tbody>
    </table>
</div>
<%@ include file="/WEB-INF/jsp/common/pageFooter.jsp" %>
