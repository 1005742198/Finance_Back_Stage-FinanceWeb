<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 录入消息 -->
<div class="bjui-pageContent">
		 <table class="table table-condensed table-hover" width="100%">
		 	<tbody>
				<tr>
					<td colspan="2">
						<label class="control-label x110">策略名称：</label> 
						${obj.policyName}
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x110 pull-left">短信类型：</label> 
						<div class="pull-left" style="width:800px;">
						<c:forEach var="obj" items="${sysSmsTypeList}" varStatus="status">
							<%-- <c:if test="${status.index %2 == 0}"> --%><p><%-- </c:if> --%>
								<input value="${obj.id }" <c:if test="${obj.open}"> checked </c:if>  disabled="disabled"  type="checkbox" data-label="${obj.typeName }" name="smsTypeCheckbox" id="smsTypeCheckbox.${status.index+1}" data-toggle="icheck">
			    			<%-- <c:if test="${status.index%2 != 0}"> --%></p><%-- </c:if> --%>
			    		</c:forEach>
						</div>
					</td>
				</tr>
					<tr>
						<td colspan="2">
							<label class="control-label x110">排除手机号段：</label> 
							${obj.excludePhoneSegment}
							<%-- <input type="text" name="excludePhoneSegment" value="<c:out value='${obj.excludePhoneSegment}'/>" size="20"> --%>
						</td>
						<!-- <td>
							<label class="control-label x130" >规则说明：</label> 
							1、手机号段以英文逗号分开，例如:135,136
						</td> -->
					</tr>
					<tr>
						<td colspan="2">
							<label class="control-label x110 pull-left">短信通道：</label> 
							<div class="pull-left" style="width:800px;">
								<c:forEach var="obj" items="${sysSmsChannelList}" varStatus="status">
									<%-- <c:if test="${status.index %2 == 0}"> --%><p><%-- </c:if> --%>
									<input value="1" <c:if test="${obj.open}"> checked </c:if> type="checkbox" disabled="disabled"  data-label="${obj.channelName }" name="smsChannel" id="channel.${status.index+1}" data-toggle="icheck">
					    			<%-- <c:if test="${status.index%2 != 0}"> --%></p><%-- </c:if> --%>
					    		</c:forEach>
							</div>
						</td>
					</tr>
				<tr>
					<td align="center" colspan="2">
		    			<button type="button" class="btn-close">关闭</button>
					</td>
				</tr>
		 </table>
</div>
