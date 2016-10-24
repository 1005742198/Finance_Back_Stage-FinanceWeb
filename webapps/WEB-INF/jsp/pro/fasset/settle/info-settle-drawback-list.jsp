<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!--结算退款明细-->
<form id="pagerForm"  data-toggle="ajaxsearch" action="<%=request.getContextPath()%>/fasset/proissue/settle/info-settle-drawback-list.do?projectId=${search.projectId}" method="post">
<input type="hidden" name="pageSize" value="${pageSize}">
 </form>
<div class="bjui-pageContent" id="info-settle-release-list">
 	<table class="table table-bordered table-hover table-striped table-top">
	<thead>
    	<tr>
    		<th width="17%">退款编号</th>
    		<th width="15%">收款方</th>
    		<th width="16%">收款账号</th>
    		<th width="15%">收款银行开户行</th>
    		<th width="13%">退款金额(元)</th>
    		<th width="7%">支付状态</th>
    		<th width="10%">退款时间</th>
    	</tr>
    	</thead>
    	<tbody>
    		<c:forEach var="obj" items="${list }">
		    	<tr>
		    		<td>${obj.paymentNo }</td>
		    		<td>${obj.accountName }</td>
		    		<td>${obj.cardAccount }</td>
		    		<td>${obj.cardProName }${obj.cardCityName }${obj.subBankName }</td>
		    		<td><fmt:formatNumber value="${obj.drawbackAmount }" pattern="0.00"/></td>
		    		<td>${obj.getPayStatusDesc() }</td>
		    		<td><fmt:formatDate value="${obj.payResultTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		    	</tr>
	    	  </c:forEach>
    	</tbody>
    </table> 
</div>
<%@ include file="/WEB-INF/jsp/common/pageFooter.jsp" %>
