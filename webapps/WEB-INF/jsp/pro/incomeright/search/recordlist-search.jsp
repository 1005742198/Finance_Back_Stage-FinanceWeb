<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 
项目综合查询
 -->
<div class="bjui-pageHeader" id="prolist-search-search">
    <form id="pagerForm" data-toggle="ajaxsearch" action="<%=request.getContextPath()%>/income/right/record/search.do" method="post">
        <input type="hidden" name="pageSize" value="${pageSize}">
        <div class="bjui-searchBar">
			<label>备案代码：</label>
			<input type="text" name="recordCode" value="<c:out value='${search.projectCode}'/>" class="form-control" size="10" data-rule="integer"/>
			<label>备案名称：</label>
			<input type="text" name="recordName" value="<c:out value='${search.projectName}'/>" class="form-control" size="15" />
			<label>备案状态：</label> 
			<select name="recordStatus" id="select2" data-toggle="selectpicker" class="show-tick" style="display: none;">
				<option value="">全部</option>
				<c:forEach var="item" items="${projectStatusDesc}">
				<option value="${item.value}" <c:if test="${search.recordStatus==item.value}">selected</c:if>>${item}</option>
				</c:forEach>
			</select>
            <button type="submit" class="btn-default" data-icon="search" data-clear-query="false">查询</button>
            <a class="btn btn-default" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">重置查询</a>
        </div>
    </form>
</div>

<div class="bjui-pageContent"  id="prolist-search-list">
    <table data-toggle="tablefixed" data-width="100%">
    	<thead>
    	<tr>
    		<th align="center" width="14%">产品信息</th>
    		<th align="center" width="14%">发行人信息</th>
    		<th align="center" width="16%">产品基本信息</th>
    		<th align="center" width="20%">时间相关</th>
    		<th align="center" width="8%">产品状态</th>
    		<th align="center" width="12%">可挂牌金额(元)</th>
    	</tr>
    	</thead>
    	<tbody>
    	<c:forEach var="list" items="${list}">
    	<tr>
		<td>
			代码：<a href="<%=request.getContextPath()%>/incomeright/recordinfo/view.do?id=${list.id}" 
    				data-toggle="dialog" data-width="1000"  data-height="600" data-id="dialog-mask" 
    				data-mask="true" >${list.recordCode}</a><br />
    		<span class="text-tit pull-left">名称：</span><a href="<%=request.getContextPath()%>/incomeright/recordinfo/view.do?id=${list.id}" 
    				data-toggle="dialog" data-width="1000"  data-height="600" data-id="dialog-mask" 
    				data-mask="true"  class="text-omit pull-left">${list.recordName}</a><br/>
    		</td>
    		<td><a href="<%=request.getContextPath()%>/user/view.do?id=${list.loanUserId}" 
    				data-toggle="dialog" data-width="800"  data-height="600" data-id="dialog-mask" 
    				data-mask="true" >${list.loanUserName}</a></td>
    		<td>拟募集规模：<fmt:formatNumber value="${list.projectMoney}"/>元<br />
    		拟定年化收益率：<fmt:formatNumber value="${list.investProfit*100}"  pattern="0.00"/>%<br />
    		拟定期限：${list.projectLimit}<c:if test="${list.projectLimitTypeId==1}">天</c:if><c:if test="${list.projectLimitTypeId==2}">月</c:if><c:if test="${list.projectLimitTypeId==3}">年</c:if><br />
    		拟还款方式：<c:forEach var="item" items="${systypeRepayList}"><c:if test="${list.repayTypeId==item.id}">${item.repayTypeName}</c:if></c:forEach></td>
    		<td>
    		创建时间：<fmt:formatDate value="${list.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/><br />
    		最后更新时间：<fmt:formatDate value="${list.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/><br />
    		</td>
    		<td><c:forEach var="item" items="${projectStatusDesc}"><c:if test="${item.value==list.recordStatus}">${item}</c:if></c:forEach></td>
    		<td><c:choose><c:when test="${list.recordStatus==6}"><fmt:formatNumber value="${list.projectMoney-list.quotedMoney}" pattern="0.00"/></c:when><c:otherwise>0.00</c:otherwise></c:choose></td>
    	</tr>
    	</c:forEach>
    	</tbody>
    </table>
</div>
<%@ include file="/WEB-INF/jsp/common/pageFooter.jsp" %>
