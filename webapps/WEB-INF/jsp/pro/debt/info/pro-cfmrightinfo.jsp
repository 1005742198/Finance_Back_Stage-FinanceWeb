<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	.other-table th{background-color:#fff!important;text-align:center;}
	.other-table td{text-align:center;}
	.other-table .wrap_bjui_btn_box{width:100%;}
</style>
<!-- 核保 确权结果-->
<div class="bjui-pageContent" id="pro-cfmrightinfo">
		 <table class="table table-condensed table-hover table-auto">
		 	<thead>
		 		<tr><th colspan="3">项目融资情况</th></tr>
		 	</thead>
		 	<tbody>
				<tr>
					<td>
						<label class="control-label x130">项目编号：</label> 
						<span>${project.projectCode }</span>
					</td>
					<td colspan="2">
						<label class="control-label x130">项目名称：</label> 
						<span>${project.projectName}</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x130">融资方：</label> 
						<span>${project.loanUserName}</span>
					</td>
					<td>
						<label class="control-label x130">计划融资总额：</label> 
						<span><fmt:formatNumber value="${project.projectMoney}" pattern="0.00"/> 元</span>
					</td>
					<td>
						<label class="control-label x130">认购结束时间：</label> 
						<span><fmt:formatDate value="${project.buyTimeEnd}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x130">认购总额：</label> 
						<span><fmt:formatNumber value="${cfmright.applyTotalMoney}" pattern="0.00"/> 元</span>
					</td>
					<td>
						<label class="control-label x130">认购总人数：</label> 
						<span>${cfmright.applyUserNumbers}人</span>
					</td>
					<td>
						<label class="control-label x130">认购超募金额：</label> 
						<span><fmt:formatNumber value="${cfmright.applyOutMoney}" pattern="0.00"/> 元</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x130">认购到账总额：</label> 
						<span><fmt:formatNumber value="${cfmright.payReceivedMoney}" pattern="0.00"/> 元</span>
					</td>
					<td>
						<label class="control-label x130">认购到账总人数：</label> 
						<span>${cfmright.payReceivedUserNumbers}人</span>
					</td>
					<td>
						<label class="control-label x130">到账超募金额：</label> 
						<span><fmt:formatNumber value="${cfmright.payReceivedOutMoney}" pattern="0.00"/> 元</span>
					</td>
				</tr>
			 	<thead>
			 		<tr><th colspan="3">核保确权</th></tr>
			 	</thead>
			 	<tr>
					<td>
						<label class="control-label x130">核保时间：</label> 
						<span><fmt:formatDate value="${cfmright.cfmResultTime}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
					</td>
					<td colspan="2">
						<label class="control-label x130">核保人：</label> 
						<span>${cfmright.cfmOperatorName}</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x130">核保结果：</label> 
						<span>${cfmright.getBizMoneyCfmRightStatus() }</span>
					</td>
					<td colspan="2">
						<label class="control-label x130">放款结果：</label> 
						<span>${cfmright.getProReleaseStatus() }</span>
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
						<label class="control-label x130">确权总金额：</label> 
						<span><fmt:formatNumber value="${cfmright.cfmRightMoney}" pattern="0.00"/> 元</span>
					</td>
					<td colspan="2">
						<label class="control-label x130">确权认购总人数：</label> 
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
						<label class="control-label x130">应付融资方：</label> 
						<span><fmt:formatNumber value="${handleMoney}" pattern="0.00"/> 元</span>
					</td>
					<td colspan="2">
						<label class="control-label x130">融资费用总额：</label> 
						<span><fmt:formatNumber value="${cfmright.cfmRightMoney-handleMoney}" pattern="0.00"/> 元</span>
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
						<label class="control-label x130">融资顾问服务费率：</label> 
						<span><fmt:formatNumber value="${project.advioserFee*100}" pattern="0.000"/>%</span>
					</td>
					<td colspan="2">
						<label class="control-label x130">融资顾问费：</label> 
						<span><fmt:formatNumber value="${cfmright.rzAdvioserFee}" pattern="0.00"/> 元</span>
					</td>
					
				</tr>
				<tr>
					<td>
						<label class="control-label x130">平台服务费率：</label> 
						<span><fmt:formatNumber value="${project.platformFee*100}" pattern="0.000"/>%</span>
					</td>
					<td colspan="2">
						<label class="control-label x130">平台服务费：</label> 
						<span><fmt:formatNumber value="${cfmright.ptFee}" pattern="0.00"/> 元</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x130">默认承销服务费率：</label> 
						<span><fmt:formatNumber value="${project.investAdvioserFee*100}" pattern="0.000"/> %</span>
					</td>
					<td colspan="2">
						<label class="control-label x130">承销服务费总额：</label> 
						<span><fmt:formatNumber value="${cfmright.tzAdvioserFee }" pattern="0.00"/> 元</span>
					</td>
				</tr>
				<c:if test="${!cfmright.noSaleagent()}">
				<tr>
					<td colspan="3">
						<table class="table table-condensed table-hover other-table">
	            		<thead>
	                	<tr>
	                    <th width="20%">承销机构</th>
	                    <th width="10%">承销方式</th>
	                    <th width="20%">承销额度</th>
	                    <th width="20%">实际承销金额</th>
	                    <th width="10%">承销费率</th>
	                    <th width="10%">承销服务费用</th>
	                	</tr>
	            		</thead>
				        <tbody>
				        	<c:forEach var="agent" items="${cfmright.saleagentList}" varStatus="status"> 
				        	<tr>
				        	<td>${agent.saleMemberName }</td>
				        	<td>
				        	<c:forEach var="saleType" items="${saleTypeIdList}"> 	
				        		<c:if test="${agent.saleTypeId==saleType.typeId }">${saleType.typeName}</c:if>
		                    </c:forEach></td>
				        	<td><fmt:formatNumber value="${agent.saleMoney }" pattern="0.00"/> 元</td>
				        	<td><fmt:formatNumber value="${agent.saleCfmRightMoney }" pattern="0.00"/> 元</td>
				        	<td><fmt:formatNumber value="${agent.saleFeeRate}" type="PERCENT" maxFractionDigits="3" minFractionDigits="2"/></td>
				        	<td><fmt:formatNumber value="${agent.saleFee }" pattern="0.00"/> 元</td>
				        	</tr>
				        	</c:forEach>
				        </tbody>
	        			</table>
					</td>
				</tr>
				</c:if>
		 </table>
</div>
