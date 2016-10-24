<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 
融资放款放款列表
 -->
<div class="bjui-pageHeader" id="release-paylist-search">
    <form id="pagerForm" data-toggle="ajaxsearch" action="<%=request.getContextPath()%>/moneyflow/releaselist.do" method="post">
        <input type="hidden" name="pageSize" value="${pageSize}">
        <div class="bjui-searchBar">
            <label>项目编号：</label><input type="text" name="projectCode" value="<c:out value='${search.projectCode}'/>" class="form-control" size="10" data-rule="integer"/>
           	<label>项目名称：</label><input type="text" name="projectName" value="<c:out value='${search.projectName}'/>" class="form-control" size="20" />
           <label>融资方名称：</label><input type="text" name="loanUserName" value="<c:out value='${search.loanUserName}'/>" class="form-control" size="10" />
            <button type="button" class="showMoreSearch" data-toggle="moresearch" data-name="custom2">
            	<i class="fa fa-angle-double-down"></i></button>
            <button type="submit" class="btn-default" data-icon="search" data-clear-query="false">查询</button>
            <a class="btn btn-default" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">重置查询</a>
        </div>
        <div class="bjui-moreSearch">
			<table width="100%">
			<tr>
				<td>
					<label>放款状态：</label> 
					<select name="releaseStatus" id="select2" data-toggle="selectpicker" class="show-tick">
							<option value="">全部</option>
							<option value="3" <c:if test="${search.releaseStatus==3}">selected</c:if>>放款成功</option>
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
					<label>放款时间：</label><input type="text" name="updateTimeBegin" value="${search.updateTimeBegin }" data-toggle="datepicker" size="10"
						data-pattern="yyyy-MM-dd" data-nobtn="true" data-rule="date">-
					<input type="text" name="updateTimeEnd" value="${search.updateTimeEnd }" data-toggle="datepicker" size="10"
						data-pattern="yyyy-MM-dd" data-nobtn="true" data-rule="date">
				</td>
			</tr>
			</table>
        </div>
    </form>
</div>
<div class="bjui-pageContent" id="release-paylist-search">
        <table data-toggle="tablefixed" data-width="100%">
    	<thead>
    	<tr>
    		<th align="center" width="24%">项目信息</th>
    		<th align="center" width="18%">融资方信息</th>
    		<th align="center" width="16%">融资金额(元)</th>
    		<th align="center" width="16%">放款金额(元)</th>
    		<th align="center" width="10%">放款状态</th>
    		<th align="center" width="16%">放款时间</th>
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
    		<td>
				<span class="text-tit pull-left">融资方：</span><a href="<%=request.getContextPath()%>/user/view.do?id=${list.loanUserId}" 
    				data-toggle="dialog" data-width="1000"  data-height="600" data-id="dialog-mask" 
    				data-mask="true" class="text-omit pull-left">${list.loanUserName }</a>
    		</td>
    		<td><fmt:formatNumber value="${list.projectMoney }" pattern="0.00"/></td>
    		<td><fmt:formatNumber value="${list.releaseMoney }" pattern="0.00"/></td>
    		<td align="center"><c:forEach var="item" items="${releaseStatusDesc}"><c:if test="${item.value==list.releaseStatus}">${item}</c:if></c:forEach></td>
    		<td align="center"><fmt:formatDate value="${list.updateTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
    	</tr>
    	</c:forEach>
    	</tbody>
    </table>
</div>
<%@ include file="/WEB-INF/jsp/common/pageFooter.jsp" %>
