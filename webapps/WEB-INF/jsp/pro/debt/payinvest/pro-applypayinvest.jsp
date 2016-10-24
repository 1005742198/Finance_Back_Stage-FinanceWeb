<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 发起兑付划款 -->
<div class="bjui-pageContent">
	<form id="formSubmit" action="<%=request.getContextPath()%>/debt/proclaims/payinvest/apply.do" data-toggle="validate" data-confirm-msg="确定要提交嘛？"  data-callback="callback">
		<input type="hidden" name="relationId" value="${obj.id}">
		 <table class="table table-condensed table-hover" width="100%">
			 	<thead>
			 		<tr><th colspan="2">项目信息</th></tr>
			 	</thead>
				<tr align="left">
					<td>
						<label class="control-label x130">项目编号：</label> 
						<span>${obj.projectCode}</span>
					</td>
					<td>
						<label class="control-label x130">项目名称：</label> 
						<span>${obj.projectName}</span>
					</td>
				</tr>
				<tr align="left">
					<td>
						<label class="control-label x130">本期还款金额：</label> 
						<span><fmt:formatNumber value="${obj.paidPrincipal+obj.paidInterest+obj.paidOverInterest}"/>元</span>
						<input type="hidden" name="totalpaid" value="${obj.paidPrincipal+obj.paidInterest+obj.paidOverInterest-obj.paidInvestPrincipal-obj.paidInvestInterest-obj.paidInvestOverInterest}" data-rule="本期已还总额:required">
					</td>
					<td>
						<label class="control-label x130">本期还款日期：</label> 
						<span><fmt:formatDate value="${obj.lastRepayTime}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
					</td>
				</tr>
			 	<thead>
			 		<tr><th colspan="2">兑付信息</th></tr>
			 	</thead>
				<tr align="left">
					<td>
						<label class="control-label x130">兑付期数：</label> 
						<span>${obj.periodNumber}</span>
					</td>
					<td>
						<label class="control-label x130">应兑付日期：</label> 
						<span><fmt:formatDate value="${obj.payInvestDate}" pattern="yyyy-MM-dd"/></span>
					</td>
				</tr>
				<tr align="left">
					<td>
						<label class="control-label x130">本期未兑付本金：</label> 
						<span><fmt:formatNumber value="${obj.investPrincipal-obj.paidInvestPrincipal}" pattern="0.00"/>元</span>
					</td>
					<td>
						<label class="control-label x130">本期未兑付利息：</label> 
						<span><fmt:formatNumber value="${obj.investInterest-obj.paidInvestInterest}" pattern="0.00"/>元</span>
					</td>
				</tr>
				<tr align="left">
					<td>
						<label class="control-label x130">累计已兑金额：</label> 
						<span><fmt:formatNumber value="${obj.paidInvestPrincipal+obj.paidInvestInterest+obj.paidInvestOverInterest}" pattern="0.00"/>元</span>
					</td>
					<td>
						<label class="control-label x130">逾期罚息未兑付金额：</label> 
						<span><fmt:formatNumber value="${obj.investOverInterest-obj.paidInvestOverInterest}" pattern="0.00"/>元</span>
					</td>
				</tr>
				<tr align="left">
					<td>
						<label class="control-label x130">本期未兑付总额：</label> 
						<span><fmt:formatNumber value="${obj.investPrincipal+obj.investInterest+obj.investOverInterest-obj.paidInvestPrincipal-obj.paidInvestInterest-obj.paidInvestOverInterest}" pattern="0.00"/>元</span>
						<input type="hidden" name="total" value="${obj.investPrincipal+obj.investInterest+obj.investOverInterest-obj.paidInvestPrincipal-obj.paidInvestInterest-obj.paidInvestOverInterest}" data-rule="本期应还总额:required">
					</td>
					<td>
						<label class="control-label x130">逾期天数：</label> 
						<span>${obj.investOverDay}天</span>
					</td>
				</tr>
				<tr align="left">
					<td>
						<label class="control-label x130">可兑金额：</label> 
						<span><fmt:formatNumber value="${obj.investPrincipal+obj.investInterest+obj.investOverInterest-obj.paidInvestPrincipal-obj.paidInvestInterest-obj.paidInvestOverInterest}" pattern="0.00"/>元</span>
						<input type="hidden" name="vpaid" value="${obj.investPrincipal+obj.investInterest+obj.investOverInterest-obj.paidInvestPrincipal-obj.paidInvestInterest-obj.paidInvestOverInterest}">
					</td>
					<td>
						<label class="control-label x130">兑付投资者人数：</label> 
						<span>${total }人</span>
					</td>
				</tr>
				<c:choose>
					<c:when test="${empty projectMoneyApply}">
					<tr align="left">
						<td colspan="2">
							<label class="control-label x130">申请兑付划款金额：</label> 
							<input type="text" name="applyMoney" class="digitUppercase">元
						</td>
					</tr>
					<tr align="left">
						<td colspan="2">
							<label class="control-label x130">兑付申请意见：</label> 
							<textarea cols="40" rows="4"  data-rule="required;length[~200, true]" name="applyRemark"></textarea>
						</td>
					</tr>
					<tr>
						<td  align="center" colspan="2">
		    			<button type="submit" class="btn-blue">申请兑付划款</button>
						</td>
					</tr>
					</c:when>
					<c:when test="${not empty projectMoneyApply && projectMoneyApply.applyStatus == 1}">
						<tr align="left">
							<td colspan="2">
								<label class="control-label x130">兑付申请人：</label> 
								${projectMoneyApply.createOperatorName}
							</td>
						</tr>
						<tr align="left">
							<td colspan="2">
								<label class="control-label x130">申请结果：</label> 
								已申请复核中
							</td>
						</tr>
						<tr align="left">
							<td colspan="2">
								<label class="control-label x130">兑付申请历史：</label> 
								<a href="<%=request.getContextPath()%>/debt/proclaims/payinvest/applyhistory.do?relationId=${obj.id}" data-toggle="dialog" data-width="800"  
	    				data-height="600" data-id="applyhistory" data-mask="true">点击查看</a>
							</td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr align="left">
							<td colspan="2">
								<label class="control-label x130">申请结果：</label> 
								<c:forEach var="item" items="${SpecialApplyStatus}"><c:if test="${projectMoneyApply.applyStatus==item.status}">${item}</c:if></c:forEach>
							</td>
						</tr>
						<tr align="left">
							<td colspan="2">
								<label class="control-label x130">复核意见：</label> 
								${projectMoneyApply.auditRemark }
							</td>
						</tr>
						<tr align="left">
							<td colspan="2">
								<label class="control-label x130">兑付申请历史：</label> 
								<a href="<%=request.getContextPath()%>/debt/proclaims/payinvest/applyhistory.do?relationId=${obj.id}" data-toggle="dialog" data-width="800"  
	    				data-height="600" data-id="applyhistory" data-mask="true">点击查看</a>
							</td>
						</tr>
						<tr align="left">
							<td colspan="2">
								<label class="control-label x130">申请兑付划款金额：</label> 
								<input type="text" name="applyMoney" class="digitUppercase">元
							</td>
						</tr>
						<tr align="left">
							<td colspan="2">
								<label class="control-label x130">兑付申请意见：</label> 
								<textarea cols="40" rows="4"  data-rule="required;length[~200, true]" name="applyRemark"></textarea>
							</td>
						</tr>
						<tr>
							<td  align="center" colspan="2">
			    			<button type="submit" class="btn-blue">申请兑付划款</button>
							</td>
						</tr>
					</c:otherwise>
				</c:choose>
		 </table>
	</form>
</div>
<script type="text/javascript">
function callback(json) {
	if(json.statusCode == 200) {
		$(this).alertmsg("correct", json.message);
		$(this).dialog("closeCurrent");
		$(this).navtab("refresh");
	}else {
		$(this).alertmsg("error", json.message);
	}
}
$('#formSubmit').validator({
	rules: {
		 moreThanZero: function(element) {
	     	if(element.value > 0){
	     		return true;
	     	}else{
	     		return "实际兑付金额要大于0";
	     	}
	     		
	     }
	}, fields: {
		vpaid:'可兑金额:required;',
		applyMoney:'实际扣款金额:required;moreThanZero;match[lte, vpaid]',
		applyRemark:'required;length[~200, true]'
	}
});
</script>
