<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 核保 确权结果-->
<div class="bjui-pageContent">
		 <table class="table table-condensed table-hover" width="100%">
		 	<thead>
		 		<tr><th colspan="3">项目情况</th></tr>
		 	</thead>
		 	<tbody>
				<tr>
					<td>
						<label class="control-label x130">转让方：</label> 
						<span>${project.loanUserName}</span>
					</td>
					<td>
						<label class="control-label x130">挂牌金额：</label> 
						<span><fmt:formatNumber value="${project.projectMoney}" pattern="0.00"/> 元</span>
					</td>
					<td>
						<label class="control-label x130">转让结束时间：</label> 
						<span><fmt:formatDate value="${project.buyTimeEnd}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x130">报价人数：</label> 
						<span>${cfmright.applyUserNumbers}人</span>
					</td>
					<td>
						<label class="control-label x130">到账总额：</label> 
						<span><fmt:formatNumber value="${cfmright.payReceivedMoney}" pattern="0.00"/> 元</span>
					</td>
					<td>
						<label class="control-label x130">到账总人数：</label> 
						<span>${cfmright.payReceivedUserNumbers}人</span>
					</td>
				</tr>
			 	<thead>
			 		<tr><th colspan="3">核保确权</th></tr>
			 	</thead>
				<tr>
					<td>
						<label class="control-label x130">核保结果：</label> 
						<span>${cfmright.getBizMoneyCfmRightStatus() }</span>
					</td>
					<td colspan="2">
						<c:if test="${cfmright.cfmStatus==4}">
						<label class="control-label x130">撤销原因：</label> 
						<span><c:forEach var="item" items="${ContractStatusDesc}"><c:if test="${item.value==cfmright.contractStatus}">${item }</c:if></c:forEach></span>
						</c:if>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<label class="control-label x130">核保意见：</label> 
						<span>${cfmright.cfmRemark}</span>
					</td>
				</tr>
				<!--确权总金额/人数，确权通过才需要显示 -->
				<tr>
					<td>
						<label class="control-label x130">成交金额：</label> 
						<span><fmt:formatNumber value="${cfmright.cfmRightMoney}" pattern="0.00"/> 元</span>
					</td>
					<td colspan="2">
						<label class="control-label x130">成交人数：</label> 
						<span>${cfmright.cfmRightUserNumbers}人</span>
					</td>
				</tr>
				<!--核保不通过/出现超募,需要显示-->
				<tr>
					<td>
						<label class="control-label x130">需退款总金额：</label> 
						<span><fmt:formatNumber value="${cfmright.unRightMoney}" pattern="0.00"/> 元</span>
					</td>
					<td>
						<label class="control-label x130">需退款总人数：</label> 
						<span>${cfmright.unRightUserNumbers}人</span>
					</td>
					<td>
						<label class="control-label x130">退款情况：</label> 
						<span>${cfmright.getDrawbackStatusDesc() }</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x130">需放款金额：</label> 
						<span><fmt:formatNumber value="${handleMoney }" pattern="0.00"/> 元</span>
					</td>
					<td>
						<label class="control-label x130">收款方：</label> 
						<span>${project.loanUserName }</span>
					</td>
					<td>
						<label class="control-label x130">放款情况：</label> 
						<span>${cfmright.getProReleaseStatus() }</span>
					</td>
				</tr>
				</tbody>
				<!-- 以下费用确权通过才需要显示 -->
			 	<thead>
			 		<tr><th colspan="3">融资费用明细</th></tr>
			 	</thead>
			 	<tbody>
				<tr>
					<td>
						<label class="control-label x130">交易顾问服务费率：</label> 
						<span><fmt:formatNumber value="${project.advioserFee*100}" pattern="0.000"/>%</span>
					</td>
					<td colspan="2">
						<label class="control-label x130">交易顾问服务费：</label> 
						<span><fmt:formatNumber value="${project.advioserFee*cfmright.cfmRightMoney}" pattern="0.00"/> 元</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x130">投资顾问服务费率：</label> 
						<span><fmt:formatNumber value="${project.investAdvioserFee*100}" pattern="0.000"/>%</span>
					</td>
					<td colspan="2">
						<label class="control-label x130">投资顾问服务费：</label> 
						<span><fmt:formatNumber value="${cfmright.cfmRightMoney*project.investAdvioserFee}" pattern="0.00"/> 元</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x130">平台运营费率：</label> 
						<span><fmt:formatNumber value="${project.platformFee*100}" pattern="0.000"/>%</span>
					</td>
					<td colspan="2">
						<label class="control-label x130">平台运营费用：</label> 
						<span><fmt:formatNumber value="${cfmright.cfmRightMoney*project.platformFee}" pattern="0.00"/> 元</span>
					</td>
					
				</tr>
		 </table>
</div>