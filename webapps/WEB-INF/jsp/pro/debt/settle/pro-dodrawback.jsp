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
	<form action="<%=request.getContextPath()%>/debt/proissue/settle/drawback.do" data-toggle="validate" data-confirm-msg="确定退款？" data-callback="afterDrawback" >
		 <table class="table table-condensed table-hover" >
		 	<tbody>
				<tr>
					<td>
					<input type="hidden" value="${project.id }"  name="projectId"/>
						<label class="control-label x140">项目编号：</label> 
						
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
						<label class="control-label x140">退款事由：</label> 
						<span>
						${project.getRefundDesc() }
						</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">退款总金额：</label> 
						<span><fmt:formatNumber value="${cfmright.unRightMoney}" pattern="0.00"/> 元</span>
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
						<label class="control-label x140">已退款金额：</label> 
						<span><fmt:formatNumber value="${backedMoney}" pattern="0.00"/> 元</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">涉及退款金额：</label> 
						<input type="hidden" name="drawbackMoney" value="${drawback.drawbackMoney}">
						<span><fmt:formatNumber value="${drawback.drawbackMoney}" pattern="0.00"/> 元</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">涉及收款方总数：</label> 
						<input type="hidden" name="drawbackUserNumbers" value="${drawback.drawbackUserNumbers}">
						<span><fmt:formatNumber value="${drawback.drawbackUserNumbers}"/> 人</span>
					</td>
				</tr>
				<c:if test="${drawback.drawbackMoney > 0 }">
				<tr>
					<td>
						<label class="control-label x140">审核意见：</label> 
						<textarea cols="40" rows="4"  data-rule="required;length[~200, true]" name="drawbackRemarke" ></textarea>
					</td>
				</tr>
				</c:if>
				<tr>
					<td align="center">
					<c:if test="${drawback.drawbackMoney > 0 }">
						<button type="submit" class="btn-blue">确认退款</button>
					</c:if>
	    			<button type="button" class="btn-close" data-icon="close">关闭</button>
					</td>
				</tr>
		 </table>
	</form>
</div>
