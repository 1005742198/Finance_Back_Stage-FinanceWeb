<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 
投资者兑付列表
 -->
<div class="bjui-pageHeader" id="repay-paylist-search">
    <form id="pagerForm" data-toggle="ajaxsearch" action="<%=request.getContextPath()%>/moneyflow/payinvestlist.do" method="post">
        <input type="hidden" name="pageSize" value="${pageSize}">
        <div class="bjui-searchBar">
            <label>项目编号：</label><input type="text" name="projectCode" value="<c:out value='${search.projectCode}'/>" class="form-control" size="10" data-rule="integer"/>
           	<label>项目名称：</label><input type="text" name="projectName" value="<c:out value='${search.projectName}'/>" class="form-control" size="20" />
            <label>投资者：</label><input type="text" name="userName" value="<c:out value='${search.userName}'/>" class="form-control" size="10" />
            <button type="button" class="showMoreSearch" data-toggle="moresearch" data-name="custom2">
            	<i class="fa fa-angle-double-down"></i></button>
            <button type="submit" class="btn-default" data-icon="search" data-clear-query="false">查询</button>
            <a class="btn btn-default" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">重置查询</a>
        </div>
        <div class="bjui-moreSearch">
			<table width="100%">
			<tr>
				<td>
					<label>兑付状态：</label> 
					<select name="payStatus" id="select2" data-toggle="selectpicker" class="show-tick">
							<option value="">全部</option>
							<option value="2" <c:if test="${search.payStatus==2}">selected</c:if>>处理成功</option>
					</select>
				</td>
				<td>
					<label class="control-label x130">结算渠道：</label> 
					<select id="payclearId" name="payclearId" data-toggle="selectpicker" >
			           <option value="">-全部-</option>
			           <c:if test="${!empty clearcenters}">
			              <c:forEach items="${clearcenters}" var="clearcenter">
			              	  <option value="${clearcenter.paycenterId}" <c:if test="${search.payclearId==clearcenter.paycenterId}">selected</c:if>>${clearcenter.payCenterName }</option>
			              	</c:forEach>
			            </c:if>
			        </select>
				</td>
				<td>
					<label>兑付时间：</label><input type="text" name="updateTimeBegin" value="${search.updateTimeBegin }" data-toggle="datepicker" size="10"
						data-pattern="yyyy-MM-dd" data-nobtn="true" data-rule="date">-
					<input type="text" name="updateTimeEnd" value="${search.updateTimeEnd }" data-toggle="datepicker" size="10"
						data-pattern="yyyy-MM-dd" data-nobtn="true" data-rule="date">
				</td>
			</tr>
			</table>
        </div>
    </form>
</div>
<div class="bjui-pageContent" id="repay-paylist-search">
        <table data-toggle="tablefixed" data-width="100%">
    	<thead>
    	<tr>
    		<th align="center" width="26%">项目信息</th>
    		<th align="center" width="22%">投资者</th>
    		<th align="center" width="6%">兑付期数</th>
    		<th align="center" width="16%">兑付金额(元)</th>
    		<th align="center" width="12%">兑付状态</th>
    		<th align="center" width="18%">兑付时间</th>
    	</tr>
    	</thead>
    	<tbody>
    	<c:forEach var="list" items="${list}">
    	<tr>
		<td>项目编号：${list.projectCode }<br />
    		<span class="text-tit pull-left">项目名称：</span><a href="<%=request.getContextPath()%>/moneyflow/getprojectinfo.do?id=${list.projectId}" 
    				data-toggle="dialog" data-width="1000"  data-height="600" data-id="dialog-mask" 
    				data-mask="true" class="text-omit pull-left">${list.projectName }</a>
    		</td>
    		<td>${list.showName() }</td>
    		<td align="center">${list.periodNumber }</td>
    		<td><fmt:formatNumber value="${list.payMoney }" pattern="0.00"/></td>
    		<td align="center"><c:if test="${list.payStatus==3}">处理中</c:if><c:if test="${list.payStatus==2}">处理成功</c:if><c:if test="${list.payStatus==4}">处理失败</c:if></td>
    		<td align="center"><fmt:formatDate value="${list.updateTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
    	</tr>
    	</c:forEach>
    	</tbody>
    </table>
</div>
<%@ include file="/WEB-INF/jsp/common/pageFooter.jsp" %>
