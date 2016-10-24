<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
function afterDopay(json){
	if(json.statusCode == 200){
		$(this).alertmsg("correct", json.message, {autoClose:false,okCall:function(){$(this).dialog("closeCurrent");$(this).navtab("refresh");}});
	}else{
		$(this).alertmsg("error", json.message);
	}
}
</script>
<!--发起费用结算 -->
<div class="bjui-pageContent" id="fasset-pro-dobrokenmoney">
	<form action="<%=request.getContextPath()%>/fee/settle/dopay.do" data-toggle="validate" data-confirm-msg="确定要划款？" data-callback="afterDopay">
		 <input type="hidden" name="feeId" value="${payApply.id }">
		 <table class="table table-condensed table-hover">
		 	<tbody>
				<tr>
					<td>
						<label class="control-label x150">会员名称：</label> 
						<span><c:if test="${payApply.userId!=0 }">${payApply.userName }</c:if><c:if test="${payApply.userId==0 }">${payApply.exchangeName }</c:if></span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x150">项目费用周期：</label> 
						<span><fmt:formatDate value="${payApply.feePeriodStart }" pattern="yyyyMMdd"/>--<fmt:formatDate value="${payApply.feePeriodEnd }" pattern="yyyyMMdd"/></span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x150">项目个数：</label> 
						<span>${payApply.projectNumber }</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x150">项目融资/成交总金额：</label> 
						<span><fmt:formatNumber value="${payApply.projectTotalMoney }" pattern="0.00"/> 元</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x150">费用总金额：</label> 
						<span><fmt:formatNumber value="${payApply.feeTotalMoney }" pattern="0.00"/> 元</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x150">已结算费用金额：</label> 
						<span><fmt:formatNumber value="${payApply.paidFeeMoney }" pattern="0.00"/> 元</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x150">收款人：</label>
						<input type="hidden" value="${accountName }" name="accountName"/>
						<span>${accountName }</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x150">收款账号：</label> 
						<input type="hidden" value="${accountNumber }" name="accountNumber"/>
						<span>${accountNumber }</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x150">审核意见：</label> 
						 <textarea cols="40" rows="4" data-toggle="autoheight" data-rule="required;length[~200, true]" name="auditRemark"></textarea>
					</td>
				</tr>
				<tr>
					<td align="center" >
						<button type="submit" class="btn-blue" >确认划款</button>
	    				<button type="button" class="btn-close" data-icon="close">关闭</button>
					</td>
				</tr>
		 </table>
	</form>
</div>
