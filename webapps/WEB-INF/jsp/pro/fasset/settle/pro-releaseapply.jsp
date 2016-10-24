<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 核保通过后，放款 -->
<div class="bjui-pageContent" id="pro-doreleasemoney">
	<form id="mainForm" action="<%=request.getContextPath()%>/debt/proissue/settle/releaseapply.do" data-toggle="validate" data-callback="afterSubmit">
		 <input type="hidden" name="relationId" value="${project.id }">
		 <table class="table table-condensed table-hover" width="100%">
		 	<tbody>
				<tr>
					<td>
						<label class="control-label x140">项目编号：</label> 
						<span>${project.projectCode }</span>
					</td>
					<td>
						<label class="control-label x140">项目名称：</label> 
						<span>${project.projectName }</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">转让方：</label> 
						<span>${project.loanUserName }</span>
					</td>
					<td>
						<c:if test="${project.transferType ==2 }">
							<label class="control-label x140">成交方：</label> 
								<span>
								<c:if test="${empty dealUserName}">
										无
								</c:if>
								<c:if test="${not empty dealUserName}">
										${dealUserName }
								</c:if>
								</span>
						</c:if>
						<c:if test="${project.transferType ==1}">
							<label class="control-label x140">成交人数：</label> 
							<span>
								${cfmright.cfmRightUserNumbers} 人
							</span>
						</c:if>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">挂牌金额：</label> 
						<span><fmt:formatNumber value="${project.projectMoney}" pattern="0.00"/> 元</span>
					</td>
					<td>
						<label class="control-label x140">成交价格：</label> 
						<span><fmt:formatNumber value="${cfmright.cfmRightMoney}" pattern="0.00"/> 元</span>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x140">转让方应得金额：</label> 
						<span><fmt:formatNumber value="${handleMoney}" pattern="0.00"/> 元</span>
					</td>
				</tr>
				<tr>
					<td colspan="2">
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
				<tr>
					<td>
						<label class="control-label x140">放款状态：</label> 
						<span>${project.getReleaseStatusDesc() }</span>
					</td>
					<td> 
						<c:if test="${project.releaseStatus !=0 && project.releaseStatus != 1  }">
						<label class="control-label x140">放款时间：</label> 
						<span><fmt:formatDate value="${project.releaseMoneyTime}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
						</c:if>
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
								<a href="<%=request.getContextPath()%>/debt/proissue/settle/applyhistory.do?relationId=${project.id}" data-toggle="dialog" data-width="800"  
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
								<a href="<%=request.getContextPath()%>/debt/proissue/settle/applyhistory.do?relationId=${project.id}" data-toggle="dialog" data-width="800"  
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
				<c:if test="${!isCanRelease}">
					<tr>
					<td  colspan="2">
					<span style="color:red;">注：项目不可放款的原因：成交方没有支付尾款。</span>
					</td>
				</tr>
				</c:if>
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
