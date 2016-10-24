<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
function afterDrawback(json){
	if(json.statusCode == 200){
		$(this).alertmsg("correct", json.message, {autoClose:false,okCall:function(){$(this).dialog("closeCurrent");$(this).navtab("refresh");}});
	}else{
		$(this).alertmsg("error", json.message);
	}
}
</script>
<!-- 执行退款审核 -->
<div class="bjui-pageContent" id="pro-dodrawback">
	<form action="<%=request.getContextPath()%>/fasset/proissue/settle/drawback.do" data-toggle="validate" data-confirm-msg="确定退款？" data-callback="afterDrawback" >
		 <input type="hidden" name="projectId" value="${project.id}">
		 <table class="table table-condensed table-hover" >
		 	<tbody>
				<tr>
					<td>
						<label style="color:red">注：如果项目存在没有支付结果的订单，则无法进行退款！</label>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">退款事由：</label> 
						<span>
						${project.getRefundDesc() }
						</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">退款总金额：</label> 
						<span><fmt:formatNumber value="${cfmRight.unRightMoney}" pattern="0.00"/> 元</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">已退款金额：</label> 
						<span><fmt:formatNumber value="${backedMoney}" pattern="0.00"/> 元</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">退款中金额：</label> 
						<span><fmt:formatNumber value="${backingMoney}" pattern="0.00"/> 元</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">未退款金额：</label> 
						<input type="hidden" name="drawbackMoney" value="${drawback.drawbackMoney}">
						<input type="hidden" name="drawbackUserNumbers" value="${drawback.drawbackUserNumbers}">
						<span><fmt:formatNumber value="${drawback.drawbackMoney}" pattern="0.00"/> 元</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">退款状态：</label> 
						<span>${project.getDrawbackStatusDesc()}</span>
					</td>
				</tr>
				
				<c:if test="${cfmRight.drawbackStatus != 0 }">
					<tr>
					<td>
						<label class="control-label x140">审核意见：</label> 
						<c:choose>
							<c:when test="${cfmRight.drawbackStatus == 2 || cfmRight.drawbackStatus == 3  }">
								<textarea cols="40" rows="4" readonly="readonly">${drawback.adutiRemarke}</textarea>
							</c:when>
							<c:otherwise>
								<textarea cols="40" rows="4" data-rule="required;length[~200, true]" name="drawbackRemarke"></textarea>
							</c:otherwise>
						</c:choose>
						
					</td>
				</tr>
				</c:if>
				
				<tr>
					<td align="center">
					<c:if test="${drawback.drawbackMoney!=0 && cfmRight.isCanDrawback()}">
						<button type="submit" class="btn-blue" >确认退款</button>
					</c:if>
	    			<button type="button" class="btn-close" data-icon="close">关闭</button>
					</td>
				</tr>
		 </table>
	</form>
</div>
<c:if test="${not empty drawbackList }">
<%@ include file="/WEB-INF/jsp/pro/fasset/settle/pro-drawbacklist.jsp" %>
</c:if>
