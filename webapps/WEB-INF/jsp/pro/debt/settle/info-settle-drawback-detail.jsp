<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 退款详情 -->
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
						<label class="control-label x140">总退款金额：</label> 
						<span><fmt:formatNumber value="${drawbackMoneySum}" pattern="0.00"/> 元</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">退款审核时间：</label> 
						<span><fmt:formatDate value="${drawback.auditTime}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">退款人：</label> 
						<span>${operator }</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">审核意见：</label> 
						<span>${drawback.adutiRemarke}</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">已退款金额：</label> 
						<span><fmt:formatNumber value="${drawbackMoney}" pattern="0.00"/> 元</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">退款状态：</label> 
						<span>${project.getDrawbackStatusDesc()}</span>
					</td>
				</tr>
		 </table>
	</form>
</div>
