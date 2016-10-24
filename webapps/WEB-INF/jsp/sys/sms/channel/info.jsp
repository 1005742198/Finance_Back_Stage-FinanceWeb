<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 录入消息 -->
<div class="bjui-pageContent">
		 <table class="table table-condensed table-hover" width="100%">
		 	<tbody>
				<tr>
					<td>
						<label class="control-label x130" >通道名称：</label> 
						${obj.channelName}
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x130">优先级：</label> 
						${obj.priority}
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x130">通道URL：</label> 
						${obj.channelUrl}
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x130">用户名：</label> 
						${obj.userName}
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x130">密码：</label> 
						${obj.password}
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x130">AppId：</label> 
						${obj.appId}
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x130">accountSid：</label> 
						${obj.accountSid}
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x130">authToken：</label> 
						${obj.authToken}
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x130">是否启用：</label> 
						<c:if test ="${obj.useEnabled == 1 }">
							启用
						</c:if>
						<c:if test ="${obj.useEnabled == 0 }">
							未启用
						</c:if>
					</td>
				</tr>
				<tr>
					<td align="center">
		    			<button type="button" class="btn-close">关闭</button>
					</td>
				</tr>
		 </table>
</div>
