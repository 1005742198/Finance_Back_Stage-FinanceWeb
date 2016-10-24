<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 核保通过后，放款 -->
<div class="bjui-pageContent" id="pro-doreleasemoney">
	<form id="mainForm" action="<%=request.getContextPath()%>/incomeright/settle/releaseapply.do" data-toggle="validate" data-callback="afterSubmit">
		 <input type="hidden" name="relationId" value="${project.id }">
		 <table class="table table-condensed table-hover" width="100%">
		 	<tbody>
				<tr>
					<td>
						<label class="control-label x140">产品编号：</label> 
						<span>${project.projectCode }</span>
					</td>
					<td>
						<label class="control-label x140">产品名称：</label> 
						<span>${project.projectName }</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">募集金额：</label> 
						<span><fmt:formatNumber value="${cfmright.cfmRightMoney }" pattern="0.00"/> 元</span>
					</td>
					<td>
						<label class="control-label x140">融资费用：</label> 
						<span><fmt:formatNumber value="${sumFee }" pattern="0.00"/> 元</span>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x140">放款金额：</label> 
						<span><fmt:formatNumber value="${handleMoney }" pattern="0.00"/> 元</span>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x140">通过交易所还款兑付：</label> 
						<span><c:choose><c:when test="${project.manageDuration==1 }">通过</c:when><c:otherwise>不通过</c:otherwise></c:choose></span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">发行人：</label> 
						<span>${project.loanUserName }</span>
					</td>
					<td>
						<label class="control-label x140">收款账号：</label> 
						<span>${project.cardAccount }</span>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x140">收款银行：</label> 
						<span>${project.bankChannelName }${project.subBankName }</span>
					</td>
				</tr>
				<c:choose>
					<c:when test="${empty projectMoneyApply}">
						<tr>
							<td colspan="2">
								<label class="control-label x140">放款申请意见：</label> 
								<textarea cols="40" rows="4"  data-rule="required;length[~200, true]" name="applyRemark"></textarea>
							</td>
						</tr>
						<tr>
							<td align="center" colspan="2">
							<button type="submit" class="btn-blue" >申请放款</button>
							</td>
						</tr>
					</c:when>
					<c:when test="${not empty projectMoneyApply && projectMoneyApply.applyStatus == 1}">
						<tr>
							<td colspan="2">
								<label class="control-label x140">放款申请人：</label> 
								${projectMoneyApply.createOperatorName}
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<label class="control-label x140">申请结果：</label> 
								已申请复核中
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<label class="control-label x140">放款申请历史：</label> 
								<a href="<%=request.getContextPath()%>/incomeright/settle/applyhistory.do?relationId=${project.id}" data-toggle="dialog" data-width="800"  
	    				data-height="600" data-id="applyhistory" data-mask="true">点击查看</a>
							</td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="2">
								<label class="control-label x140">申请结果：</label> 
								<c:forEach var="item" items="${SpecialApplyStatus}"><c:if test="${projectMoneyApply.applyStatus==item.status}">${item}</c:if></c:forEach>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<label class="control-label x140">复核意见：</label> 
								${projectMoneyApply.auditRemark }
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<label class="control-label x140">放款申请历史：</label> 
								<a href="<%=request.getContextPath()%>/incomeright/settle/applyhistory.do?relationId=${project.id}" data-toggle="dialog" data-width="800"  
	    				data-height="600" data-id="applyhistory" data-mask="true">点击查看</a>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<label class="control-label x140">放款申请意见：</label> 
								<textarea cols="40" rows="4"  data-rule="required;length[~200, true]" name="applyRemark"></textarea>
							</td>
						</tr>
						<tr>
							<td align="center" colspan="2">
							<button type="submit" class="btn-blue" >申请放款</button>
							</td>
						</tr>
					</c:otherwise>
				</c:choose>
		 </table>
	</form>
</div>
<script>
function afterSubmit(json){
	if(json.statusCode == 200){
		$(this).alertmsg("correct", json.message, {autoClose:false,okCall:function(){$(this).dialog("closeCurrent");$(this).navtab("refresh");}});
	}else{
		$(this).alertmsg("error", json.message);
	}
}

</script>
