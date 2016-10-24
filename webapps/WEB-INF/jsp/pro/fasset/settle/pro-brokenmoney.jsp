<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!--违约金划付 -->
<div class="bjui-pageContent" id="fasset-pro-dobrokenmoney">
	<form action="<%=request.getContextPath()%>/fasset/proissue/settle/dobrokenmoney.do" data-toggle="validate" data-confirm-msg="确定要划款？" data-callback="afterBroken">
		 <input type="hidden" name="id" value="${obj.id }">
		 <table class="table table-condensed table-hover" width="100%">
		 	<tbody>
				<tr>
					<td colspan="2">
						<label class="control-label x140">违约金：</label> 
						<span><fmt:formatNumber value="${obj.breakPayMoney }" pattern="0.00"/> 元</span>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x140">违约方：</label> 
						<span>成交方违约</span>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x140">违约金划付：</label> 
						<span>成交方违约，线上将违约金划给转让方</span>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x140">违约金收款人：</label> 
						<span>${obj.receiverRealName }</span>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x140">收款账号：</label> 
						<span>${obj.receiverCardAccount }</span>
						<label class="control-label x140">收款银行：</label> 
						<span>${bankName}</span>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x140">收款银行开户行：</label> 
						<span>${obj.receiverSubBankName }</span>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x140">审核意见：</label> 
						<c:choose>
							<c:when test="${obj.breakPayStatus == 1 || obj.breakPayStatus == 4}">
								<textarea cols="40" rows="4"  data-rule="required;length[~200, true]" name="breakRemark">${obj.breakRemark}</textarea>
							</c:when>
							<c:otherwise>
								<textarea cols="40" rows="4"  disabled="disabled">${obj.breakRemark}</textarea>
							</c:otherwise>
						</c:choose>
						
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x140">划款状态：</label> 
						<span>${obj.getBreakPayStatusDesc() }</span>
					</td>
				</tr>
				<c:if test="${obj.breakPayStatus == 3}">
					<tr>
					<td colspan="2">
						<label class="control-label x140">划款时间：</label> 
						<span><fmt:formatDate value="${obj.updateTime }" pattern="yyyy-MM-dd HH:mm:ss"/></span>
					</td>
				</tr>
				</c:if>
				
				<tr>
					<td align="center"  colspan="2">
						<c:if test="${obj.breakPayStatus != 2 && obj.breakPayStatus != 3}">
						<button type="submit" class="btn-blue" >确认划款</button>
						</c:if>	
	    				<button type="button" class="btn-close" data-icon="close">关闭</button>
					</td>
				</tr>
		 </table>
	</form>
</div>
<script>
function afterBroken(json){
	if(json.statusCode == 200){
		$(this).alertmsg("correct", json.message, {autoClose:false,okCall:function(){$(this).bjuiajax('refreshDiv', 'brokenMoney');}});
	}else{
		$(this).alertmsg("error", json.message);
	}
}

</script>
