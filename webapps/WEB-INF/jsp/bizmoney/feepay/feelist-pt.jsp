<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!--平台费用划拨列表 -->
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="<%=request.getContextPath()%>/fee/settle/ptfeepayapplylist.do" method="post">
        <div class="bjui-searchBar">
        	<label>费用时间：</label>
	        	<input type="text" name="feePeriodStartSearch" value="${search.feePeriodStartSearch }" class="form-control" size="15" data-toggle="datepicker"
				data-pattern="yyyy-MM-dd" data-current-month="-1" data-max-date="${search.searchMaxDate }"  data-nobtn="true" data-rule="date"/>
			<label>-</label>
			<input type="text" name="feePeriodEndSearch" value="${search.feePeriodEndSearch }" class="form-control" size="15" data-toggle="datepicker"
				data-pattern="yyyy-MM-dd" data-current-month="-1" data-max-date="${search.searchMaxDate }"   data-nobtn="true" data-rule="date"/>
           	<label>划付状态：</label><select name="payStatus" id="status" data-toggle="selectpicker" class="show-tick" style="display: none;" size="10">
				<option value="">-全部-</option>
				<c:forEach var="status" items="${feePayStatus }">
					<option value="${status.status }" <c:if test="${search.payStatus==status.status }">selected</c:if>>${status}</option>
				</c:forEach>
			</select>
            <button type="submit" class="btn-default" data-icon="search" data-clear-query="false">查询</button>
            <a class="btn btn-default" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">重置查询</a>
        </div>
    </form>
</div>
<div class="bjui-pageContent">
    <table data-toggle="tablefixed" data-width="100%">
    	<thead>
    	<tr>
    		<th align="center">结算编号</th>
    		<th align="center">费用周期</th>
    		<th align="center">项目个数</th>
    		<th align="center">确权总金额(元)</th>
    		<th align="center">费用总额(元)</th>
    		<th align="center">结算状态</th>
    		<th align="center">操作</th>
    	</tr>
    	</thead>
    	<tbody>
    	<c:forEach var="obj" items="${list }">
	    	<tr>
	    		<td>${obj.id }</td>
	    		<td><fmt:formatDate value="${obj.feePeriodStart }" pattern="yyyyMMdd"/>--<fmt:formatDate value="${obj.feePeriodEnd }" pattern="yyyyMMdd"/></td>
	    		<td>${obj.projectNumber }</td>    		
	    		<td><fmt:formatNumber value="${obj.projectTotalMoney }" pattern="0.00"/></td>
	    		<td><fmt:formatNumber value="${obj.feeTotalMoney }" pattern="0.00"/></td>
	    		<td><c:choose><c:when test="${obj.feeTotalMoney<=0 }">无划付</c:when><c:otherwise>${obj.getFeePayStatusDesc() }</c:otherwise></c:choose></td>
	    		<td>
		    		<c:if test="${powerlist.contains('/fee/settle/to-feepay-pay.do') && obj.isCanSettle() && obj.feeTotalMoney>0 }">
		  				<a href="<%=request.getContextPath()%>/fee/settle/to-feepay-pay.do?id=${obj.id}" 
		  				class="btn btn-blue" data-toggle="dialog" data-width="800"  
		  				data-height="500" data-id="dialog-mask" data-mask="true">费用结算</a>
		  			</c:if>
	  				<a href="<%=request.getContextPath()%>/fee/settle/feelist-child.do?feeId=${obj.id}&userId=0" 
	  				data-toggle="dialog" data-width="1000"  
	  				data-height="600" data-id="dialog-mask" data-mask="true">费用明细</a>
	  				<a href="<%=request.getContextPath()%>/fee/settle/pt-paylist.do?feeId=${obj.id}" 
	  				data-toggle="dialog" data-width="1000"  
	  				data-height="600" data-id="dialog-mask" data-mask="true">划付明细</a>
	    		</td>   
	    	</tr>
    	</c:forEach>
    </table>
</div>
<%@ include file="/WEB-INF/jsp/common/pageFooter.jsp" %>
