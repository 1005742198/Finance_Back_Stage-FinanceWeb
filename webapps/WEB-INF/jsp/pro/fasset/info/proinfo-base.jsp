<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 录入项目 -->
<div class="bjui-pageContent" id="fasset-project-baseinfo">
		 <table class="table table-condensed table-hover table-auto" width="100%">
		 	<thead>
		 		<tr><th colspan="2">标的信息</th></tr>
		 	</thead>
		 	<tbody>
				<tr>
					<td>
						<label class="control-label x130">标的编号：</label> 
						<span>${obj.projectCode}</span>
					</td>
					<td>
						<label class="control-label x130">标的简称：</label> 
						<span>${obj.projectName}</span>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x130">标的全称：</label> 
						<span>${obj.projectFullName}</span>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x130">标的类型：</label> 
						<span><c:forEach var="item" items="${systypeProjectList}" varStatus="status">
								<c:if test="${item.id==obj.projectTypeId}">${item.typeName}</c:if>
							</c:forEach></span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x130">转让方：</label> 
						<span>${obj.loanUserName}</span>
					</td>
					<td>
						<label class="control-label x130">挂牌金额：</label> 
						<span><fmt:formatNumber value="${obj.projectMoney}" pattern="0.00"/>元</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x130">挂牌天数：</label> 
						<span>${obj.projectLimit}天</span>
					</td>
					<td>
						<label class="control-label x130">市场评估价格：</label> 
						<span><fmt:formatNumber value="${obj.projectAmountMin*obj.projectUnitPrice}" pattern="0.00"/>元</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x130">转让方式：</label> 
						<span>${obj.getTransferTypeDesc() }</span>
					</td>
					<td>
						<label class="control-label x130">收款账户：</label> 
						<span>${bankcard.channelName}<c:if test="${bankcard.cardAccountShow!=null}">[${bankcard.cardAccountShow}]</c:if></span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x130">标的所在地：</label> 
						<span>${obj.proName }${obj.cityName }</span>
					</td>
					<td>
						<label class="control-label x130">标的所属行业：</label> 
						<span>${obj.industryName}</span>
					</td>
				</tr>
			</tbody>
			<thead>
		 		<tr><th colspan="2">挂牌及意向报价信息</th></tr>
		 	</thead>
		 	<tbody>
				<tr>
					<td>
						<label class="control-label x130">发布时间：</label> 
						<span><fmt:formatDate value="${obj.publishTime}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
					</td>
					<td>
						<label class="control-label x130">转让开始时间：</label> 
						<span><fmt:formatDate value="${obj.buyTimeStart}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x130">转让底价：</label> 
						<span><fmt:formatNumber value="${obj.investAmountMin*obj.projectUnitPrice}" pattern="0.00"/>元</span>
					</td>
					<td>
						<label class="control-label x130">转让结束时间：</label> 
						<span><fmt:formatDate value="${obj.buyTimeEnd}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x130">追加单位金额：</label> 
						<span><fmt:formatNumber value="${obj.investAmountAppend*obj.projectUnitPrice}" pattern="0.00"/>元</span>
					</td>
				</tr>
			</tbody>
			<thead>
		 		<tr><th colspan="2">转让相关及受让方资格条件</th></tr>
		 	</thead>
		 	<tbody>
				<tr>
					<td>
                        <label for="" class="control-label x130">交易保证金：</label>
						<span><fmt:formatNumber value="${obj.guaranteeMoney }" pattern="0.00"/><c:if test="${obj.guaranteeValueType ==1 }">元</c:if><c:if test="${obj.guaranteeValueType ==2 }">%</c:if></span>
					</td>
					<td>
                        <label for="" class="control-label x130">结算方式：</label>
						<span>${obj.getSettleTypeDesc() }</span>
					</td>
				</tr>
				<tr>
					<td colspan="2">
                        <label for="" class="control-label x130">尾款支付期限：</label>
						转让成交后<span>${obj.paySettleDay }</span>个交易日内
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x130">转让相关其他条件：</label> 
						<span>${obj.tradeTerm }</span>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x130">受让方资格条件：</label> 
						<span>${obj.tradePartyQualification }</span>
					</td>
				</tr>
			</tbody>
			<thead>
		 		<tr><th colspan="2">服务费率</th></tr>
		 	</thead>
		 	<tbody>
				<tr>
					<td>
						<label class="control-label x130">交易顾问服务费率：</label> 
						<span><fmt:formatNumber value="${obj.advioserFee*100}" pattern="0.000"/>%</span>
					</td>
					<td>
						<label class="control-label x130">平台运营服务费率：</label> 
						<span ><fmt:formatNumber value="${obj.platformFee*100}" pattern="0.000"/>%</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x130">投资顾问服务费率：</label> 
						<span><fmt:formatNumber value="${obj.investAdvioserFee*100}" pattern="0.000"/>%</span>
					</td>
					<td>&nbsp;
					</td>
				</tr>
			</tbody>
			<thead>
		 		<tr><th colspan="2">标的详情</th></tr>
		 	</thead>
			<tr>
				<td colspan="2"><c:out value="${obj.projectInfo}" escapeXml="true"></c:out></td>
			</tr>
		 </table>
</div>
