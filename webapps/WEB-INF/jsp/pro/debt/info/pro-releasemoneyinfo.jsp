<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 放款结果-->
<div class="bjui-pageContent" id="pro-releasemoneyinfo">
		 <table class="table table-condensed table-hover" width="100%">
		 	<tbody>
				<tr>
					<td>
						<label class="control-label x130">融资方：</label> 
						<span>${obj.loanUserName}</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x130">认购结束时间：</label> 
						<span><fmt:formatDate value="${obj.buyTimeEnd}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x130">应付融资方：</label> 
						<span><fmt:formatNumber value="${obj.projectMoney}" pattern="0.00"/></span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x130">收款银行：</label> 
						<span>${bankcard.channelName}</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x130">收款银行账户：</label> 
						<span>${bankcard.cardAccount}</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x130">收款银行账户名：</label> 
						<span>${bankcard.accountName}</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x130">放款结果：</label> 
						<span><c:forEach var="item" items="${releaseStatusDesc}"><c:if test="${item.value==realse.releaseStatus}">${item}</c:if></c:forEach></span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x130">放款时间：</label> 
						<span><fmt:formatDate value="${realse.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x130">放款人：</label> 
						<span>${realse.createOperatorName}</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x130">放款审核意见：</label> 
						<span>${realse.adutiRemarke}</span>
					</td>
				</tr>
				<tr>
					<td colspan="3" align="center">
	    			<button type="button" class="btn-close" data-icon="close">关闭</button>
					</td>
				</tr>
				</tbody>
		 </table>
</div>