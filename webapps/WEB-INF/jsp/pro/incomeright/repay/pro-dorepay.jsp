<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 发起还款扣款 -->
<script type="text/javascript">
function callback(json) {
	if(json.statusCode == 200) {
		$(this).alertmsg("correct", json.message);
		$(this).dialog("closeCurrent");
		$(this).navtab("refresh");
	}else {
		$(this).alertmsg("error", json.message);
		$(this).dialog("refresh");
	}
}
$('#formSubmit').validator({
	rules: {
		 moreThanZero: function(element) {
	     	if(element.value > 0){
	     		return true;
	     	}else{
	     		return "实际扣款金额要大于0";
	     	}
	     		
	     }
	}, fields: {
		total:'本期应还总额:required;',
		money:'实际扣款金额:required;moreThanZero;match[lte, total]'
	}
});
</script>
<div class="bjui-pageContent">
	<form id="formSubmit" action="<%=request.getContextPath()%>/incomeright/proclaims/repay/repay.do" data-toggle="validate" data-confirm-msg="确定要提交嘛？"  data-callback="callback">
		<input type="hidden" name="id" value="${obj.id}">
		<input type="hidden" name="versionNo" value="${obj.versionNo}">
		 <table class="table table-condensed table-hover" width="100%">
		 	<thead>
		 		<tr><th colspan="2">产品信息</th></tr>
		 	</thead>
			<tr align="left">
				<td colspan="2">
					<label class="control-label x110">产品编号：</label> 
					<span>${project.projectCode}</span>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<label class="control-label x110">产品名称：</label> 
					<span>${project.projectName}</span>
				</td>
			</tr>
		 	<thead>
		 		<tr><th colspan="2">还款信息</th></tr>
		 	</thead>
			<tr align="left">
				<td>
					<label class="control-label x110">还款期数：</label> 
					<span>${obj.periodNumber}</span>
				</td>
				<td>
					<label class="control-label x110">应还日期：</label> 
					<span><fmt:formatDate value="${obj.planRepayDate}" pattern="yyyy-MM-dd"/></span>
				</td>
			</tr>
			<tr align="left">
				<td>
					<label class="control-label x110">本期应还本金：</label> 
					<span><fmt:formatNumber value="${obj.principal-obj.paidPrincipal}" pattern="0.00"/>元</span>
				</td>
				<td>
					<label class="control-label x110">本期应还利息：</label> 
					<span><fmt:formatNumber value="${obj.interest-obj.paidInterest}" pattern="0.00"/>元</span>
				</td>
			</tr>
			<tr align="left">
				<td>
					<label class="control-label x110">逾期罚息金额：</label> 
					<span><fmt:formatNumber value="${obj.overInterest-obj.paidOverInterest}" pattern="0.00"/>元</span>
				</td>
				<td>
					<label class="control-label x110">逾期天数：</label> 
					<span>${obj.overDay}天</span>
				</td>
			</tr>
			<tr align="left">
				<td colspan="2">
					<label class="control-label x110">本期应还总额：</label> 
					<span><fmt:formatNumber value="${obj.principal-obj.paidPrincipal+obj.interest-obj.paidInterest+obj.overInterest-obj.paidOverInterest}" pattern="0.00"/>元</span>
					<input type="hidden" name="total" value="${obj.principal-obj.paidPrincipal+obj.interest-obj.paidInterest+obj.overInterest-obj.paidOverInterest}">
				</td>
			</tr>
		 	<thead>
		 		<tr><th colspan="2">扣款账户</th></tr>
		 	</thead>
			<tr align="left">
				<td colspan="2">
					<label class="control-label x110">扣款账户名：</label> 
					<span>${card.accountName}</span>
				</td>
			</tr>
			<tr align="left">
				<td colspan="2">
					<label class="control-label x110">扣款账户：</label> 
					<span>${card.cardAccount}</span>
				</td>
			</tr>
			<tr align="left">
				<td colspan="2">
					<label class="control-label x110">开户行：</label> 
					<span>${card.channelName}</span>
				</td>
			</tr>
			<tr align="left">
				<td colspan="2">
					<label class="control-label x110">实际扣款金额：</label> 
					<input type="text" name="money" class="digitUppercase">
				</td>
			</tr>
			<tr>
				<td  align="center" colspan="2">
    			<button type="submit" class="btn-blue">发起扣款</button>
    			<button type="button" class="btn-close" data-icon="close">关闭</button>
				</td>
			</tr>
		 </table>
	</form>
</div>