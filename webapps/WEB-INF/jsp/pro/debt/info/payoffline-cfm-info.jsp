<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!--金融资产转让线下支付凭证到款操作 -->
<div class="bjui-pageHeader"  id="bidlist-payoffline-cfm-header">
<table class="table table-condensed table-hover" width="100%">
        <tbody>
            <tr>
                <td>
                    <label class="control-label x120">投资者：</label>
                    <span>${orderApply.orderUserName}</span>
                    <label class="control-label x120">认购时间：</label>
                    <span><fmt:formatDate value="${orderApply.createTime}"/></span>
                    <label class="control-label x120">认购金额：</label>
                    <span><fmt:formatNumber value="${orderApply.orderMoney}" pattern="0.00" maxFractionDigits="2"/>元</span>
                </td>
            </tr>
            <tr>
                <td>
                    <label class="control-label x120">已支付金额：</label>
                    <span><fmt:formatNumber value="${orderApply.paidMoney}" pattern="0.00" maxFractionDigits="2"/>元</span>
                </td>
            </tr>
   	</tbody>
  </table>
</div>
<div class="bjui-pageContent" id="bidlist-payoffline-cfm-list">
 <table data-toggle="tablefixed" data-width="100%" data-height="300">
    	<thead>
    	<tr>
    		<th align="center" width="12%">付款银行</th>
    		<th align="center" width="14%">银行交易流水号</th>
    		<th align="center" width="14%">付款账户</th>
    		<th align="center" width="11%">付款金额</th>
    		<th align="center" width="13%">付款时间</th>
    		<th align="center" width="6%">是否到款</th>
    		<th align="center" width="11%">到款金额</th>
    		<th align="center" width="13%">到款时间</th>
    		<th align="center" width="6%">支付状态</th>
    	</tr>
    	</thead>
    	<tbody>
    	  <c:if test="${not empty list}">
    	  	<c:forEach items="${list}" var="obj" varStatus="status">
    		<tr>
    			<td>${obj.transferBankName}</td>
    			<td>${obj.paymentSeq}</td>
    			<td>${obj.transferAccount}</td>
    			<td><fmt:formatNumber value="${obj.transferMoney}"  pattern="0.00" maxFractionDigits="2"/>元</td>
    			<td align="center">
    				<fmt:formatDate value="${obj.transferTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
    			</td>
    			<td align="center">
    				<c:forEach items="${transferStatus}" var="item">
    					<c:if test="${obj.transferStatus == item.type}">${item}</c:if>
    				</c:forEach>
					
	    		</td>
	    		<!-- 确认金额 -->
    			<td>
    				<c:choose>
    					<c:when test="${obj.transferStatus == 3}">
    						--
    					</c:when>
    					<c:otherwise>
    						${obj.confirmMoney}元
    					</c:otherwise>
    				</c:choose>
				</td>
				<!-- 确认时间 -->
    			<td align="center">
    				<c:choose>
    					<c:when test="${obj.transferStatus == 3}">
    						--
    					</c:when>
    					<c:otherwise>
    						<fmt:formatDate value="${obj.confirmTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
    					</c:otherwise>
    				</c:choose>
				</td>
				<!-- 支付状态 -->
				<td align="center">
    				<c:choose>
    					<c:when test="${obj.transferStatus == 3}">
    						--
    					</c:when>
    					<c:otherwise>
    						<c:forEach items="${payStatus}" var="item">
    							<c:if test="${obj.payStatus == item.status }">${item}</c:if>
    						</c:forEach>
    					</c:otherwise>
    				</c:choose>
    			</td>
    		</tr>
    		</c:forEach>
    	  </c:if>
    		
    	</tbody>
    </table> 
</div>
<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close">关闭</button></li>
    </ul>
</div>

