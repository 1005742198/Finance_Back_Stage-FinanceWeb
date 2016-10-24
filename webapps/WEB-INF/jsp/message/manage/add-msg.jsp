<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 录入消息 -->
<div class="bjui-pageContent">
	<form id="msgadd" action="<%=request.getContextPath()%>/message/manage/addmsg.do" data-toggle="validate" data-reload-navtab="true" data-confirm-msg="确定要保存吗？" data-callback="addMsgCallback">
		 <table class="table table-condensed table-hover" >
		 	<tbody>
				<tr>
					<td colspan="2">
						<label class="control-label x130">消息标题：</label> 
						<input type="text" name="msgTitle" size="40" data-rule="required;">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x130">消息摘要：</label> 
						<input type="text" name="MsgSummary" size="40" data-rule="required;">
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x130">消息生效时间：</label> 
						<input type="text" name="effectiveDate"  data-toggle="datepicker" 
							data-pattern="yyyy-MM-dd HH:mm:ss" data-nobtn="true" data-min-date="{%y}-%M-%d" data-max-date="{%y+2}-%M-{%d+1}" data-rule="生效时间:required;">
					</td>
					<td>
						<label class="control-label x130">消息失效时间：</label> 
						<input type="text" name="expireDate"  data-toggle="datepicker" 
							data-pattern="yyyy-MM-dd HH:mm:ss" data-nobtn="true" data-min-date="{%y}-%M-%d" data-max-date="{%y+2}-%M-{%d+1}" data-rule="失效时间:required;datetime;match[gt, effectiveDate, date]">
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label x130">消息类型：</label> 
						<select name="msgType" id="select1" data-toggle="selectpicker" class="show-tick" style="display: none;">
							<c:forEach var="item" items="${msgTypeDesc}" varStatus="status">
								<option value="${item.type}">${item}</option>
							</c:forEach>
						</select>
					</td>
					<td>
						<label class="control-label x130">消息机构类型：</label> 
						<select name="msgOrgType" id="select3" data-toggle="selectpicker" class="show-tick" style="display: none;" data-rule="required;" >
							<c:forEach var="item" items="${msgOrgTypeDesc}" varStatus="status">
								<option value="${item.type}">${item}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x130">是否置顶：</label> 
						<select name="isTop" id="select4" data-toggle="selectpicker" class="show-tick" style="display: none;" data-rule="required;">
							<c:forEach var="item" items="${isTopDesc}" varStatus="status">
								<option value="${item.value}">${item}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x130">接收消息人员：</label>
						<input type="hidden" name="t2.users" value="" id="users"/>
						<textarea name="t2.userName" size="70" id="userNames" data-rule="required;" readonly="readonly" data-autoClose="true"></textarea><a
						href="<%=request.getContextPath()%>/message/manage/getucuser.do?msgOrgType={#select3}" data-type="post"
						id="userSelect" data-dynamic="true" data-toggle="lookupbtn" data-group="t2" data-width="800" data-height="500" style="margin-left:10px;font-size: 28px;vertical-align: middle;color: #428bca;"><i class="fa fa-plus-circle"></i></a>
						<!--  
							<input data-toggle="lookup" data-type="post" data-title="机构选择" data-url="<%=request.getContextPath()%>/message/manage/getucuser.do?msgOrgType={#select3}" data-width="600" data-height="400" type="text" name="userName" id="users1">-->
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea data-toggle="kindeditor" style="width:100%" name="msgText" data-rule="required;">消息内容</textarea>
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
<script type="text/javascript">
$('#users').on('afterchange.bjui.lookup', function(e, data) {
	$('#userSelect').data('data', {"userIds":data.users});
})

function addMsgCallback(json){
	if(json.statusCode == 200) {
		$(this).alertmsg("correct", json.message);
		$(this).dialog("closeCurrent");
		$(this).navtab("refresh");
	}else {
		$(this).alertmsg("error", json.message);
	}
}
$("#select3").on("change", function(){
	$("#userNames").val('');
	//var newUrl = "<%=request.getContextPath()%>/message/manage/getucuser.do?msgOrgType={#select3}";
	//$('#userSelect').data('newurl', newUrl) ;
});
</script>