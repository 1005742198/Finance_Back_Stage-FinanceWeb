<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 核保通过后，放款 -->
<div class="bjui-pageContent" id="pro-doreleasemoney">
		 <table class="table table-condensed table-hover" width="100%">
		 	<tbody>
				<tr>
					<td>
						<label class="control-label x140">项目编号：</label> 
						<input type="hidden" name="projectId" value="${project.id }">
						<span>${project.projectCode }</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">项目名称：</label> 
						<span>${project.projectName }</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">成交金额：</label> 
						<span><fmt:formatNumber value="${cfmright.cfmRightMoney }" pattern="0.00"/> 元</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">转让费用：</label> 
						<span><fmt:formatNumber value="${sumFee }" pattern="0.00"/> 元</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">放款审核时间：</label> 
						<span><fmt:formatDate value="${release.auditTime }" pattern="yyyy-MM-dd HH:mm:ss"/></span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">放款人：</label> 
						<span>${release.createOperatorName }</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">审核意见：</label> 
						<span>${release.releaseRemarke }</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">放款金额：</label> 
						<span><fmt:formatNumber value="${handleMoney }" pattern="0.00"/> 元</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">放款状态：</label> 
						<span>${project.getReleaseStatusDesc() }</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">转让方：</label> 
						<span>${project.loanUserName }</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">收款账号：</label> 
						<span>${project.cardAccount }</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">收款银行：</label> 
						<span>${project.bankChannelName }</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">收款银行开户行：</label> 
						<span>${project.subBankName }</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">放款申请历史：</label> 
						<a href="<%=request.getContextPath()%>/fasset/proissue/settle/applyhistory.do?relationId=${project.id}" data-toggle="dialog" data-width="800"  
   				data-height="600" data-id="applyhistory" data-mask="true">点击查看</a>
					</td>
				</tr>
		 </table>
</div>
