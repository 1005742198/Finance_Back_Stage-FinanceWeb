<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 录入消息 -->
<div class="bjui-pageContent">
	<form id="msgadd" action="<%=request.getContextPath()%>/syssmschannel/update.do" data-toggle="validate" data-reload-navtab="false" data-callback="afterEditChannelCallBack">
		 <input type="hidden" name="id" value="${obj.id }">
		 <table class="table table-condensed table-hover" width="100%">
		 	<tbody>
				<tr>
					<td>
						<label class="control-label x110" >通道名称：</label> 
						<input type="text" name="channelName" maxlength="200" data-rule="required;remote(<%=request.getContextPath()%>/syssmschannel/valid.do, id)"  data-msg-range="请输入通道名称" value="<c:out value='${obj.channelName}'/>" size="20"><span style="color:red">&nbsp;&nbsp;*</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x110">优先级：</label> <!--   -->
						<input type="text" name="priority" value="<c:out value='${obj.priority}'/>" data-rule="优先级:required;integer[+];range[~10000];" data-msg-range="请输入小于10000的整数" size="20"><span style="color:red">&nbsp;&nbsp;*</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x110">通道URL：</label> 
						<input type="text" name="channelUrl" id="channelUrl" maxlength="250" data-rule="required;"  value="<c:out value='${obj.channelUrl}'/>" size="43"><span style="color:red">&nbsp;&nbsp;*</span>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x110">用户名：</label> 
						<input type="text" name="userName" maxlength="100" value="<c:out value='${obj.userName}'/>" size="43">
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x110">密码：</label> 
						<input type="text" name="password" maxlength="100" value="<c:out value='${obj.password}'/>" size="43">
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x110">AppId：</label> 
						<input type="text" name="appId" maxlength="100" value="<c:out value='${obj.appId}'/>" size="43">
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x110">accountSid：</label> 
						<input type="text" name="accountSid" maxlength="100" value="<c:out value='${obj.accountSid}'/>" size="43">
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x110">authToken：</label> 
						<input type="text" name="authToken" maxlength="100" value="<c:out value='${obj.authToken}'/>" size="43">
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x110">启用：</label> 
						<input value="1" <c:if test="${obj.useEnabled==1}">checked</c:if> type="checkbox" name="useEnabled" id="useEnabled" data-toggle="icheck" value="true">
					</td>
				</tr>
				<tr>
					<td align="center">
		    			<button type="submit" class="btn btn-blue">保存</button>
		    			<button type="button" class="btn-close">关闭</button>
					</td>
				</tr>
		 </table>
	</form>
</div>
<script>
$('#msgadd').validator({
	rules: {
	},
	fields: {
		'channelUrl':'required',
		'channelName':'required;remote(<%=request.getContextPath()%>/syssmschannel/valid.do, id)',
		'priority':'优先级:required;integer[+];range[~10000];'
    } 
}).on('click','#submitButton',function(e){
})


function afterEditChannelCallBack(json){
	if(json.statusCode == 200) {
		$(this).alertmsg("correct", json.message,{autoClose:false,okCall:function(){
			$(this).dialog("closeCurrent");
			$(this).navtab("refresh");
		}});
	}else {
		$(this).alertmsg("error", json.message,{okCall:function(){
			if(json.message == "通道信息不存在，请刷新列表后重试") {
				$(this).dialog("closeCurrent");
				$(this).navtab("refresh");
			}
		}});
	}
}
</script>