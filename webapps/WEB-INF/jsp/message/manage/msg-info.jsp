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
						<label class="control-label x130">消息标题：</label> 
						${msgSystem.msgTitle}
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x130" >消息摘要：</label> 
						${msgSystem.msgSummary}
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x130">消息生效时间：</label> 
						<fmt:formatDate value="${msgSystem.effectiveDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
					</td>
					<td>
						<label class="control-label x130">消息失效时间：</label> 
						<fmt:formatDate value="${msgSystem.expireDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x130">消息类型：</label> 
						${msgSystem.getMsgTypeDesc() }
					</td>
					<td>
						<label class="control-label x130">消息管理类型：</label> 
						${msgSystem.getMsgManageTypeDesc() }
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x130">是否置顶：</label> 
						${msgSystem.getIsTopDec() }
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x130">接收消息人员：</label>
						<c:forEach var="obj" items="${userList}" varStatus="stat">
						${obj.userName }<c:if test="${!stat.last }">,</c:if>
						</c:forEach>
				</tr>
				<tr>
					<td colspan="2"><label class="control-label x130">消息内容：</label>
						<span>${msgSystem.msgText }</span>
					</td>
				</tr>
				<tr>
					<td align="center" colspan="2">
		    			<button type="button" class="btn-close">关闭</button>
					</td>
				</tr>
		 </table>
</div>
