<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="<%=request.getContextPath()%>/debt/orderapply/list.do?projectId=${search.projectId}" method="post">
        <input type="hidden" name="pageSize" value="${pageSize}">
        <div class="bjui-searchBar">
            <label>投资者：</label><input type="text" name="orderUserName" value="<c:out value='${search.orderUserName}'/>" class="form-control" size="10" />
           	<label>到账状态：</label> 
			<select name="payStatus" id="select2" data-toggle="selectpicker" class="show-tick" style="display: none;">
				<option value="">全部</option>
				<c:forEach var="item" items="${payStatusDesc}">
				<c:if test="${item.status!=0}">
				<option value="${item.status}" <c:if test="${search.payStatus==item.status}">selected</c:if>>${item}</option>
				</c:if>
				</c:forEach>
			</select>
            <button type="submit" class="btn-default" data-icon="search" data-clear-query="false">查询</button>
            <a class="btn btn-default" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">重置查询</a>
        </div>
    </form>
</div>

<div class="bjui-pageContent"  id="pro-applylist-list">
    <table data-toggle="tablefixed" data-width="100%" data-height="100%">
    	<thead>
    	<tr>
    		<th align="center" width="13%">投资者</th>
    		<th align="center" width="14%">认购时间</th>
    		<th align="center" width="12%">认购金额(元)</th>
    		<th align="center" width="12%">到账金额(元)</th>
    		<th align="center" width="6%">到账状态</th>
    		<th align="center" width="14%">到账时间</th>
    		<th align="center" width="6%">支付方式</th>
    		<th align="center" width="12%">确认金额(元)</th>
    		<th align="center" width="12%">退款金额(元)</th>
    	</tr>
    	</thead>
    	<tbody>
    	<c:forEach var="list" items="${list}">
    		<tr>
    		<td>${list.orderUserName}</td>
    		<td>
    		<fmt:formatDate value="${list.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
    		</td>
    		<td>${list.orderMoney}</td>
    		<td>${list.paidMoney}</td>
    		<td>
    		<c:forEach var="item" items="${payStatusDesc}"><c:if test="${item.status==list.payStatus}">${item}</c:if></c:forEach>
    		</td>
    		<td>
    		<fmt:formatDate value="${list.payCfmTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
    		</td>
    		<td><c:choose><c:when test="${list.payStatus==1&&list.orderPayType==null}"></c:when><c:when test="${list.orderPayType==null}">场外</c:when><c:when test="${list.orderPayType==2}">线下</c:when><c:otherwise>线上</c:otherwise></c:choose></td>
    		<td>${list.cfmMoney}</td>
    		<td>${list.refundMoney}</td>
    	</tr>
    	</c:forEach>
    	</tbody>
    </table>
</div>
<%@ include file="/WEB-INF/jsp/common/pageFooter.jsp" %>
