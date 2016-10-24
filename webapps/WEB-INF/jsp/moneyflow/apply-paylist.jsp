<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 
投资申购单资金支付明细
 -->
<div class="bjui-pageHeader" id="apply-paylist-search">
    <form id="pagerForm" data-toggle="ajaxsearch" action="<%=request.getContextPath()%>/moneyflow/applylist.do" method="post">
        <input type="hidden" name="pageSize" value="${pageSize}">
        <div class="bjui-searchBar">
            <label>项目编号：</label><input type="text" name="projectCode" value="<c:out value='${search.projectCode}'/>" class="form-control" size="10" data-rule="integer"/>
           	<label>项目名称：</label><input type="text" name="projectName" value="<c:out value='${search.projectName}'/>" class="form-control" size="20" />
            <label>投资者：</label><input type="text" name="orderUserName" value="<c:out value='${search.orderUserName}'/>" class="form-control" size="10" />
            <button type="button" class="showMoreSearch" data-toggle="moresearch" data-name="custom2">
            	<i class="fa fa-angle-double-down"></i></button>
            <button type="submit" class="btn-default" data-icon="search" data-clear-query="false">查询</button>
            <a class="btn btn-default" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">重置查询</a>
        </div>
        <div class="bjui-moreSearch">
			<table width="100%">
				<tr>
					<td>
						<label>支付状态：</label> 
						<select name="payStatus" id="select2" data-toggle="selectpicker" class="show-tick">
								<option value="">全部</option>
								<option value="2" <c:if test="${search.payStatus==2}">selected</c:if>>支付成功</option>
								<option value="5" <c:if test="${search.payStatus==5}">selected</c:if>>部分支付</option>
								<option value="1" <c:if test="${search.payStatus==1}">selected</c:if>>待支付</option>
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
						<label>资金支付时间：</label><input type="text" name="payCfmTimeBegin" value="${search.payCfmTimeBegin }" data-toggle="datepicker" size="10"
							data-pattern="yyyy-MM-dd" data-nobtn="true" data-rule="date">-
						<input type="text" name="payCfmTimeEnd" value="${search.payCfmTimeEnd }" data-toggle="datepicker" size="10"
							data-pattern="yyyy-MM-dd" data-nobtn="true" data-rule="date">
					</td>
				</tr>
				</table>
        </div>
    </form>
</div>
<div class="bjui-pageContent" id="apply-paylist-search">
        <table data-toggle="tablefixed" data-width="100%" >
    	<thead>
    	<tr>
    		<th align="center" width="22%">项目信息</th>
    		<th align="center" width="18%">投资者</th>
    		<th align="center" width="12%">认购金额(元)</th>
    		<th align="center" width="14%">认购时间</th>
    		<th align="center" width="12%">支付金额(元)</th>
    		<th align="center" width="8%">支付状态</th>
    		<th align="center" width="14%">支付时间</th>
    		<th align="center" width="6%">支付方式</th>
    	</tr>
    	</thead>
    	<tbody>
    	<tr>
    	<c:forEach var="list" items="${list}">
		<td>项目编号：${list.projectCode }<br />
    		<span class="text-tit pull-left">项目名称：</span><a href="<%=request.getContextPath()%>/moneyflow/getprojectinfo.do?id=${list.projectId}" 
    				data-toggle="dialog" data-width="1000"  data-height="600" data-id="dialog-mask" 
    				data-mask="true" class="text-omit pull-left">${list.projectName }</a>

    		</td>
    		<td>${list.showName()}</td>
    		<td><fmt:formatNumber value="${list.orderMoney }" pattern="0.00"/></td>
    		<td><fmt:formatDate value="${list.createTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
    		<td><fmt:formatNumber value="${list.paidMoney }" pattern="0.00"/></td>
    		<td align="center"><c:forEach var="item" items="${payStatusDesc}"><c:if test="${item.status==list.payStatus}">${item}</c:if></c:forEach></td>
    		<td><fmt:formatDate value="${list.payCfmTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
    		<td><c:choose><c:when test="${list.orderPayType==null}">场外</c:when><c:when test="${list.orderPayType==2}">线下</c:when><c:otherwise>线上</c:otherwise></c:choose></td>
    	</tr>
    	</c:forEach>
    	</tbody>
    </table>
</div>
<%@ include file="/WEB-INF/jsp/common/pageFooter.jsp" %>
