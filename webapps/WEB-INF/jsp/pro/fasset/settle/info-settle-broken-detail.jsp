<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 退款详情 -->
<div class="bjui-pageContent" id="pro-dodrawback">
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
						<label class="control-label x140">违约金划付：</label> 
						<span>${obj.getBrokenDesc() }</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">违约金金额：</label> 
						<span>${obj.breakPayMoney }元</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">审核时间：</label> 
						<span><fmt:formatDate value="${cfmRight.breakAduitTime}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">划款人：</label> 
						<span>${operator }</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">审核意见：</label> 
						<span>${obj.breakRemark }</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">已划款金额：</label> 
						<span><c:if test="${obj.breakPayStatus==2 }">${obj.breakPayMoney }元</c:if></span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x140">划款状态：</label> 
						<span>${obj.getBreakPayStatusDesc() }</span>
					</td>
				</tr>
				
		 </table>
</div>
