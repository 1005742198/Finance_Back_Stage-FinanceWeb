<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 录入消息 -->
<div class="bjui-pageContent">
	<form id="msgadd" action="<%=request.getContextPath()%>/message/manage/editmsg.do" data-toggle="validate" data-reload-navtab="true" data-confirm-msg="确定要保存吗？" data-callback="addMsgCallback">
		 <table class="table table-condensed table-hover" width="100%">
		 	<tbody>
				<tr>
					<td colspan="2">
						<label class="control-label x130">消息标题：</label> 
						<input type="hidden" name="id" value="${msgSystem.id }"/>
						<input type="text" name="msgTitle" value="<c:out value='${msgSystem.msgTitle}'/>" size="40">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x130">消息摘要：</label> 
						<input type="text" name="msgSummary" value="<c:out value='${msgSystem.msgSummary}'/>" size="40">
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x130">消息生效时间：</label> 
						<input type="text" name="effectiveDate"  data-toggle="datepicker"
							value="<fmt:formatDate value="${msgSystem.effectiveDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
							data-pattern="yyyy-MM-dd HH:mm:ss" data-nobtn="true" data-min-date="{%y}-%M-%d" data-max-date="{%y+2}-%M-{%d+1}" data-rule="失效时间:required;">
					</td>
					<td>
						<label class="control-label x130">消息失效时间：</label> 
						<input type="text" name="expireDate"  data-toggle="datepicker" 
							value="<fmt:formatDate value="${msgSystem.expireDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
							data-pattern="yyyy-MM-dd HH:mm:ss" data-nobtn="true" data-min-date="{%y}-%M-%d" data-max-date="{%y+2}-%M-{%d+1}" data-rule="失效时间:required;datetime;match[gt, effectiveDate, date]">
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
						<select name="isTop" id="select3" data-toggle="selectpicker" class="show-tick" style="display: none;">
							<c:forEach var="item" items="${isTopDesc}" varStatus="status">
								<option value="${item.value}" <c:if test="${msgSystem.isTop==item.value }">selected</c:if>>${item}</option>
							</c:forEach>
						</select>
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
					<td colspan="2">
						<textarea data-toggle="kindeditor" style="width:100%" name="msgText"><c:out value='${msgSystem.msgText }'/></textarea>
					</td>
				</tr>
				<tr>
					<td align="center" colspan="2">
		    			<button type="submit" class="btn btn-blue">保存</button>
		    			<button type="button" class="btn-close">关闭</button>
					</td>
				</tr>
		 </table>
	</form>
</div>