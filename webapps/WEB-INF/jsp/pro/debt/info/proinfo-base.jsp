<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	.other-table th{background-color:#fff!important;text-align:center;}
	.other-table td{text-align:center;}
	.other-table .wrap_bjui_btn_box{width:100%;}
</style>
<!-- 录入项目 -->
<div class="bjui-pageContent">
		 <table class="table table-condensed table-hover" width="100%">
		 	<thead>
		 	</thead>
		 	<tbody>
		 		<tr>
		 			<td>
						<label class="control-label x110">业务类型：</label> 
						<span>直接融资项目</span>
					</td>
					<td>
						<label class="control-label x110">项目类型：</label> 
						<span><c:forEach var="item" items="${systypeProjectList}" varStatus="status">
								<c:if test="${item.id==obj.projectTypeId}">${item.typeName}</c:if>
							</c:forEach></span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x110">备案代码：</label> 
						<span>${record.recordCode}</span>
					</td>
					<td>
						<label class="control-label x110">备案简称：</label> 
						<span>${record.recordName}</span>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x110">备案核准规模：</label> 
						<span>${record.projectMoney}</span>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x110">融资方：</label> 
						<span>${obj.loanUserName}</span>
					</td>
				</tr>
			</tbody>
		 	<thead>
		 		<tr><th colspan="2">挂牌信息</th></tr>
		 	</thead>
		 	<tbody>
				<tr>
					<td colspan="2">
						<label class="control-label x110">挂牌代码：</label> 
						<span>${obj.projectCode}</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x110">挂牌名称：</label> 
						<span>${obj.projectFullName}</span>
					</td>
					<td>
						<label class="control-label x110">挂牌简称：</label> 
						<span>${obj.projectName}</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x110">拟融资规模：</label> 
						<span><fmt:formatNumber value="${obj.projectMoney}"/>元</span>
					</td>
					<td>
						<label class="control-label x110">融资额下限：</label> 
						<span><fmt:formatNumber value="${obj.projectAmountMin*obj.projectUnitPrice}"/>元</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x110">项目期限：</label> 
						<span>${obj.projectLimit}<c:forEach var="item" items="${projectLimitTypeList}">
							<c:if test="${item.typeId==obj.projectLimitTypeId}">${item.typeName}</c:if>
							</c:forEach></span>
					</td>
					<td>
						<label class="control-label x110">预期年化收益率：</label> 
						<span><fmt:formatNumber value="${obj.investProfit*100}" pattern="0.00"/>%</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x110"><c:if test="${obj.releaseStatus!=3}">预计</c:if>起息日：</label> 
						<span><fmt:formatDate value="${obj.valueDate}" pattern="yyyy-MM-dd"/></span>
					</td>
					<td>
						<label class="control-label x110"><c:if test="${obj.releaseStatus!=3}">预计</c:if>到期日：</label> 
						<span><fmt:formatDate value="${obj.expireDate}" pattern="yyyy-MM-dd"/></span>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x110">收款账户：</label> 
						<span>${bankcard.channelName}<c:if test="${bankcard.cardAccountShow!=null}">[${bankcard.cardAccountShow}]</c:if></span>
					</td>
				</tr>
		 		<tr>
		 			<td colspan="2">
						<label class="control-label x110">还款方式：</label> 
						<span><c:forEach var="item" items="${systypeRepayList}" varStatus="status">
								<c:if test="${item.id==obj.repayTypeId}">${item.repayTypeName}</c:if>
							</c:forEach></span>
					</td>
		 		</tr>
		 		<tr>
					<td colspan="2">
						<label class="control-label x110">兑付日：</label> 
						<span id="settleInvestDaySpan">
						<c:if test="${obj.repayTypeId==1 }">产品到期日的所属工作日</c:if>
						<c:if test="${obj.repayTypeId!=1 }">
						<c:choose>
						<c:when test="${obj.repayTypeId==5 }">产品设立日起每季末月</c:when>
						<c:when test="${obj.repayTypeId==6 }">产品设立日起每年度 ${obj.getSettleInvestMonthShow()} 月 </c:when>
						<c:otherwise>产品设立日起每月</c:otherwise>
						</c:choose>
						${obj.getSettleInvestDayShow()} 日的所属工作日
						</c:if>
						</span>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x110">还款日：</label> 
						早于兑付日 ${obj.repayPeriodDay} 个工作日
					</td>
				</tr>
		 	</tbody>
			<thead>
		 		<tr><th colspan="2">认购信息</th></tr>
		 	</thead>
		 	<tbody>
		 		<tr>
					<td  colspan="2">
						<label class="control-label x110">单笔起投金额：</label> 
						<span><fmt:formatNumber value="${obj.investAmountMin*obj.projectUnitPrice}"/>元</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x110">追加单位金额：</label> 
						<span><fmt:formatNumber value="${obj.investAmountAppend*obj.projectUnitPrice}"/>元</span>
					</td>
					<td>
						<label class="control-label x110">每人累计上限：</label> 
						<span><fmt:formatNumber value="${obj.investAmountMax*obj.projectUnitPrice}"/>元</span>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x110">发布时间：</label> 
						<span><fmt:formatDate value="${obj.publishTime}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x110">认购开始时间：</label> 
						<span><fmt:formatDate value="${obj.buyTimeStart}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
					</td>
					<td>
						<label class="control-label x110">募集期结束时间：</label> 
						<span><fmt:formatDate value="${obj.buyTimeEnd}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
					</td>
				</tr>
			</tbody>
			<thead>
		 		<tr><th colspan="2">相关费率及投资顾问设置</th></tr>
		 	</thead>
		 	<tbody>
		 		<tr>
					<td>
						<label class="control-label x140">融资顾问服务费率：</label> 
						<span><fmt:formatNumber value="${obj.advioserFee}" type="PERCENT" maxFractionDigits="3" minFractionDigits="2"/></span>
					</td>
					<td>
						<label class="control-label x140">逾期兑付罚息率：</label> 
						<span><fmt:formatNumber value="${obj.overduePayFee}" type="PERCENT" maxFractionDigits="4" minFractionDigits="4"/></span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">默认投资顾问服务费率：</label> 
						<span><fmt:formatNumber value="${obj.investAdvioserFee}" type="PERCENT" maxFractionDigits="3" minFractionDigits="2"/></span>
					</td>
					<td>
						<label class="control-label x140">平台运营服务费率：</label> 
						<span ><fmt:formatNumber value="${obj.platformFee}" type="PERCENT" maxFractionDigits="3" minFractionDigits="2"/></span>
					</td>
				</tr>
				<c:if test="${saleagentList!=null && saleagentList.size()>0 }">
				<tr>
					<td colspan="2">
					<table class="table table-condensed table-hover other-table">
            		<thead>
                	<tr>
                    <th width="30%">指定投资顾问</th>
                    <th width="20%">销售方式</th>
                    <th width="20%">销售额度</th>
                    <th width="20%">指定顾问服务费率</th>
                	</tr>
            		</thead>
			        <tbody>
			        	<c:forEach var="agent" items="${saleagentList}" varStatus="status"> 
			        	<tr>
			        	<td>${agent.saleMemberName }</td>
			        	<td>
			        	<c:forEach var="saleType" items="${saleTypeIdList}"> 	
			        		<c:if test="${agent.saleTypeId==saleType.typeId }">${saleType.typeName}</c:if>
	                    </c:forEach></td>
			        	<td>${agent.saleMoney }</td>
			        	<td><fmt:formatNumber value="${agent.saleFeeRate}" type="PERCENT" maxFractionDigits="3" minFractionDigits="2"/></td>
			        	</tr>
			        	</c:forEach>
			        </tbody>
        			</table>
					</td>
				</tr>
				</c:if>
			</tbody>
			<thead>
		 		<tr><th colspan="2">交易相关及投资者资格要求</th></tr>
		 	</thead>
		 	<tbody>
		 		<tr>
					<td colspan="2">
						<label class="control-label x160">交易方式：</label> 
						<span><c:if test="${1==obj.tradeType }">场内交易</c:if><c:if test="${2==obj.tradeType }">场外交易</c:if><c:if test="${3==obj.tradeType }">场内+场外交易</c:if></span>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x160">募集期的投资资金结算方式：</label> 
						<span>${obj.settleName() }</span>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x160">是否通过交易所还款兑付：</label> 
						<span><c:choose><c:when test="${project.manageDuration==1}">是</c:when><c:otherwise>否</c:otherwise></c:choose></span>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x160">是否允许转让：</label> 
						<span><c:if test="${obj.canTransfer==1 }">项目成立日后第${obj.transferAfter }天开始，转让期限为${obj.transferLimit }天</c:if><c:if test="${obj.canTransfer==0 }">否</c:if></span>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x160">合格投资者资格要求：</label> 
						<span>${content.tradePartyQualification}</span>
					</td>
				</tr>
			</tbody>
		 </table>
</div>
