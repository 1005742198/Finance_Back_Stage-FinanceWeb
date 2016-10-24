<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 录入消息 -->
<div class="bjui-pageContent">
	<form id="msgadd" action="<%=request.getContextPath()%>/syssmspolicy/add.do" data-toggle="validate" data-reload-navtab="true" data-confirm-msg="确定要保存吗？" data-callback="addMsgCallback">
		 <input type="hidden" name="id" value="${obj.id }">
		 <input type="hidden" name="smsType" id="smsType">
		 <input type="hidden" name="smsSendPolicy" id="smsSendPolicy">
		 <table class="table table-condensed table-hover" width="100%">
		 	<tbody>
				<tr>
					<td>
						<label class="control-label x110">策略名称：</label> 
						<input type="text" name="policyName" maxlength="99"  value="<c:out value='${obj.policyName}'/>" size="20"><span style="color:red">&nbsp;&nbsp;*</span>
					</td>
					<td>
						<label class="control-label x110" >规则说明：</label> 
						1、短信类型必选，手机号段非必填项
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x110 pull-left" style="margin-top:5px;">短信类型：</label> 
						<div class="pull-left" style="width:800px;">
						<p>
							<input value="1" <c:if test="${not empty checkAll}">checked</c:if> type="checkbox" data-toggle="icheck" data-label="全选" name="smsTypeCheckAll">
						</p>
						<c:forEach var="obj" items="${sysSmsTypeList}" varStatus="status">
							<%-- <c:if test="${status.index %2 == 0}"> --%><p><%-- </c:if> --%>
								<input value="${obj.typeId }" type="checkbox" data-label="${obj.typeName }" name="smsTypeCheckbox" id="smsTypeCheckbox.${status.index+1}" data-toggle="icheck"><!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
			    			<%-- <c:if test="${status.index%2 != 0}"> --%></p><%-- </c:if> --%>
			    		</c:forEach>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x110 pull-left" style="margin-top:5px;">排除手机号段：</label> 
						<div class="pull-left">
							<textarea cols="60" maxlength="499" rows="6" data-toggle="autoheight" data-rule="length[~500, true]"  id="excludePhoneSegment" name="excludePhoneSegment">${obj.excludePhoneSegment}</textarea>
						</div>
						<label class="control-label" >规则说明：</label> <br/>
						1、手机号段以英文逗号分开，例如:135,136
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label class="control-label x110 pull-left" style="margin-top:5px;">短信通道：</label> 
						<div class="pull-left" style="width:800px;display:inline;">
							<p>
								<input value="0"  type="checkbox" data-toggle="icheck" data-label="全选" name="smsChannelCheckAll">
							</p>
							<c:forEach var="obj" items="${sysSmsChannelList}" varStatus="status">
								<%-- <c:if test="${status.index %2 == 0}"> --%><p><%-- </c:if> --%>
									<input value="${obj.id }" type="checkbox" data-label="${obj.channelName }" name="smsChannelCheckbox" id="channel.${status.index+1}" data-toggle="icheck"><!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
				    			<%-- <c:if test="${status.index%2 != 0}"> --%></p><%-- </c:if> --%>
				    		</c:forEach>
						</div>
					</td>
				</tr>
				<tr>
					<td align="center" colspan="2">
		    			<button type="submit" id="submitButton" class="btn btn-blue">保存</button>
		    			<button type="button" class="btn-close">关闭</button>
					</td>
				</tr>
		 </table>
	</form>
</div>
<script>

//------短信通道begin------
$('input[name="smsChannelCheckAll"').on('ifChanged', smsChannelCheckAllChange);
function smsChannelCheckAllChange (){
	if($("input[name='smsChannelCheckAll'").attr("checked") == "checked") {
		$('input[name="smsChannelCheckbox"]').iCheck('check');
	}else {
		$('input[name="smsChannelCheckbox"]').iCheck('uncheck');
	}
}
$('input[name="smsChannelCheckbox"').on('ifUnchecked', function(event){
	$('input[name="smsChannelCheckAll"').off('ifChanged');
	$('input[name="smsChannelCheckAll"]').iCheck('uncheck');
	$('input[name="smsChannelCheckAll"').on('ifChanged',smsChannelCheckAllChange);
});
$('input[name="smsChannelCheckbox"').on('ifChecked', function(event){
	var flag =0;
	$("input[name='smsChannelCheckbox']").each(function(){
		//如果有未选中的
		if(!$(this).attr("checked")){
			flag = 1;
		}
	});
	if(flag == 0) {
		//全部选中
		$('input[name="smsChannelCheckAll"').off('ifChanged');
		$('input[name="smsChannelCheckAll"]').iCheck('check');
		$('input[name="smsChannelCheckAll"').on('ifChanged',smsChannelCheckAllChange);
	}
});
//------短信通道end------

//------短信类型begin------

$('input[name="smsTypeCheckAll"').on('ifChanged', smsTypeCheckAllChange);

function smsTypeCheckAllChange (){
	if($("input[name='smsTypeCheckAll'").attr("checked") == "checked") {
		$('input[name="smsTypeCheckbox"]').iCheck('check');
	}else {
		$('input[name="smsTypeCheckbox"]').iCheck('uncheck');
	}
}
$('input[name="smsTypeCheckbox"').on('ifUnchecked', function(event){
	$('input[name="smsTypeCheckAll"').off('ifChanged');
	$('input[name="smsTypeCheckAll"]').iCheck('uncheck');
	$('input[name="smsTypeCheckAll"').on('ifChanged',smsTypeCheckAllChange);
});
$('input[name="smsTypeCheckbox"').on('ifChecked', function(event){
	var flag =0;
	$("input[name='smsTypeCheckbox']").each(function(){
		//如果有未选中的
		if(!$(this).attr("checked")){
			flag = 1;
		}
	});
	if(flag == 0) {
		//全部选中
		$('input[name="smsTypeCheckAll"').off('ifChanged');
		$('input[name="smsTypeCheckAll"]').iCheck('check');
		$('input[name="smsTypeCheckAll"').on('ifChanged',smsTypeCheckAllChange);
	}
});
//------短信类型end------

$('#msgadd').validator({
	rules: {
		smsTypeCheckbox:function(){
			var flag =0;
			$("input[name='smsTypeCheckbox']").each(function(){
				if($(this).attr("checked")){
					flag = 1;
				}
			});
			if(flag == 0) {
				return "请至少选择一种短信类型";
			}
		}
	},
	fields: {
		'smsTypeCheckbox':'required;smsTypeCheckbox',
		'policyName':'required;remote(<%=request.getContextPath()%>/syssmspolicy/valid.do, id)'
    } 
}).on('click','#submitButton',function(e){
	var smsType = "";
	$('input[type="checkbox"][name="smsTypeCheckbox"]').each(
			function() {
				if($(this).attr("checked") == "checked") {
	            	smsType=smsType+","+$(this).val();
	        	}
            }
        );
	if(smsType.length > 1) {
		$("#smsType").val(smsType+",");
	}
	var smsSendPolicy = "";
	$('input[type="checkbox"][name="smsChannelCheckbox"]').each(
			
			function() {
            	if($(this).attr("checked") == "checked") {
            		smsSendPolicy=smsSendPolicy+","+$(this).val(); 
            	}
            }
        );
	if(smsSendPolicy.length > 1) {
		$("#smsSendPolicy").val(smsSendPolicy+",");
	}
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
</script>